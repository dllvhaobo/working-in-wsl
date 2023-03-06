#!/usr/bin/env python3

import os
import subprocess
from tabulate import tabulate
from tqdm import tqdm

# 获取当前目录下的所有 git 仓库
def get_git_repos():
    return [d for d in os.listdir('.') if os.path.isdir(d) and os.path.exists(os.path.join(d, '.git'))]

# 获取指定 git 仓库的状态
def get_git_status(repo_path):
    cmd = ['git', '-C', repo_path, 'status', '--porcelain']
    result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
    if result.returncode != 0:
        return None
    output = result.stdout.strip()
    if not output:
        return None
    status = {
        'A': [],
        'M': [],
        'D': [],
        'U': [],
        '??': []
    }
    for line in output.split('\n'):
        s = line.split()
        if len(s) < 2:
            continue
        key = s[0]
        file = ' '.join(s[1:])
        if key not in status:
            status[key] = []
        status[key].append(file)
    return status

# 获取指定 git 仓库的信息
def get_git_info(repo_path):
    cmd = ['git', '-C', repo_path, 'remote', '-v']
    result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
    if result.returncode != 0:
        return None
    output = result.stdout.strip()
    remote = output.split()[0]
    cmd = ['git', '-C', repo_path, 'rev-parse', '--abbrev-ref', 'HEAD']
    result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
    if result.returncode != 0:
        return None
    branch = result.stdout.strip()
    if branch == 'HEAD':
        cmd = ['git', '-C', repo_path, 'describe', '--always']
        result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        if result.returncode != 0:
            return None
        branch = result.stdout.strip()
    return {
        'path': os.path.abspath(repo_path),
        'remote': remote,
        'branch': branch
    }

# 打印 git 仓库的状态
def print_git_status(git_status):
    table = []
    for key in ['A', 'M', 'D', 'U', '??']:
        if key in git_status:
            table += [[key, f"'{file}'"] for file in git_status[key]]
    print(tabulate(table, headers=['Status', 'File'], tablefmt='presto'))

# 获取并打印指定 git 仓库的信息和状态
def print_git_info_and_status(repo_path):
    git_info = get_git_info(repo_path)
    if not git_info:
        return
    print(f"Path: {git_info['path']}")
    print(f"Remote: {git_info['remote']}")
    print(f"Branch: {git_info['branch']}")
    git_status = get_git_status(repo_path)
    if git_status:
        print_git_status(git_status)

# 主程序
def main():
    git_repos = get_git_repos()
    for repo in tqdm(git_repos, desc='Scanning git repos'):
        print_git_info_and_status(repo)

if __name__ == '__main__':
    main()



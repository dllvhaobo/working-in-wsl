#!/usr/bin/env python3

import os
import subprocess
from tabulate import tabulate
from tqdm import tqdm

# 获取当前目录下的所有 git 仓库
#  def get_git_repos():
    #  return [d for d in os.listdir('.') if os.path.isdir(d) and os.path.exists(os.path.join(d, '.git'))]

def get_git_repos():
    repos = []
    
    for root, dirs, files in os.walk('.'):
        if '.git' in dirs:
            repos.append(root)
            dirs.remove('.git')  # 不再进入 .git 子目录
    return repos

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
    remote = output.split()[1]
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

    git_status = get_git_status(repo_path)
    if git_status:
        print()
        print("#"*120)
        print(f"Path: {git_info['path']}")
        print(f"Remote: {git_info['remote']}")
        print(f"Branch: {git_info['branch']}")
        print("#"*120)
        print_git_status(git_status)
        print("-"*120)
        print()
# 主程序
def main():
    git_repos = get_git_repos()
    for repo in tqdm(git_repos,ncols=120, desc='Scanning git repos'):
        print_git_info_and_status(repo)

if __name__ == '__main__':
    main()


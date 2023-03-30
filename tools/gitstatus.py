#!/usr/bin/env python3
import os
import subprocess


def find_git_repos(path):
    git_repos = []
    for root, dirs, files in os.walk(path):
        if ".git" in dirs:
            git_repos.append(root)
            dirs.remove(".git")
    return git_repos  # 检查git仓库状态


def check_git_status(path):
    os.chdir(path)
    status = subprocess.check_output(
        ["git", "status", "--porcelain"]).decode("utf-8")
    if status:
        return status.splitlines()
    else:
        return None  # 分类git仓库状态


def check_git_branch(path):
    os.chdir(path)
    branch = subprocess.check_output(
        ["git", "branch", "--show-current"]).decode("utf-8")

    return branch.splitlines() if branch else None

def check_git_url(path):
    os.chdir(path)
    url = subprocess.check_output(
        ["git", "remote", "get-url","origin"]).decode("utf-8")

    return url.splitlines() if url else None

def classify_git_status(status):
    changes = {"M": [], "D": [], "R": [], "A": [], "U": []}
    for line in status:
        change_type = line[:2]
        file_path = line[3:]
        if change_type in changes:
            changes[change_type].append(file_path)
        else:
            changes["U"].append(file_path)
    return changes


def print_git_status(path, branch,url, changes):
    title = {
        'M': "Modified",
        'D': "Deleted",
        'R': "Renamed",
        'A': "Added",
        'U': "Unktrack"}

    if changes:
        print("")
        repo_dir = "Git repository: {}".format(path)
        print("="*len(repo_dir))
        print(repo_dir)
        print("branch name:{}".format(branch))
        print("remote url:{}".format(url))
        print("="*len(repo_dir))
        for k, v in changes.items():
            if (len(v) > 0):
                print(title.get(k))
                print("-"*80)
                for i in v:
                    print(i)
        print("")


# 查找所有git仓库并检查状态


def check_all_git_repos(path):
    rootpath = os.getcwd()
    git_repos = find_git_repos(path)
    for repo in git_repos:
        status = check_git_status(os.path.join(rootpath, repo))
        branch = check_git_branch(os.path.join(rootpath, repo))
        url = check_git_url(os.path.join(rootpath, repo))
        changes = classify_git_status(status) if status else None
        print_git_status(os.path.realpath(repo), branch,url, changes)  # 测试


check_all_git_repos(".")

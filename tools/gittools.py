#!/usr/bin/env python3

import os
from os.path import exists,dirname
import argparse
#  from logging import Logger
#  from pprint import pprint as print
from git import Repo, repo
from git.cmd import Git


def cmd(*args,**kwargs):
    
    return os.popen(*args,**kwargs).readlines()

def print_title(title, width):
    title_len = len(title)
    blank_size = int((width-title_len)/2) if (width-title_len) > 0 else 2
    print('#'*width)
    print("{}{}".format(' '*blank_size, title))
    print('#'*width)

class GitTool():
    def __init__(self, **kwargs) -> None:
        self.kwargs = kwargs
        self.repo_list = []
        self.repo_modified = []
        pass

    def retrieve_repo_list(self ):
        repo_dir_list = list(
            os.popen("find {workspace} -name .git".format(**self.kwargs)).readlines())
        self.repo_list = [Repo(dirname(x)) for x in repo_dir_list ]

    def list_modified_repo(self):
        self.repo_modified = [ x for x in self.repo_list if x.is_dirty()]
        
        print_title('MODIFED WORKING DIRECTORY',120)
        for x in self.repo_modified:

            print("#"*120)
            print("    DIR:{}".format(x.working_dir))
            print("    URL:{}".format(list( x.remote().urls )))
            print("#"*120)
            git = Git(x)
            status = git.status()
            print(status.strip("\t\n"))
            print("-"*120)
        
        return


    def process(self):
        self.retrieve_repo_list()
        return




def config():
    parser = argparse.ArgumentParser(description='Parameters')
    parser.add_argument('-w', '--workspace', type=str, default="{PWD}/".format(
        PWD=os.environ.get("PWD")), help='在指定的工作目录下执行相关git操作, 不指定时默认使用当前目录')
    parser.add_argument('--status', default=False,
                        action='store_true', help='递归所有git仓库的status')

    return vars(parser.parse_args())


def entry():
    cfg = config()
    gt = GitTool(**cfg)
    gt.process()
    gt.list_modified_repo()



if __name__ == "__main__":

    entry()

    exit(0)

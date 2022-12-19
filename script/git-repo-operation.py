#/usr/bin/env python3

import os
import argparse


#  def get_repos(kwargs):
#      return os.popen("find {root} -name .git ".format(**kwargs))


def config():
    parser = argparse.ArgumentParser(description='Parameters')
    parser.add_argument('-r', '--root', help='root folder',
                        default=os.environ.get('PWD'))
    parser.add_argument('-o', '--operation', type=str,
                        help='Operation for each repo')
    return vars(parser.parse_args())


def entry():
    cfg = config()
    print(cfg)
    #  repo_list = get_repos(cfg)
    #  print(repo_list)


if __name__ == "__main__":
    entry()

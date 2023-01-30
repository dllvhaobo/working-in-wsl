#!/usr/bin/env python3
import sys


import os
from pprint import pprint as print
import argparse
import string


'''
查找所有状态机xml文件，并拷贝
'''


def find_export_xml(**kwargs):
    return os.popen("find {source} -name export.xml".format(**kwargs))


def get_opts():
    parser = argparse.ArgumentParser(
        description='查找指定目录内的所有的export.xml文件，并拷贝到目标目录')

    parser.add_argument('-s', '--source', type=str,
                        help='查找文件的根目录', required=True)

    parser.add_argument('-d', '--dest', type=str,
                        help='拷贝export.xml到目标目录', required=True)

    return vars(parser.parse_args())


def convert_path_to_filename(filepath, **kwargs):

    def removepreffix(src, prefix):
        if prefix is None:
            return src
        else:
            idx = str.find(src, prefix)
            if (idx < 0):
                return src
            else:
                return src[idx+len(prefix)+1:]

    def removesuffix(src, suff):
        if suff is None:
            return src
        else:
            idx = str.rfind(src, suff)
            if (idx < 0):
                return src
            else:
                return src[:idx]

    path = os.path.dirname(filepath)
    path = removepreffix(path, kwargs.get('source'))
    path = removesuffix(path, '/stm')
    path = path.replace('/', '-')
    print(path)
    return path


if __name__ == "__main__":
    cfg = get_opts()
    dest_dir = cfg.get('dest','./')
    print(dest_dir)
    if not os.path.isdir(dest_dir):
        os.mkdir(dest_dir)

    result = find_export_xml(**cfg)
    for x in result:
        path = convert_path_to_filename(x, **cfg)

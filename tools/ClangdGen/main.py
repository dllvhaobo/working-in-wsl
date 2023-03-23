#!/usr/bin/env python3

import argparse
import traceback
import os
import sys
# 获取当前脚本所在目录
current_dir = os.path.dirname(os.path.abspath(__file__))

# 将同级目录添加到 Python 模块搜索路径
sys.path.append(current_dir)
from pprint import pprint as print
from logger import logger
from BobInfoCache import BobInfoCache
from BobPackage import BobPackage
from ClangdConfig import ClangdConfig

__DEF_PACKAGES__ = [
    'ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target',
    'ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target'
]


def config():
    parser = argparse.ArgumentParser(
        description='在工程根目录下执行，查找指定目录内的所有的compile_commands.json文件，并生成".clang"文件到指定目录')

    parser.add_argument('--packages', type=str, nargs="+", dest='packages', metavar='',
                        default=__DEF_PACKAGES__, help='指定一个或者多个bob编译的package')

    parser.add_argument('--cachefile', metavar='',
                        help="cache文件的路径,默认为当前目录的.clangchage", default='.clangdcache')

    parser.add_argument('--use-cache', dest='use_cache', default=True,
                        action='store_true', help="用之前生成的cache文件解析")

    parser.add_argument('--not-use-cache', dest='use_cache',
                        action='store_false', help="不使用之前生成的cache文件解析")

    parser.add_argument('--save-cache', dest='save_cache', default=True,
                        action='store_true', help="保存所有过程信息，减少下次生成的时间")

    parser.add_argument('--no-save-cache', dest='save_cache',
                        action='store_false', help="不保存所有过程信息，不覆盖当前cache文件")

    parser.add_argument('--recursive-level', type=int, dest='recursive', metavar='',
                        default=1, help="递归查找sub-package的层次")

    parser.add_argument('--build-depends', dest='build_depends', default=False,
                        action='store_true', help="下载并编译sub-package")

    parser.add_argument('--clangfile', type=str, default='.clangd', metavar='',
                        help="默认保存在当前文件夹下.clangd")

    return vars(parser.parse_args())


def main_entry():
    args = config()
    logger.info("arguments {}".format(args))

    #  Cache Infomation
    cache = BobInfoCache(**args)
    cache.load()

    #  Clang Infomation

    try:
        for pkg_name in args.get('packages', list()):
            package = BobPackage(pkg_name, args.get('recursive'), cache, **args)
            package.process()
    except Exception as e:
        logger.error(str(e))
        traceback.print_exc()

    finally:
        cache.dump()

    clanginfo = ClangdConfig(cache,**args)
    clanginfo.process()


def test_entry():
    args = config()
    print(args)


if __name__ == "__main__":
    main_entry()
    #  test_entry()

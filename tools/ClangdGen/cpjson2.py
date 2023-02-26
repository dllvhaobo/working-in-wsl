#!/usr/bin/env python3

import os
import argparse
import traceback
import yaml
import logging
#  from pprint import pprint as print

logging.basicConfig(level=logging.INFO,
                    format='[%(asctime)s %(filename)s:%(lineno)-4d %(funcName)20s ]%(message)s')
logger = logging.getLogger(__name__)

'''
# Readme

## Feature

- 说
- 查找Module的compille_commands.json文件，添加到.clangd
- 查找submodule的compille_commands.json文件，添加到.clangd
- 必要时尝试使用bob dev编译submodule，并生产compile_commands.json，添加到.clangd

## For Develop
- bob dev 时指定的定义为package
- package 依赖的定义为sub-subpackage
- src bob下载代码的路径，通过 `bob  query-path` 可查询
- build bob编译是中间产物的路径，`bob  query-path` 可查询 通常的compile_commands.json保存在此位置
- yaml recipe文件所在路径
'''


__CMD_BOB_QUERY_SRC_PATH__ = "CONFIG_JNN=1 bob query-path -f {{src}} -DCONFIG_JNN=1 {module}"
__CMD_BOB_QUERY_BUILD_PATH__ = "CONFIG_JNN=1 bob query-path -f {{build}} -DCONFIG_JNN=1 {module}"
__CMD_BOB_SHOW__ = "CONFIG_JNN=1 bob show --format=yaml -DCONFIG_JNN=1 {module}"
__CMD_BOB_QUERY_RECIPE__ = "CONFIG_JNN=1 bob query-recipe -DCONFIG_JNN=1 {module}"

__DEF_PACKAGES__ = [
    'ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target',
    'ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target'
]

__CLANG_CFG_PATTERN__ = '''
If:
  PathMatch: "{src}/.*"
CompileFlags:
  CompilationDatabase: "{build}"
'''


def os_popen(cmd_string):
    logger.debug("cmd:{}".format(cmd_string))
    return os.popen(cmd_string)


class Package:
    def __init__(self, name, **kawrgs):
        logger.info("package:{}".format(name))
        self.name = name
        self.kwargs = kawrgs
        self.content = kawrgs.get(self.name)
        logger.debug(self.content)
        self.sub_pkgs = list()
        self.info = self.content.get(
            'info') if self.content is not None else None
        self.depends = self.content.get(
            'depends') if self.content is not None else None
        self.yaml = self.content.get(
            'yaml') if self.content is not None else None
        self.src = self.content.get(
            'src') if self.content is not None else None
        self.build = self.content.get(
            'build') if self.content is not None else None

    def get_info(self):
        if self.info is None:
            cmd_string = __CMD_BOB_SHOW__.format(module=self.name)
            self.info = yaml.full_load(os_popen(cmd_string))
        return self.info

    def get_depends(self):
        if self.depends is None:
            self.depends = self.get_info().get('depends')
        logger.debug("SubModuls: {}".format(self.depends))
        return self.depends

    def get_yaml(self):

        if self.yaml is None:
            cmd_string = __CMD_BOB_QUERY_RECIPE__.format(module=self.name)
            recpie_files_list = os_popen(cmd_string).readlines()
            for i in recpie_files_list:
                if self.yaml is None and i.startswith('recipes'):
                    self.yaml = i.strip('\n')
        logger.debug(self.yaml)
        return self.yaml

    def get_build(self):
        if self.build is None:
            try:
                cmd_string = __CMD_BOB_QUERY_BUILD_PATH__.format(
                    module=self.name)
                work_dir_str = os_popen(cmd_string).readlines()
                work_dir_str = work_dir_str[0].strip('\n')
                self.build = work_dir_str

            except Exception as e:
                logger.error(
                    "Get build dir Failed for with error:'{}'".format(str(e)))
                pass

        logger.debug("build {}".format(self.build))
        return self.build

    def get_src(self):
        if self.src is None:
            try:
                cmd_string = __CMD_BOB_QUERY_SRC_PATH__.format(
                    module=self.name)
                work_dir_str = os.popen(cmd_string).readlines()
                work_dir_str = work_dir_str[0].strip('\n')
                self.src = work_dir_str

            except Exception as e:
                logger.error(
                    "Get src dir Failed for with error:'{}'".format(str(e)))
                pass
        logger.debug("src_dri {}".format(self.src))
        return self.src

    def dump(self):
        return {'recpie_path': self.name,
                'info': self.get_info(),
                'depends': self.get_depends(),
                'yaml': self.get_yaml(),
                'src': self.get_src(),
                'build': self.get_build()}

    def process(self, recursive=False):
        self.get_info()
        self.get_depends()
        self.get_yaml()
        self.get_src()
        self.get_build()
        if (recursive == True):
            logger.info(self.get_depends())
            depends = self.get_depends()
            self.sub_pkgs = [Package(x, **self.kwargs)
                             for x in depends] if depends is not None else {}
            for pkg in self.sub_pkgs:
                pkg.process(recursive=self.kwargs.get('recursive', False))


class Cache:
    def __init__(self, **kawrgs) -> None:
        #  self.recipes = []
        self.cachefile = kawrgs.get('cachefile', "")
        self.content = dict()

    def load(self):
        try:
            self.content = yaml.full_load(open(self.cachefile, 'r').read())
        except Exception as err:
            logger.error(str(err))
            traceback.print_exc()

    def dump(self, module_list):
        try:
            with open(self.cachefile, 'w') as f:
                f.write(yaml.dump(module_list))
        except Exception as err:
            logger.error(str(err))
            traceback.print_exc()


def config():
    parser = argparse.ArgumentParser(
        description='在工程根目录下执行，查找指定目录内的所有的compile_commands.json文件，并生成".clang"文件到指定目录')

    parser.add_argument('--packages', type=str, nargs="+", dest='packages',
                        default=__DEF_PACKAGES__, help='指定目标packages')

    parser.add_argument(
        '--cachefile', help="cache文件的路径,默认为当前目录的.clangchage", default='.clangdcache')

    parser.add_argument('--save-cache', dest='save_cache', default=True,
                        action='store_true', help="保存所有过程信息，减少下次生成的时间")

    parser.add_argument('--no-save-cache', dest='save_cache',
                        action='store_false', help="不保存所有过程信息，不覆盖当前cache文件")

    parser.add_argument('--use-cache', dest='cache',
                        action='store_true', help="使用之前生成的cache文件,解析")

    parser.add_argument('--recursive', dest='recursive', default=False,
                        action='store_true', help="递归查找编译所有sub-package")

    parser.add_argument('--build-depends', dest='build_depends', default=False,
                        action='store_true', help="下载并编译sub-package")

    parser.add_argument('--clangfile', type=str, default='.clangd',
                        help="默认保存在当前文件夹下.clangd")

    return vars(parser.parse_args())


class Clangd:
    def __init__(self, **kwargs) -> None:
        self.kwargs = kwargs
        self.selector = list()
        self.packages = list()
        self.cache = Cache(**kwargs)

    def write_cache(self):
        os_popen("rm {}".format(self.kwargs.get('cachefile')))
        dump_dict = {}
        for pkg in self.packages:
            dump_dict.update({pkg.name: pkg.dump()})

        self.cache.dump(dump_dict)

    def write_info(self):

        content_all = []
        for pkg in self.packages:
            logger.debug("name :{}\n".format(pkg.name))
            logger.debug("src  :{}\n".format(pkg.src))
            logger.debug("build:{}\n".format(pkg.build))
            content_all.append("==========================================n")
            content_all.append("name :{}\n".format(pkg.name))
            content_all.append("src  :{}\n".format(pkg.src))
            content_all.append("build:{}\n".format(pkg.build))

        with open('.clanginfo', 'w') as f:
            f.writelines(content_all)

    def write_clangd(self):
        content = []
        for pkg in self.packages:
            if pkg.build is not None and pkg.src is not None:
                if (os.path.exists(os.path.join(os.getcwd(), pkg.build, 'compile_commands.json'))):
                    content.append(__CLANG_CFG_PATTERN__.format(
                        src=pkg.src.replace('dev/src/', ".*/"), build=os.path.join(os.getcwd(), pkg.build)))

        with open(self.kwargs.get('clangfile', '.clangd'), 'w') as f:
            f.write('---'.join(content))

    def process(self):
        logger.debug(self.kwargs)
        for pkg_name in self.kwargs.get('packages', __DEF_PACKAGES__):
            pkg = Package(pkg_name,  **self.kwargs)
            pkg.process(recursive=True)
            self.packages.append(pkg)
            self.packages.extend(pkg.sub_pkgs)
            #  for sub_pkg in pkg.sub_pkgs:
            #      self.packages.append(sub_pkg)
        self.write_cache()
        self.write_clangd()


def main_entry():
    args = config()
    logger.info(args)
    try:
        cache = Cache(**args)
        cache.load()
        args.update(cache.content)
        clang = Clangd(**args)
        clang.process()
    except Exception as e:
        logger.error(str(e))
        traceback.print_exc()


if __name__ == "__main__":
    main_entry()

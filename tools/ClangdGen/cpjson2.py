#!/usr/bin/env python3

import os
import argparse
import traceback
import yaml
import logging
from pprint import pprint as print

logging.basicConfig(level=logging.INFO,
                    format='[%(filename)s:%(lineno)-4d %(levelname)s ]%(message)s')
#  logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

'''
Readme
## For Develop
- bob dev 时指定的定义为module
- module 依赖的定义为submodule
- src_dir bob下载代码的路径，通过 `bob  query-path` 可查询
- build_dir bob编译是中间产物的路径，`bob  query-path` 可查询 通常的compile_commands.json保存在此位置
- yaml recipe文件所在路径

## Feature

- 查找Module的compille_commands.json文件，添加到.clangd
- 查找submodule的compille_commands.json文件，添加到.clangd
- 必要时尝试使用bob dev编译submodule，并生产compile_commands.json，添加到.clangd
'''

'''
build command:

    CONFIG_JNN=1 bob dev  -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target

Recipe与SRC的目录关系

Example：
    存在一个recipes/phone/bt-phone/tsd-bt-phone-mib3.yaml文件，其中存在如下内容

        checkoutSCM:
            dir: tsd.bt.phone.mib3

		phone/bt-phone/tsd-bt-phone-mib3.yaml 文件名去除yaml规定工程目录名 ./phone/bt-phone/tsd-bt-phone-mib3/.......
        dir:tsd.bt.phone.mib3 workspace中git clone的目录名
'''

CMD_BOB_QUERY_SRC_PATH = "CONFIG_JNN=1 bob query-path -f {{build}} -DCONFIG_JNN=1 {module}"
CMD_BOB_QUERY_BUILD_PATH = "CONFIG_JNN=1 bob query-path -f {{src}} -DCONFIG_JNN=1 {module}"
CMD_BOB_SHOW = "CONFIG_JNN=1 bob show --format=yaml -DCONFIG_JNN=1 {module}"
CMD_BOB_QUERY_RECIPE = "CONFIG_JNN=1 bob query-recipe -DCONFIG_JNN=1 {module}"

DEF_MODULES = [
    'ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target'
]

#  DEF_MODULES = [
#      'ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target',
#      'ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target'
#  ]


def os_popen(cmd_string):
    logger.info("POPEN:{}".format(cmd_string))
    return os.popen(cmd_string)


class Recpie:
    def __init__(self, module, **kawrgs):
        self.module = module
        self.yaml_content = kawrgs.get(module)
        self.info = self.yaml_content.get(
            'info') if self.yaml_content is not None else None
        self.depends = self.yaml_content.get(
            'depends') if self.yaml_content is not None else None
        self.yaml = self.yaml_content.get(
            'yaml') if self.yaml_content is not None else None
        self.src_dir = self.yaml_content.get(
            'src_dir') if self.yaml_content is not None else None
        self.build_dir = self.yaml_content.get(
            'build_dir') if self.yaml_content is not None else None
        self.kawrgs = kawrgs
        self.logger = logger.getChild(__class__.__name__)
        self.logger.setLevel(logging.INFO)
        #  self.logger.setLevel(logging.INFO)

    def get_info(self):
        if self.info is None:
            cmd_string = CMD_BOB_SHOW.format(module=self.module)
            self.info = yaml.full_load(os_popen(cmd_string))
        self.logger.debug(self.module)
        self.logger.debug(self.info)
        return self.info

    def get_depends(self):

        if self.depends is None:
            self.depends = self.get_info().get('depends')
        self.logger.debug("SubModuls: {}".format(self.depends))
        return self.depends

    def get_yaml(self):

        if self.yaml is None:
            cmd_string = CMD_BOB_QUERY_RECIPE.format(module=self.module)
            self.logger.debug(cmd_string)
            recpie_files_list = os_popen(cmd_string).readlines()
            for i in recpie_files_list:
                if self.yaml is None and i.startswith('recipes'):
                    self.yaml = i.strip('\n')
        self.logger.debug(self.yaml)
        return self.yaml

    def get_build_dir(self):
        if self.build_dir is None:
            try:
                cmd_string = CMD_BOB_QUERY_BUILD_PATH.format(
                    module=self.module)
                work_dir_str = os_popen(cmd_string).readlines()
                work_dir_str = work_dir_str[0].strip('\n')
                self.build_dir = work_dir_str

            except Exception:
                self.logger.error(
                    "could not get working dir for {}".format(self.module))
                self.logger.error(traceback.print_exc())
                pass

        self.logger.debug("build_dir {}".format(self.build_dir))
        return self.build_dir

    def get_src_dir(self):
        if self.src_dir is None:
            try:
                cmd_string = CMD_BOB_QUERY_SRC_PATH.format(module=self.module)
                work_dir_str = os.popen(cmd_string).readlines()
                work_dir_str = work_dir_str[0].strip('\n')
                self.src_dir = work_dir_str

            except Exception:
                self.logger.error(
                    "could not get working dir for {}".format(self.module))
                self.logger.error(traceback.print_exc())
                pass
        self.logger.debug("src_dri {}".format(self.src_dir))
        return self.src_dir

    def dump(self):
        return {'recpie_path': self.module,
                'info': self.get_info(),
                'depends': self.get_depends(),
                'yaml': self.get_yaml(),
                'src_dir': self.get_src_dir(),
                'build_dir': self.get_build_dir()}

    def process(self):
        self.get_info()
        self.get_depends()
        self.get_yaml()
        self.get_src_dir()
        self.get_build_dir()


class Cache:
    def __init__(self, **kawrgs) -> None:
        #  self.recipes = []
        self.cachefile = kawrgs.get('cachefile', "")
        self.yaml_content = dict()
        self.logger = logger.getChild(__class__.__name__)
        self.error = self.logger.error
        self.info = self.logger.info
        self.debug = self.logger.debug
        self.yaml_content = yaml.full_load(open(self.cachefile, 'r').read())

    def ERR(self, *args, **kwargs):
        self.logger.error(args, **kwargs)

    def WAR(self, *args, **kwargs):
        self.logger.warn(args, **kwargs)

    def INF(self, *args, **kwargs):
        self.logger.info(*args, **kwargs)

    def get(self, module_name):
        try:
            self.info(module_name)
            return self.yaml_content.get(module_name)
        except Exception as err:
            self.ERR(str(err))
            Exception.with_traceback.print_exc()

    def dump(self,module_list):
        try:
            with open(self.cachefile, 'w') as f:
                f.write(yaml.dump(module_list))
        except Exception as err:
            self.ERR(str(err))
            Exception.with_traceback.print_exc()


def config():
    parser = argparse.ArgumentParser(
        description='在工程根目录下执行，查找指定目录内的所有的compile_commands.json文件，并生成".clang"文件到指定目录')

    parser.add_argument('--modules', type=str, nargs="+",
                        default=DEF_MODULES, help='指定目标modules')

    parser.add_argument('--submodule', type=str, default="phone",
                        help='指定关注的模块(目录名)，比如"phone","media"等等')

    parser.add_argument('--cache', dest='cache',
                        action='store_true', help="使用之前生成的cache文件,解析")

    parser.add_argument('--no-cache', dest='cache',
                        action='store_false', help="不使用之前生成的cache文件,解析")

    parser.add_argument(
        '--cachefile',  help="指定cachefile的路径,默认为当前目录的.clangchage", default='.clangcache')

    return vars(parser.parse_args())


def is_submodule(yaml, module_name):
    path_grp = yaml.split('/')
    logger.debug(path_grp)
    if (module_name == path_grp[1]):
        return True
    else:
        return False


def write_cache(pkg_dump, filename):
    with open(filename, 'w') as f:
        f.write(yaml.dump(pkg_dump))


#  def load_cache(filename):
#      with open(filename, 'r') as f:
#          return yaml.full_load(f.read())


def main_entry():
    args = config()
    module_list = {}
    recipe_list = []

    try:
        cache = Cache(**args)
        args.update(cache.yaml_content)
        for module_name in args.get('modules', DEF_MODULES):
            module = Recpie(module_name,  **args)
            module.process()
            module_list.update({module_name: module.dump()})
            recipe_list.append(module)

            submodules = module.get_depends()
            logger.info(submodules)
            for module_name in submodules:
                logger.info("SubModule:{}".format(module_name))
                module = Recpie(module=module_name,**args)
                module.process()
                module_list.update({module_name: module.dump()})
                recipe_yaml = module.get_yaml()
                if is_submodule(recipe_yaml, args.get('submodule')):
                    recipe_list.append(module)

        cache.dump(module_list)

    except Exception as e:
        logger.error(str(e))
        Exception.with_traceback.print_exc()
        pass

    #  write_cache(module_list, args.get('cachefile'))


if __name__ == "__main__":
    main_entry()
    #  print(test())

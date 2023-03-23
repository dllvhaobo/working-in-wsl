import yaml
from pprint import pprint as print
from os import popen, system, getcwd,path
from logger import logger

__CMD_BOB_QUERY_SRC_PATH__ = "CONFIG_JNN=1 bob query-path -f {{src}} -DCONFIG_JNN=1 {module}"
__CMD_BOB_QUERY_BUILD_PATH__ = "CONFIG_JNN=1 bob query-path -f {{build}} -DCONFIG_JNN=1 {module}"
__CMD_BOB_SHOW__ = "CONFIG_JNN=1 bob show --format=yaml -DCONFIG_JNN=1 {module}"
__CMD_BOB_QUERY_RECIPE__ = "CONFIG_JNN=1 bob query-recipe -DCONFIG_JNN=1 {module}"
__CMD_BOB_BUILD__ = "CONFIG_JNN=1 bob dev -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 {module}"
__CMD_BOB_CLEAN_BUILD__ = "CONFIG_JNN=1 bob dev --clean -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 {module}"


def os_popen(cmd_string):
    logger.debug("cmd:{}".format(cmd_string))
    return popen(cmd_string)


class BobPackage:
    def __init__(self, name, level, cache, **kawrgs):
        self.name = name
        self.kwargs = kawrgs

        self.__level = level
        self.sub_pkgs = list()

        self.__cache = cache
        cache_pkg = cache.get(self.name)
        self.__info = cache_pkg.get('info') if isinstance(
            cache_pkg, dict) else None
        self.__deps = cache_pkg.get('depends') if isinstance(
            cache_pkg, dict) else None
        self.__yaml = cache_pkg.get('yaml') if isinstance(
            cache_pkg, dict) else None
        self.__src = cache_pkg.get('src') if isinstance(
            cache_pkg, dict) else None
        self.__build = cache_pkg.get('build') if isinstance(
            cache_pkg, dict) else None

    def get_info(self):
        if self.__info is None:
            cmd_string = __CMD_BOB_SHOW__.format(module=self.name)
            self.__info = yaml.full_load(os_popen(cmd_string))
        return self.__info

    def get_depends(self):
        if self.__deps is None:
            self.__deps = self.get_info().get('depends')
        logger.debug("SubModuls: {}".format(self.__deps))
        return self.__deps

    def get_yaml(self):

        if self.__yaml is None:
            cmd_string = __CMD_BOB_QUERY_RECIPE__.format(module=self.name)
            recpie_files_list = os_popen(cmd_string).readlines()
            for i in recpie_files_list:
                if self.__yaml is None and i.startswith('recipes'):
                    self.__yaml = i.strip('\n')
        logger.debug(self.__yaml)
        return self.__yaml

    def get_build_dir(self):
        
        if self.__build is None or self.__build =='':
            try:
                cmd_string = __CMD_BOB_QUERY_BUILD_PATH__.format(
                    module=self.name)
                work_dir_str = os_popen(cmd_string).readlines()
                work_dir_str = work_dir_str[0].strip('\n')
                self.__build = work_dir_str
            except Exception as e:
                logger.error(
                    "Get build dir Failed for with error:'{}'".format(str(e)))
            finally:
                logger.debug("build {}".format(self.__build))
        return self.__build

    def get_src_dir(self):
        if self.__src is None:
            try:
                cmd_string = __CMD_BOB_QUERY_SRC_PATH__.format(
                    module=self.name)
                work_dir_str = os_popen(cmd_string).readlines()
                work_dir_str = work_dir_str[0].strip('\n')
                self.__src = work_dir_str

            except Exception as e:
                logger.error(
                    "Get src dir Failed for with error:'{}'".format(str(e)))
                self.__src = ''
                pass

        logger.debug("src_dir {}".format(self.__src))
        return self.__src

    def build_package(self,pattern=__CMD_BOB_BUILD__):
        print(self.kwargs)
        if self.kwargs.get('build_depends') == True and self.__level >= 0:
            if isinstance(self.get_build_dir(), str):
                getcwd()
                if not path.exists(path.join( getcwd(), self.get_build_dir(), 'compile_commands.json')):
                    cmd_string = pattern.format(module=self.name)
                    print(cmd_string)
                    system(cmd_string)

    def dump(self):
        ret = {self.name: {'name': self.name,
                           'info': self.get_info(),
                           'depends': self.get_depends(),
                           'yaml': self.get_yaml(),
                           'src': self.get_src_dir(),
                           'build': self.get_build_dir()}}

        return ret

    def process_subpackages(self):
        if (self.__level > 0):
            print("package {} depends {}".format(
                self.name, self.get_depends()))
            depends = self.get_depends()
            if depends is not None:
                for pkt_name in depends:
                    sub_pkt = BobPackage(
                        pkt_name, self.__level-1, self.__cache, **self.kwargs)
                    sub_pkt.process()
                    sub_pkt.build_package(__CMD_BOB_CLEAN_BUILD__)
                    self.sub_pkgs.append(sub_pkt)

    def process(self):
        print("processing package:{}".format(self.name))
        self.get_info()
        self.get_depends()
        self.get_yaml()
        self.get_src_dir()
        self.get_build_dir()
        self.__cache.update(**self.dump())
        self.process_subpackages()

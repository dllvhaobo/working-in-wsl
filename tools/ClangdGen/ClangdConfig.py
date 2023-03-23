from logging import log
import os
import traceback

from logger import logger
from pprint import pprint as print

__CLANG_CFG_PATTERN__ = """
If:
  PathMatch: "{pathmatch}/.*"
CompileFlags:
  CompilationDatabase: "{build_dir}"
"""


class ClangdConfig:
    def __init__(self, cache, **kwargs) -> None:
        self.kwargs = kwargs
        self.content_list = []
        self.__cache = cache

    def append(self, name, src_dir, build_dir):
        logger.info("build_dir {}".format(build_dir))
        self.content_list.append({
            'name': name,
            'src':  src_dir,
            'pathmatch': src_dir.replace('dev/src/', ".*/") if isinstance(src_dir, str) else None,
            'build_dir': build_dir,
        })

    def write_info(self):
        clangdinfo = []

        try:
            for content in self.content_list:
                clangdinfo.append("="*80)
                clangdinfo.append("\nname :{name}\n".format(**content))
                clangdinfo.append("src  :{src_dir}\n".format(**content))
                clangdinfo.append("build:{build_dir}\n".format(**content))
        except Exception as e:
            logger.error(str(e))
            traceback.print_exc()

        finally:
            with open('.clanginfo', 'w') as f:
                f.writelines(clangdinfo)

    def write_projectconfig(self):
        clangd_config_content = set()

        def find_jcbd(path):
            logger.info("find_jcdb:{}".format(path))
            jcdb_path = os.popen(
                "find {} -name compile_commands.json".format(path)).readlines()
            if len(jcdb_path) and isinstance(jcdb_path[0], str):
                return os.path.join(path,jcdb_path[0].strip('\n'))

        try:
            for name, value in self.__cache.get().items():
                if isinstance(value.get('src'), str) and isinstance(value.get('build'), str):
                    path = find_jcbd(os.path.join( os.getcwd(), value.get("build")))
                    if isinstance(path, str):
                        self.append(name, value.get('src'), os.path.dirname(path))
                else:
                    logger.error("#"*80)
                    logger.error("\nPackage : {}".format(value.get('name')))
                    logger.error("src_dir: {}".format(value.get('src')))
                    logger.error("build_dir : {}".format(value.get('build')))

            clangd_config_content = [__CLANG_CFG_PATTERN__.format(**x) for x in self.content_list]
            clangd_config_content = set(clangd_config_content)
        except Exception as e:
            logger.error(str(e))
            traceback.print_exc()

        finally:

            with open(self.kwargs.get('clangfile', '.clangd'), 'w') as f:
                f.writelines('---'.join(clangd_config_content))

    def process(self):
        #  self.write_info()
        self.write_projectconfig()

#!/usr/bin/env python3


import os
from pprint import pprint as print
import argparse

config_pattern = '''
If:
  PathMatch: ".*/{src_dir_path}/.*"
CompileFlags:
  CompilationDatabase: "{json_dir_path}"
'''

'''
- 查找所有compile_commands.json的位置
- 根据compile_commands.json的位置，生成代码所在目录的匹配规则

'''
json_workspace_suffix = ['-target', '-commgr-dev', '-vkms-engine-dev', '-dev']


def find_commands_compile_json(**kwargs):
    return os.popen(
        "find {dist_path} -name compile_commands.json".format(**kwargs))


def config():
    parser = argparse.ArgumentParser(
        description='查找指定目录内的所有的compile_commands.json文件，并生成clang的匹配规则')

    parser.add_argument('-r', '--root', type=str, help='工程根目录，默认指向工程的dev/build',
                        default="/home/lv/works/recipes-svw-cns3.0/dev/build")

    parser.add_argument('-s', '--subfolder', type=str, default="", nargs="*",
                        help='工程根目录下的子目录，比如"phone", "media"等')

    parser.add_argument('-f', '--file_path', type=str, help='指定需要生成的".clang"文件路径',
                        default="{PWD}/.clangd".format(PWD=os.environ.get("PWD")))

    parser.add_argument('-m', '--mode', choices=['a', 'w'], required=True, help='a:追加模式；w：重新生成',
                        default="{PWD}/.clangd".format(PWD=os.environ.get("PWD")))

    return vars(parser.parse_args())


def get_db_mapping_workspace(db_path, suffix=json_workspace_suffix):

    db_dir = os.path.dirname(db_path)
    db_ws = os.path.basename(os.path.dirname(os.path.dirname(db_dir)))
    for i in suffix:
        db_ws = db_ws if not db_ws.endswith(i) else db_ws[:-len(i)]

    return {'json_dir_path': db_dir, 'src_dir_path': db_ws}


def mk_clangd_config_file(clang_cfg_list, clang_cfg_file, mode='a'):
    clang_cfg_string = []

    for i in clang_cfg_list:
        print(i)
        clang_cfg_string.append(config_pattern.format(**i))

    result = '---'.join(clang_cfg_string)

    print("write clangd config file %s" % (clang_cfg_file))
    with open(clang_cfg_file, mode) as f:
        f.write(result)


if __name__ == "__main__":

    cfg = config()
    print(cfg)
    root_dir = cfg.get("root")
    subfolder_list = cfg.get("subfolder", "")

    json_path_list = []
    for sub_dir in subfolder_list:
        json_path_list.extend(find_commands_compile_json(
            dist_path=os.path.join(str(root_dir), str(sub_dir))))

    clang_config_list = []
    for i in json_path_list:
        result = get_db_mapping_workspace(i)
        print(result)
        clang_config_list.append(result)

    mode = cfg.get('mode', 'a')
    mk_clangd_config_file(clang_config_list, cfg.get("file_path"), mode=mode)
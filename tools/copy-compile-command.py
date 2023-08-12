#!/usr/bin/env python3


import os
from pprint import pprint as print
import argparse

config_pattern = '''
If:
  PathMatch: [.*/{path_pattern}/.*, .*/{path_pattern2}/.*]
CompileFlags:
  CompilationDatabase: "{json_folder_path}"
'''

db_path_suffix1 = '-dev'
db_path_suffix2 = '-target'


def get_json_list(**kwargs):
    return os.popen(
        "find {dist_path} -name compile_commands.json".format(**kwargs))


def config():
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('-w', '--workspace', help='workspace root', default=os.environ.get('PWD'))
    parser.add_argument('-c', '--clang-config', help='clang config file generate to',
                        default="{CURRENT}/.clangd".format(CURRENT=os.environ.get("PWD")))

    return vars(parser.parse_args())


def get_db_mapping_workspace(db_path):
    db_dir = os.path.dirname(db_path)
    db_dir_2 = db_dir
    while (not db_dir_2.endswith(db_path_suffix1)) and (not db_dir_2.endswith(db_path_suffix2)):
        if(2<len(db_dir_2)):
            db_dir_2 = os.path.dirname(db_dir_2)
        else:
            break
    db_ws2 = os.path.basename(db_dir_2)
    db_ws = db_ws2[:-len(db_path_suffix1)] if db_ws2.endswith(db_path_suffix1) else db_ws2[:-len(db_path_suffix2)] if db_ws2.endswith(db_path_suffix2) else db_ws2
    print(db_ws)
    print(db_ws2)
    
    if len(db_ws)>0 and len(db_ws2)>0:
        return {'json_folder_path': db_dir, 'path_pattern': db_ws, 'path_pattern2': db_ws2}
    else:
        return

def mk_clangd_config_file(clang_cfg_list, clang_cfg_file):
    clang_cfg_string = ['CompileFlags:\n    Remove: [-mtune=cortex-a57.cortex-a53]\n']
    for i in clang_cfg_list:
        print(i)
        if i is not None:
            clang_cfg_string.append(config_pattern.format(**i))

    result ='---'.join(clang_cfg_string)

    print("write clangd config file %s"%(clang_cfg_file))
    with open(clang_cfg_file,'w') as f:
        f.write(result)

if __name__ == "__main__":

    cfg = config()
    print(cfg)
    ws = cfg.get("workspace")
    dist_dir = os.path.join(str(ws), 'dev', 'build')

    json_path_list = get_json_list(dist_path=dist_dir)

    clang_db_list = []
    for i in json_path_list:
        clang_db_list.append(get_db_mapping_workspace(i))

    mk_clangd_config_file(clang_db_list, cfg.get("clang_config"))

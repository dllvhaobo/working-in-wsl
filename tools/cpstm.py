#!/usr/bin/env python3
import os
import sys

source_path = sys.argv[1]
target_path = sys.argv[2]


files = os.popen(
    "find {src} -name export.xml".format(src=source_path)).readlines()

for file in files:
    file=file.strip('\n')
    dst_name = file[len(source_path)+1:].replace('/', '-')
    command='cp {src} {target_path}/{dst_name}'.format(src=file, target_path=target_path, dst_name=dst_name)
    print(command)
    os.system('cp {src} {target_path}/{dst_name}'.format(src=file, target_path=target_path, dst_name=dst_name))

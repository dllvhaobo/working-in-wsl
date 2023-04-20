#!/bin/bash

set -ex
# 获取目标目录（默认为 /home/lv/works/recipes-svw-cns3.0/dev/src）
target_dir=${1:-/home/lv/works/recipes-svw-cns3.0/dev/src}
ROOT_DIR=$(pwd)
# 遍历所有 Git 仓库，并拷贝 readme.md 文件
find "$target_dir" -type d -name ".git" -prune | while read git_dir; do
  # 进入 Git 仓库根目录
  cd "$(dirname "$git_dir")" || exit 1

  # 检查是否存在 readme.md 文件，存在则拷贝到当前目录并重命名为 "<Git 仓库名>.md"
  # if [ -f "$(find . -iname "readme.md" -print -quit)" ]; then
  if [ -f "README.md" ]; then
    repo_name=$(basename $(dirname "$git_dir"))
    echo $repo_name
    cp --preserve=timestamps -f README.md  "$ROOT_DIR/${repo_name}.md"
    echo "Copied readme.md from $repo_name to $ROOT_DIR/${repo_name}.md"
  fi
done

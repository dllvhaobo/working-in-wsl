#!/bin/bash

set -ex
# 搜索关键字（如果未提供命令行参数，则使用默认值）
# keyword="${1:-\[(phone|media|audio)|HMI time}"
# keyword="${1:-\[(phone|audio)|HMI time}"
# keyword="${1:-\[(phone|audio)}"
# keyword="${1:-\[(phone|media)|HMI time}"
# keyword="${1:-\[(phone|media)}"
# keyword="${1:-\[phone|HMI time}"
# keyword="${1:-\[phone|Booting Linux|HMI time}"
keyword="${1:-\[phone}"

# 目标文件
output_file="export.log"

# 遍历当前目录及其子目录中的所有HTML文件
while IFS= read -r -d '' file; do
  # 在HTML文件中搜索关键字，并将匹配行写入目标文件
  grep -E "$keyword" "$file" >> "$output_file"
done < <(find . -name '*.html' -print0)

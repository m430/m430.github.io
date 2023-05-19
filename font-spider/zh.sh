#!/bin/bash

output_file="font-spider/zh.txt"

# 清空输出文件
>"$output_file"

# 递归查找目录blog下所有md文件的中文，并追加到输出文件中
find content/blog -type f -name "*.md" -exec grep -o "[一-龥]" {} + | sed 's/^.*://' | tr -d '\n' >>"$output_file"

echo "提取完成！中文已保存到 $output_file 文件中。"

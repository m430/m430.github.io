#!/bin/bash

output_file="font-spider/en.txt"

# 清空输出文件
>"$output_file"

# 递归查找目录blog下所有md文件的内容，并提取非中文字符到临时文件中
find content/blog -type f -name "*.md" -exec cat {} + | iconv -c -t ASCII//TRANSLIT | tr -cd '[^[:print:][:space:]]' | tr -s '[:space:]' >>"$output_file"

# 对输出文件进行去重并输出到一行
sorted_output=$(sort -u "$output_file" | tr -d '\n')
echo "$sorted_output" >"$output_file"

echo "提取完成！去重后的非中文字符已保存到 $output_file 文件中。"

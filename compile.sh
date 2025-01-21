#!/bin/bash

# 设置基础目录
base_dir="rule"

# 遍历 rule 文件夹下的每个子文件夹
for json_file in "$base_dir"/*.json; do
    # 获取文件夹名称
    # folder_name=$(basename "$dir")
    
    # 构建 JSON 文件路径
    json_name=$(basename "$json_file" .json)
    
    # 检查 JSON 文件是否存在
    if [[ -f "$json_file" ]]; then
        # 构建输出文件名 (与 JSON 相同，用 .srs 结尾)
        output_file="$base_dir/$json_name.srs"
        
        # 执行 sing-box 命令
        sing-box rule-set compile --output "$output_file" "$json_file"
        
        # 输出处理信息
        echo "Processed: $json_file -> $output_file"
    else
        echo "JSON file not found: $json_file"
    fi
done

#!/bin/bash

# 设置终端编码为 UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# 检出 china 分支
echo "========================================"
echo "检出 china 分支..."
git checkout china
echo "========================================"

# 拉取最新的代码
echo "拉取最新的代码..."
git pull gitee china:china
echo "========================================"

# 清理 Hexo
echo "清理 Hexo..."
hexo clean
echo "========================================"

# 生成静态文件
echo "生成静态文件..."
hexo g
echo "========================================"

# 停止 pm2 进程
echo "停止 pm2 进程..."
pm2 stop hexo_run.cjs
echo "========================================"

# 启动 pm2 进程
echo "启动 pm2 进程..."
pm2 start hexo_run.cjs
echo "========================================"

echo "所有操作已完成。"

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
echo "清理 Hexo，并重新生成静态文件..."
hexo clean && hexo g
echo "========================================"

# 停止 pm2 进程
echo "停止 pm2 进程..."
pm2 stop hexo_run.cjs
echo "========================================"

# 启动 pm2 进程
echo "启动 pm2 进程..."
pm2 start hexo_run.cjs
echo "========================================"

echo "博客已重新部署，详情点击： http://www.huangzexiao.top"


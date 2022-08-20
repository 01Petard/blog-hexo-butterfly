---
title: Git的配置和使用命令
date: 2022-04-26 16:22:15
updated:
categories: 
- 开发
tags: 
- Git
keywords:
- Git
description: Git的配置、使用，涵盖了版本管理全过程
cover: https://www.mrfangge.com/img/blog/git.jpg
top_img: https://www.mrfangge.com/img/blog/git.jpg
---

## 1、安装

下载一个适合自己电脑版本的Git，安装好软件

## 2、配置基本信息

```shell
git config --global user.name "xxx"
git config --global user.email "xxx"
git config --global gui.encoding utf-8          
git config --global i18n.commitencoding utf-8
git config --global i18n.logoutputencoding utf-8
git config --global core.quotepath false
```

## 3、查看配置

```shell
cat ~/.gitconfig
或
git config --list
(按q退出)
```

## 4、创建一个新仓库

```shell
git init
```

## 5、显示当前目录下的提交文件状态

```shell
git status
```

## 6、将指定文件Stage(标记为将要提交的状态)

```shell
git add .
或
git add "文件路径"
```

## 7、将指定文件Unstage(取消标记为将要提交的文件)

```shell
git reset .
或
git reset "文件路径"
```

## 8、创建一个提交并提供提交信息

```shell
git commit -m "备注内容"
```

## 9、显示提交历史

```shell
git log
(按q退出)
```

## 10、恢复上次提交的文件

```shell
git checkout HEAD .
或
git checkout HEAD "某个文件"
```

## 11、向远程仓库推送

```shell
git push
```

## 12、向远程仓库拉取

```shell
git pull
```

## 13、从远程服务器克隆一个仓库

```shell
git clone "url"
```



来一张汇总表

![IMG_9699](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/IMG_9699.jpg)

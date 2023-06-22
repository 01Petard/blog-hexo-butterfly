---
title: Git的配置和使用命令
date: 2022-04-26 16:22:15
updated: 2022-12-15 21:13:00
categories: 
- 学习
tags: 
- Git
- Github
keywords:
- Git
- Github
description: Git的配置、使用，足够个人使用
cover: https://www.mrfangge.com/img/blog/git.jpg
top_img: https://www.mrfangge.com/img/blog/git.jpg
top: 999
---

# 简单汇总

![IMG_9699](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/IMG_9699.jpg)

# 一、安装和配置

## 1.1 官网下载安装

> https://git-scm.com/downloads

## 1.2 配置基本信息

```shell
git config --global user.name "username"
git config --global user.email "email@qq.com"
git config --global init.defaultBranch main  # 设置默认分支名为main，而不是master
# 以下可以不用配置
git config --global gui.encoding utf-8  # gui界面的编码方式改为utf-8
git config --global i18n.commitencoding utf-8  # 将commit时信息转为urf-8，默认二进制
git config --global i18n.logoutputencoding utf-8  # 显示日志时的转为utf-8，默认二进制
git config --global core.quotepath false  # 不要转义中文文件名或路径，默认转义
git config --global core.autocrlf false  # 关闭crlf自动换行（windows下建议）
git config --global core.filemode false  # 关闭crlf自动换行（windows下建议）
git config --global core.safecrlf true   # 关闭crlf自动换行（windows下建议）
```

查看配置信息

```shell
cat ~/.gitconfig
```

```shell
git config --list
```

## 1.3 配置ssh key

```shell
ssh-keygen -t rsa -C "email@qq.com"
```

我创建过了就不创建了，之后需要创建一个访问这个密钥的密码，需要牢记。

这个密钥之后要放在github里的，所以这个文件不要误删了。

![image-20220820145759035](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820145759035.png)

可以使用命令来查看一下

```shell
cat ~/.ssh/id_rsa.pub
```

![image-20220820150025037](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820150025037.png)

*补充一下，如果后期觉得push总是要输密码太麻烦，可以修改密码为空

![image-20220820164020850](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820164020850.png)

## 1.4 将ssh key添加到github上

### 1.4.1 点击Settings

![img](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/webp)

### 1.4.2 点击New SSH key

![img](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/webp-20220820172054065)

### 1.4.3 添加key

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/webp-20220820172058826" alt="img" style="zoom:67%;" />

### 1.4.5 验证链接

```shell
ssh -T git@github.com 
```

输入创建ssh key时的密码，如果打印以下信息则表示成功！

![image-20220820150350017](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820150350017.png)

# 二、本地操作

## 2.1 创建一个Github仓库

![image-20220820151031468](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820151031468.png)
![image-20220820151126921](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820151126921.png)

## 2.1 创建一个本地仓库

```
git init
```

回到本地，新建一个测试文件夹，里面放点文件，写点东西

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820141754957.png" alt="image-20220820141754957" style="zoom:67%;" />

## 2.2 创建一个忽略的文件列表

```shell
touch .gitignore
```

常见忽略文件，可以按需添加

```yaml
.DS_Store
node_modules/
/dist

# local env files
.env.local
.env.*.local

# Log files
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*

# Editor directories and files
.idea
.vscode
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?
.rar
```

使用touch和vim创建好.gitignore文件

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820141851327.png" alt="image-20220820141851327" style="zoom: 67%;" />

## 2.3 将指定文件标记/取消标记为将要提交的状态

```shell
git add/reset 文件
```

![image-20220820141907835](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820141907835.png)

## 2.4 创建一个提交并提供提交信息

```shell
git commit -m "备注内容"
```

![image-20220820142004725](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142004725.png)

## 2.5 显示当前目录下的提交文件状态

```shell
git status
```

这是还没提交时的状态

![image-20220820141648087](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820141648087.png)

这是已经提交的状态

![image-20220820142117819](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142117819.png)

## 2.6 显示提交历史

```shell
git log
```

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820143035714.png" alt="image-20220820143035714"  />

## 2.7 分支操作

### 2.7.1 检查分支

```shell
git branch
```

![image-20220820142317696](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142317696.png)

当前只有一个master分支，如果之前配置好了默认分支名为main，这里因该是main

![image-20220820142236554](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142236554.png)

### 2.7.2 更名分支

```shell
git branch -m master main
```

![image-20220820142335452](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142335452.png)

我们回去再看，分支名字已经改好了

![image-20220820142401035](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142401035.png)

### 2.7.3 创建分支

```shell
git branch 分支名
```

![image-20220820142427801](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142427801.png)

![image-20220820142449749](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142449749.png)

### 2.7.4 切换分支

```shell
git checkout 分支名
```

![image-20220820142530391](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142530391.png)

可以看到现在在issue1分支下了

![image-20220820142547405](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142547405.png)

### 2.7.5 创建分支并切换到该分支

```shell
git checkout -b 分支名
```

创建分支并切换到此分支下，也可以这么做，更快捷

![image-20220820142653257](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142653257.png)

![image-20220820142712261](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142712261.png)

### 2.7.6 删除当前分支下的文件

```shell
git rm -r --cached 文件
```

## 2.8 修改文件后再次提交

修改1.txt和2.txt，不修改3.txt，打印一下状态，发现git告诉我们有两个文件修改过了

![image-20220820143347222](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820143347222.png)

我们再次提交，并打印提交日志

![image-20220820143510005](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820143510005.png)

![image-20220820143617845](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820143617845.png)

再修改3.txt文件，并提交、打印

![image-20220820143724643](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820143724643.png)

![image-20220820143740728](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820143740728.png)

## 2.9 回滚上次提交的文件

```shell
git checkout HEAD 文件
```

现在我们把2.txt和3.txt修改一下并保存

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820144734650.png" alt="image-20220820144734650" style="zoom: 50%;" />

此时如果希望回滚到上次提交的状态，就可以这样做

![image-20220820144900027](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820144900027.png)

这样我们的文件就恢复啦，非常棒！

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-202208201449334031.png" alt="image-20220820144933403" style="zoom:50%;" />

如果我们想恢复所有文件至上一次提交的状态，就可以这样做

```shell
git checkout HEAD .
```

这样我们修改所有文件后都会回滚至上一次的版本了

![image-20220820145529019](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820145529019.png)

# 三、远程仓库操作

## 3.1 修改远程仓库地址

```shell
git remote rm origin  # 删除
```

```shell
git remote add origin https://github.com/用户名/仓库名  # 添加
```

## 3.2 合并远程仓库和分支下的文件

```shell
git pull origin main
```

## 3.3 将本地分支推送到远程主机的分支上

```shell
git push (--force) origin (--delete) main:main  # 远程主机名 本地分支名:远程分支名(相同可不写)
```

# 四、文件的回滚

## 4.1 查看当前未提交的版本的改动

```shell
git diff
```

红色的是上一版本的，绿色是当前修改后的，减号表示删除的内容，加号表示新增的内容

![image-20230529153045566](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230529153045566.png)

## 4.2 查看历史提交记录

```shell
git reflog
```

黄字是版本号，HEAD后的数字是第n次的提交历史，commit是提交时候的备注

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230529153942765.png" alt="image-20230529153942765" style="zoom: 67%;" />

## 4.3 退回指定的版本

```shell
git reset --hard {版本号}
```

![image-20230529153853743](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230529153853743.png)

## 4.4 对比两个版本的区别

```shell
git diff {版本号1} {版本号2} [文件路径]
```

会分别展示两个版本的区别，但是写得很乱，我都看不懂。

而且这两个版本相隔太久，差别很大，在这里无法真正体现出区别。

![image-20230529154317054](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230529154317054.png)

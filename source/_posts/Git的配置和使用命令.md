---
title: Git的配置和使用命令
date: 2022-4-26 16:22:15
updated: 2023-9-5 21:35:00
categories: 
- 学习
tags: 
- Git
keywords:
- Git
description: Git的配置、使用，足够个人使用
cover: https://www.mrfangge.com/img/blog/git.jpg
top_img: https://www.mrfangge.com/img/blog/git.jpg
top: 999
---

> 

> 前言：版本管理一直是很多人忽视的，自从我学习以来，我一直就认为版本管理是软件开发过程中的一个重要环节，它能够帮助开发人员对特定功能的集合或特定代码构建结果进行管理。通过有效的版本管理，可以确保编码阶段的顺利推进、保证产品功能和质量尽可能地符合预期，并帮助团队积极地应对需求变更，并及时应对版本问题，从而制定有针对性的版本优化。然而很多人往往视版本管理如草芥，认为代码只要能按预期进行改善就不需要这么"繁琐"的东西，这是事实上是一种“无售后保证”的思维——尽管产品已经结束开发阶段，进入维护阶段乃至消亡阶段，但是我们仍能通过版本管理工具获得完整的版本变更记录，从而得到有迹可循的开发历史，这不失为一种脚踏实地做开发的行为体现，而且也能杜绝一些开发团队中存在的”小毛病“，从心理上规范开发流程。因此，我们要正确对待版本管理，并好好利用现有的强大工具——Git，来学习这门技术！这也是我一直长期更新学习中遇到的Git问题并记录下来的原因。
>
> ——01Petard/伪音花火/Pseudnuos

# 简单汇总

![IMG_9699](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/IMG_9699.jpg)

# 一、安装和配置

## 1. 官网下载安装

> https://git-scm.com/downloads

## 2. 配置基本信息

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

## 3. 配置ssh key

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

## 4. 将ssh key添加到github上

### 4.1 点击Settings

![img](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/webp)

### 4.2 点击New SSH key

![img](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/webp-20220820172054065)

### 4.3 添加key

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/webp-20220820172058826" alt="img" style="zoom:67%;" />

### 4.5 验证链接

```shell
ssh -T git@github.com 
```

输入创建ssh key时的密码，如果打印以下信息则表示成功！

![image-20220820150350017](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820150350017.png)

# 二、本地仓库操作

## 1. 创建仓库

### 1.1 创建一个Github仓库

![image-20220820151031468](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820151031468.png)
![image-20220820151126921](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820151126921.png)

### 1.2 创建一个本地仓库

```
git init
```

回到本地，新建一个测试文件夹，里面放点文件，写点东西

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820141754957.png" alt="image-20220820141754957" style="zoom:67%;" />

### 1.3 创建一个忽略的文件列表

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

## 2. 文件提交 

### 2.1 显示当前目录下的提交文件状态

```shell
git status
```

这是还没提交时的状态

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820141648087.png" alt="image-20220820141648087" style="zoom:50%;" />

这是已经提交的状态

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142117819.png" alt="image-20220820142117819" style="zoom:50%;" />

### 2.2 添加工作区的文件到暂存区

```shell
git add [文件]
```

### 2.3 删除暂存区的文件

```shell
git rm --cached [文件]
```

### 2.4 创建提交

```shell
git commit -m "[提交信息]"
```

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142004725.png" alt="image-20220820142004725" style="zoom:50%;" />

### 2.5 删除提交

```shell
# 暂存区有文件时无法运行
git rebase -i HEAD~x
```

`x`：显示交互的HEAD引用记录条数

`git rebase -i` 命令参数解释：

- `pick`: 提交这个版本。
- `drop`: 删除这个版本。

除此之外还有参数，比如`reword`、`edit`、`squash、`、`fixup`、`exec`，但是都不常用，不做解释。

### 2.6 显示未推送的提交

```shell
git log origin/main..main
```

> 比较远程的origin/main和本地的main分支，下同

![image-20230905192357726](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230905192357726.png)

```shell
git log --graph origin/main..main
```

![image-20230905192459811](C:\Users\hzx\AppData\Roaming\Typora\typora-user-images\image-20230905192459811.png)

### 2.7 显示分支的提交历史

```shell
git log
```

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820143035714.png" alt="image-20220820143035714" style="zoom:50%;" />

### 2.8 显示仓库的引用历史

```shell
git reflog
```

`git reflog` 命令用于显示当前仓库的引用日志。引用日志记录了所有对 HEAD 指针的更新操作，包括提交、分支切换、重置等。每次更新操作都会在引用日志中生成一条新记录。

使用 `git reflog` 命令可以帮助你查看当前仓库的历史操作记录，以便在出现问题时进行故障排除和恢复。例如，如果你不小心删除了一个分支，你可以使用 `git reflog` 命令查找该分支最后一次提交的 SHA 值，然后使用该 SHA 值重新创建分支。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230529153942765.png" alt="image-20230529153942765" style="zoom: 67%;" />

![image-20230905195922002](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230905195922002.png)

## 3. 分支操作

### 3.1 查看所有分支

```shell
git branch
```

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142317696.png" alt="image-20220820142317696"  />

当前只有一个master分支，如果之前配置好了默认分支名为main，这里因该是main

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142236554.png" alt="image-20220820142236554"  />

### 3.2 重命名分支

```shell
git branch -m [分支原名] [分支新名]
```

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142335452.png" alt="image-20220820142335452"  />

我们回去再看，main分支名字已经改好了

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142401035.png" alt="image-20220820142401035"  />

### 3.3 创建分支、切换分支

创建分支

```shell
git branch [分支名]
```

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142427801.png" alt="image-20220820142427801"/>

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142449749.png" alt="image-20220820142449749"/>

切换分支

```shell
git checkout [分支名]
```

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142530391.png" alt="image-20220820142530391"/>

可以看到现在在issue1分支下了

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142547405.png" alt="image-20220820142547405"/>

创建并切换到分支

```shell
git checkout -b [分支名]
```

创建分支并切换到此分支下，也可以这么做，更快捷

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142653257.png" alt="image-20220820142653257"  />

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820142712261.png" alt="image-20220820142712261"  />

## 4. 合并分支

### 4.1 合并两个分支的最新提交到新的分支

```shsell
git checkout -b [分支名]
```

```shell
git merge [分支1] [分支2]
```

merge选定的分支，会合并两个分支的最新提交

### 4.2 合并两个分支的某个提交到新的分支

```shell
git checkout [分支名]
```

```shell
git cherry-pick <issue1-commit-sha>
git cherry-pick <issue2-commit-sha>
```

### 4.3 合并某个分支上的提交到选定的分支

```shell
git checkout [分支名]
```

```shell’
git cherry-pick <issue-commit-sha>
```

## 5. 文件回滚

> 回滚十分重要，这也是版本管理的初衷——保证文件的可管理性。回滚在错误还原、情景复现等场景中十分重要，救我好几次了！
### 5.1 对比：git checkout和git reset

|           | git checkout                                     | git reset                    |
| --------- | ------------------------------------------------ | ---------------------------- |
| **作用**  | 恢复文件、切换分支（切换前暂存区不能有文件）     | 恢复文件                     |
| **影响1** | 只会更新工作区中的文件，不会影响暂存区和当前分支 | 会更新暂存区和工作区中的文件 |
| **影响2** | 不会影响未提交更改                               | 会丢弃所有未提交的更改       |

### 5.2 切换版本文件

```shell
git checkout HEAD/HEAD~n/<issue-commit-sha> [文件]/.
```

回滚某些文件到上一次的版本

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820144900027.png" alt="image-20220820144900027"  />

回滚所有文件到上一次的版本

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220820145529019.png" alt="image-20220820145529019"  />

### 5.3 重置版本文件

```shell
git reset --hard/--soft/--mixed HEAD/HEAD~n/<issue-commit-sha> [文件]/.
```

- `--hard`：重置HEAD、暂存区和工作区，**丢弃所有未提交更改**。

  > 简单粗暴的版本回滚办法，尽管现有的工作量会白费，但是错误也不会产生了。

- `--soft`：重置HEAD。不影响暂存区和工作区。

  > 会回滚到某个版本，但是之前所作的工作会保留下来。比如你在某分支下做了一些工作，然后当你切换到另一个分支时，希望可以将原来的工作成果继承过来，就可以使用这个命令。又比如你提交了几次，但是觉得目前的工作还没有完成，就可以使用这个方法”撤销提交“，回到某个版本并将之前的工作量保留下来。

- `--mixed`：重置HEAD和暂存区。不影响工作区。

  > 和soft相比，mixed会更严格。如果你不想保留暂存区已经添加的文件，可以用mixed；如果你”心软“，就可以用soft，但是在整体提交的时候不要忘了解决冲突。
  >
  > 如果你重置版本的时候已经”心无挂念“了，谁爱提交就提交去吧，就可以用mixed。

版本重置成功！

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230529153853743.png" alt="image-20230529153853743" align="left"/>

# 三、远程仓库操作

## 1. 修改远程仓库地址

```shell
git remote rm origin  # 删除
```

```shell
git remote add origin https://github.com/用户名/仓库名  # 添加
```

## 2. 拉取合并远程仓库的文件

```shell
git pull origin main
```

## 3. 将本地分支推送到远程主机的分支上

```shell
git push (--force) origin (--delete) main:main  # 远程主机名 本地分支名:远程分支名(相同可不写)
```

# 四、文件对比

## 1. 查看当前未提交的版本的改动

```shell
git diff (HEAD~0) (HEAD~1)
```

红色的是上一版本的，绿色是当前修改后的，减号表示删除的内容，加号表示新增的内容

![image-20230529153045566](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230529153045566.png)

## 2. 对比两个版本的区别

```shell
git diff <issue1-commit-sha> <issue2-commit-sha>
```

会分别展示两个版本的区别，但是写得很乱，我都看不懂。

而且这两个版本相隔太久，差别很大，在这里无法真正体现出区别。

![image-20230529154317054](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230529154317054.png)

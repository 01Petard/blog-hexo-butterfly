---
title: node与npm的一些命令
date: 2022-02-24 15:22:15
updated:
categories: 
- 学习
tags: 
- node
- npm
- n
keywords:
- node
- npm
description: 关于node和npm的配置、管理、使用命令
cover: https://miro.medium.com/max/320/1*-K2xJ8OwCmcgxmzVvMbASQ.png
top_img: https://t1.daumcdn.net/cfile/tistory/2730E047583D519839
---

1、查看node版本

```shell
node -v
```

2、查看npm版本

```shell
npm -v
```

3、配置npm镜像加速

```shell
(1).永久使用
npm config set registry http://registry.npm.taobao.org
(2)、临时使用
命令后直接加：
--registry=https://registry.npm.taobao.org
```

4、验证配置是否加载成功

```shell
npm config get registry
或
npm info express
```

5、删除镜像

```shell
npm config set registry https://registry.npmjs.org
```

6、安装node版本管理工具n

```shell
sudo npm install n -g
```

7、查看当前有哪些node版本（按“q”退出）

```shell
sudo n
```

8、安装一个node版本

```shell
sudo n 16.13.0
```

9、查看全局安装过的依赖模块 npm list -g --depth 0

```shell
npm list -g --depth 0
```

10、查看当前项目安装过的依赖模块

```shell
npm list --depth 0
```


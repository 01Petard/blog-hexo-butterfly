---
title: node与nvm的常用命令
date: 2024-03-30 21:51:00
updated: 2024-03-30 21:51:00
categories: 
- 学习
tags: 
- node
- npm
- nvm
keywords:
- node
- npm
- nvm
description: 所有关于node、nvm的常用命令
cover: https://miro.medium.com/v2/resize:fit:1400/1*Edi25WBkumBB4IvU9eA5Bw.jpeg
top_img: https://www.myfreax.com/content/images/size/w816/2019/07/nvm.webp
---

### node -v

`查看node版本`

### npm -v

`查看npm版本`

### npm config set registry http://registry.npm.taobao.org

`配置npm镜像加速`

### npm config get registry

`验证配置是否加载成功`

### npm list -g --depth 0

`查看全局安装过的依赖模块`

### npm list --depth 0

`npm list --depth 0`

记录关于nvm在管理nodejs时要用到的命令

### nvm list

`nvm list：`可以显示已经安装的node版本列表，如下所示：

```bash
nvm list              # 显示已安装的版本(同 nvm list installed)
nvm list installed    # 显示已安装的版本
nvm list available    # 显示所有可以下载的版本
```

### nvm install

`nvm install 版本号`：安装指定版本的node

```bash
nvm install 12.22.0    # 安装12.22.0版本node
nvm install latest     # 安装最新版本node
```

注：当运行`nvm install`命令时，若出现权限问题，可以使用管理员身份运行cmd

### nvm use

`nvm use 版本号` ：使用指定版本的node

```bash
nvm use 12.122.0       # 使用12.22.0版本node
```

**注：当我们要使用npm时，需要先指定node版本，即先运行`nvm use`命令，再使用`npm`命令**

### nvm uninstall

`nvm uninstall 版本号` ：卸载指定版本的node

```bash
nvm uninstall 16.16.0  # 卸载16.16.0版本node
```

### 总结

`nvm`是一个非常好用的node版本管理工具，避免了我们需要重复安装卸载不同版本的`node.js`的问题，提高了我们的工作效率。安装nvm还是比较推荐使用下载安装包的方式，更为直接，能够直接看到步骤，也更容易定位问题。



![image-20231212183133841](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202312121831971.png)




---
title: 使用node与nvm部署hexo博客
date: 2024-03-30 21:51:00
updated: 2024-04-08 11:51:00
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
description: 从0开始部署hexo博客的node、nvm常用命令
cover: https://miro.medium.com/v2/resize:fit:1400/1*Edi25WBkumBB4IvU9eA5Bw.jpeg
top_img: https://www.myfreax.com/content/images/size/w816/2019/07/nvm.webp
---

## 安装nvm

`nvm`是一个非常好用的node版本管理工具，避免了我们需要重复安装卸载不同版本的`node.js`的问题，提高了我们的工作效率。安装nvm还是比较推荐使用下载安装包的方式，更为直接，能够直接看到步骤，也更容易定位问题。

```shell
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

```shell
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
```

```shell
source ~/.bashrc
```

## 安装nodejs

在Windows和Macos上安装nodejs较方便，但是在Linux上就非常不方便，特此记录

去官网下载链接：[http://nodejs.cn/download](http://nodejs.cn/download/)

选择Linux二进制文件（x64）

![image-20240401230017772](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404012300868.png)

或用wget命令下载指定版本的包

```shell
wget https://nodejs.org/dist/v14.15.4/node-v14.15.4-linux-x64.tar.xz
```

```shell
wget https://nodejs.org/dist/v16.13.0/node-v16.13.0-linux-x64.tar.xz
```

解压缩

```shell
tar -xvf node-v14.15.4-linux-x64.tar.xz
mkdir -p /usr/local/nodejs
（之后所有nodejs安装的文件，例如“hexo”都会保存在/usr/local/nodejs目录下）
mv node-v14.15.4-linux-x64/* /usr/local/nodejs/
```

```shell
tar -xvf node-v16.13.0-linux-x64.tar.xz
mkdir -p /usr/local/nodejs
（之后所有nodejs安装的文件，例如“hexo”都会保存在/usr/local/nodejs目录下）
mv node-v16.13.0-linux-x64/* /usr/local/nodejs/
```

创建软链接

```shell
# 建立node软链接
ln -s /usr/local/nodejs/bin/node /usr/local/bin
# 建立npm 软链接
ln -s /usr/local/nodejs/bin/npm /usr/local/bin
```

更换镜像源

```shell
# 设置镜像源加速
npm config set registry https://registry.npmmirror.com
# 查看设置信息
npm config list
# 验证配置是否加载成功
npm config get registry
```

验证是否安装成功

```shell
node -v
npm -v
```

## 安装hexo

安装hexo

```shell
npm install hexo-cli -g
```

创建软链接

```shell
（如果之前已经链接过hexo了，则删除/usr/local/bin目录下的hexo软链接，重新添加hexo软链接）
ln -s /usr/local/nodejs/bin/hexo /usr/local/bin
（这里的“/usr/local/nodejs/bin/hexo”就是nodejs安装的hexo命令文件目录）
```

查看是否生效

```shell
hexo -v
```

## 安装pm2

安装pm2

```
npm install pm2 -g
```

（如果命令没有找到，则需要软链接一下pm2）

 ```shell
ln -s /usr/local/nodejs/bin/pm2 /usr/local/bin
 ```

在博客根目录下创建文件`hexo_run.cjs`

```javascript
const { exec } = require('child_process')
exec('hexo server',(error, stdout, stderr) => {
    if(error){
        console.log('exec error: ${error}')
        return
    }
    console.log('stdout: ${stdout}');
    console.log('stderr: ${stderr}');
})
```

在博客目录下运行脚本

```shell
pm2 start hexo_run.cjs
```

![image-20240401225914113](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404012259254.png)

关闭脚本

```shell
pm2 stop hexo_run.cjs
```

![image-20240401225935604](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404012259639.png)

## node和nvm常用命令

### npm list -g --depth 0

`查看全局安装过的依赖模块`

### npm list --depth 0

`记录关于nvm在管理nodejs时要用到的命令`

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




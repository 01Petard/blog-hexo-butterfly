---
title: 在m1Mac上打开exe程序
date: 2022-09-14 18:06:15
updated:
categories: 
- 软件
tags: 
- Mac
- Windows
- exe程序
- CrossOver
- wine
keywords:
- Mac
- Windows
- exe程序
- CrossOver
- Wine
description: 一种可以在arm架构Mac上运行exe程序的办法
cover: https://cdn.akamai.steamstatic.com/steam/apps/1905180/capsule_616x353.jpg?t=1654173198
top_img: https://cdn.cloudflare.steamstatic.com/steam/apps/1905180/ss_f7aa6c7a804e0a06ea5a9742a9afc15f637d498e.1920x1080.jpg?t=1654173198
---

记录一下，如何在arm架构芯片的Mac上打开exe后缀的windows程序

也是参考了这个视频

> https://www.bilibili.com/video/BV1mW4y1k7GF

# PS

这种方法是安装Wine CrossOver，但是Github上还有一种方法，就是安装CrossOver，它们俩都可以实现mac打开exe程序，相比之下，Wine CrossOver使用方便，CrossOver简洁、有GUI界面。

我下面介绍的方法是左边的，你也可以去MacWk安装右边的CrossOver，有兴趣可以自己研究一下。

> https://macwk.com/soft/crossover

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220914180954000.png" alt="image-20220914180954000" style="zoom: 50%;" />

# Wine CrossOver安装步骤

1. 安装好homebrew，这个程序员都懂的，就不提了。
2. 

```shell
brew tap gcenx/wine
```

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220914173839105.png" alt="image-20220914173839105"  />

3. 

```shell
brew install --cask --no-quarantine wine-crossover
```

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220914173901541.png" alt="image-20220914173901541" style="zoom: 33%;" />

# 调整

```shell
winecfg
```

会弹出一个古老的窗口（win2003？）窗口，如果没声音，可以调整一下音频。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220914174005477.png" alt="image-20220914174005477" style="zoom:33%;" />

# 完成

然后开一个游戏试试

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220914174158757.png" alt="image-20220914174158757" style="zoom: 33%;" />

很不幸，报错打不开（悲）

<img src="/Users/hzx/Library/Application%20Support/typora-user-images/image-20220914174910056.png" alt="image-20220914174910056" style="zoom:33%;" />

但是万华镜就打开了……说明还得看情况，暂时不清楚打不开的原因是什么（大悲）

另外，有些游戏的存档如果不是在根目录的话也会消失，但是万华镜的还在。。

所以还是得具体问题具体分析。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20220914175300224.png" alt="image-20220914175300224" style="zoom: 25%;" />

然后又试了很多，发现问题百出，有的文字显示不了、有的显示比例不对，总之还是不能完美地运行，但是起码有了一个比较好的开始了，有总比没有强吧。


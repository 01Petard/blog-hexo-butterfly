---
title: Mac删除OBS的虚拟摄像头
date: 2022-06-02 22:13:15
updated:
categories: 
- 软件
tags: 
- Mac
- OBS
- 虚拟摄像头
keywords:
- OBS
- 虚拟摄像头
description: 解决Mac下无法彻底删除OBS虚拟摄像头插件的问题
cover: https://cdn.akamai.steamstatic.com/steam/apps/1905180/capsule_616x353.jpg?t=1654173198
top_img: https://cdn.cloudflare.steamstatic.com/steam/apps/1905180/ss_f7aa6c7a804e0a06ea5a9742a9afc15f637d498e.1920x1080.jpg?t=1654173198

---

参考帖子：

> https://obsproject.com/forum/threads/how-to-uninstall-obs-virtual-camera.146837/

解决命令：⬇️直接用就行了

```shell
sudo rm -rf /Library/CoreMediaIO/Plug-Ins/DAL/obs-mac-virtualcam.plugin
```

```shell
sudo rm -rf /Library/Application\ Support/obs-studio/plugins/obs-mac-virtualcam
```


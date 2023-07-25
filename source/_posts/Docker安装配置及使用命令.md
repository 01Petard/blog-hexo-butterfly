---
title: Docker安装配置及使用命令
date: 2023-07-25 22:06:15
updated: 2023-07-25 22:06:15
categories: 
- 学习
tags: 
- Docker
- 虚拟机
- Linux
keywords:
- Docker
- 虚拟机
- Linux
description: 在虚拟机上装使用Docker部署
cover: https://developers.redhat.com/sites/default/files/styles/article_feature/public/blog/2014/05/homepage-docker-logo.png?itok=zx0e-vcP
top_img: https://www.docker.com/wp-content/uploads/2023/06/meta-image-what-is-a-container.png
---

## 前置工作

- 安装VMware虚拟机，随便找个教程即可

- 下载CentOS7 64位界面，推荐无GUI的简洁版

  > [最小安装CentOS 7.6 Linux系统](https://blog.csdn.net/qq_43003203/article/details/126163768)

## 安装Docker

1. 卸载系统之前的 docker

   ```shell
   sudo yum remove docker \
   docker-client \
   docker-client-latest \
   docker-common \
   docker-latest \
   docker-latest-logrotate \
   docker-logrotate \
   docker-engine
   ```

2. 安装 Docker-CE

   安装必须的依赖

   ```shell
   sudo yum install -y yum-utils \
   device-mapper-persistent-data \
   lvm2
   ```

   设置 docker repo 的 yum 位置

   ```shell
   sudo yum-config-manager \
   --add-repo \
   https://download.docker.com/linux/centos/docker-ce.repo
   ```

   安装 docker，以及 docker-cli

   ```shell
   sudo yum install docker-ce docker-ce-cli containerd.io
   ```

3. 启动Docker

   ```shell
   sudo systemctl start docker
   ```

4. 设置Docker开机自启

   ```shell
   sudo systemctl enable docker
   ```

5. 配置镜像加速（Ubuntu、CentOS）

   ```shell
   sudo mkdir -p /etc/docker
   sudo tee /etc/docker/daemon.json <<-'EOF'
   {
     "registry-mirrors": ["https://uf5mphyd.mirror.aliyuncs.com"]
   }
   EOF
   sudo systemctl daemon-reload
   sudo systemctl restart docker
   ```

6. Docker中文文档

   > [docker 中文文档]([docker 中文文档 | 简果网 (simapple.com)](https://www.simapple.com/docker-chinese-manual))
   >
   > [docker中文文档 （菜鸟笔记）](https://www.coonote.com/docker/docker-tutorial.html)

## Docker常用命令

拉取镜像

```shell
docker pull [image]:[version]
```

删除镜像

```shell
docker rmi [image]
```

运行容器

```shell
docker run [container] --expose 80 --expose 443 [image]
```

启动容器

```shell
docker start [container]
```

重启容器

```shell
docker restart [container]
```

查看下载的镜像

```shell
docker images
```

查看容器的详细信息

```shell
docker inspect [container]
```

查看docker中正在运行的容器

```shell
docker ps [-a]
```

在容器中执行命令

```shell
docker exec [...]
```

进入容器文件系统

```shell
docker exec -it [container] /bin/bash
docker exec -it [container] bash
```

停止指定的容器

```shell
docker stop [container]
```

强制停止指定的容器

```shell
docker kill [container]
```

删除指定容器

```shell
docker rm [container]
```

查看容器的日志

```shell
docker logs [container]
```

查看容器的端口映射

```shell
docker port [container]
```

![image-20230725224300588](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230725224300588.png)

> - `port/tcp` 表示容器内部的端口号和协议类型；
> - `0.0.0.0:port1->port2/tcp` 表示将主机的端口号映射到容器内部的端口号，其中`0.0.0.0`表示监听所有的网络接口；
> - `:::port1->port2/tcp` 表示将主机的端口号映射到容器内部的端口号，其中`:::`表示监听所有的IPv6网络接口。

## Docker安装配置Mysql

下载mysql5.7镜像文件

```shell
docker pull mysql:5.7
```

创建实例并启动

```shell
docker run -p 3306:3306 --name mysql \
-v /mydata/mysql/log:/var/log/mysql \
-v /mydata/mysql/data:/var/lib/mysql \
-v /mydata/mysql/conf:/etc/mysql \
-e MYSQL_ROOT_PASSWORD=root \
-d mysql:5.7
```

> 参数说明：
> -p 3306:3306：将容器的 3306 端口映射到主机的 3306 端口
> -v /mydata/mysql/conf:/etc/mysql：将配置文件夹挂载到主机
> -v /mydata/mysql/log:/var/log/mysql：将日志文件夹挂载到主机
> -v /mydata/mysql/data:/var/lib/mysql/：将配置文件夹挂载到主机
> -e MYSQL_ROOT_PASSWORD=root：初始化 root 用户的密码

配置mysql

```shell
vi /mydata/mysql/conf/my.cnf
```

```shell
[mysqld]
user=mysql
character-set-server=utf8
default_authentication_plugin=mysql_native_password
secure_file_priv=/var/lib/mysql
expire_logs_days=7
sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION
max_connections=1000

init_connect='SET collation_connection = utf8_unicode_ci' init_connect='SET NAMES utf8' character-set-server=utf8
collation-server=utf8_unicode_ci
skip-character-set-client-handshake
skip-name-resolve

[client]
default-character-set=utf8

[mysql]
default-character-set=utf8
```

进入容器的mysql命令行

```shell
docker exec -it mysql mysql -uroot -proot
```

设置远程访问

```shell
grant all privileges on *.* to 'root'@'%' identified by 'root' with grant option;
flush privileges;
```


## Docker安装配置Redis

下载最新的镜像

```shell
docker pull redis
```

创建实例并启动

```shell
mkdir -p /mydata/redis/conf
```

```shell
touch /mydata/redis/conf/redis.conf
```

```shell
docker run -p 6379:6379 --name redis -v /mydata/redis/data:/data \
-v /mydata/redis/conf/redis.conf:/etc/redis/redis.conf \
-d redis redis-server /etc/redis/redis.conf
```

使用redis镜像执行redis-cli命令连接

```shell
docker exec -it redis redis-cli
```

## 网络相关：关闭防火墙

开启防火墙

```shell
systemctl start firewalld
```

关闭防火墙

```shell
systemctl stop firewalld
```

禁用防火墙

```shell
systemctl disable firewalld
```

设置某个服务开机自启动

```shell
systemctl enable [...]
```


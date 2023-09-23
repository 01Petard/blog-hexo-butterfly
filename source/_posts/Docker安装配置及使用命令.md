---
title: Docker安装配置及使用命令
date: 2023-07-25 22:06:15
updated: 2023-09-23 17:10:15
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
cover: https://miro.medium.com/v2/resize:fit:1400/0*ddZLS-Gd9GFc71Lc
top_img: https://www.docker.com/wp-content/uploads/2023/06/meta-image-what-is-a-container.png
top: 998
---

> 虚拟机用户：root，密码：1234
>
> Mysql账户：root，密码：root

## 安装CentOS

- 安装VMware虚拟机，随便找个教程即可

- 下载CentOS7 64位界面，推荐无GUI的简洁版

  > [最小安装CentOS 7.6 Linux系统](https://blog.csdn.net/qq_43003203/article/details/126163768)

## 关闭Linux防火墙

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

### 镜像

拉取镜像

```shell
docker pull [image]:[version]
```

保存镜像

```shell
docker save -o [saved_image].tar [image]:[version]
```

加载镜像

```shell
docker load -i [saved_image].tar
```

推送镜像

```shell
docker push
```

构建镜像

```shell
docker build
```

查看下载的镜像

```shell
docker images
```

删除镜像

```shell
docker rmi [image]
```

### 容器

运行容器

```shell
docker run \
-p [port_linux]:[port_container]  \
--name [container_name] \
-v [uri_linux]:[uri_container] \
-v [volume]:[uri_container] \
-d \
[image]:[version] \
...
```

启动容器

```shell
docker start [container]
```

重启容器

```shell
docker restart [container]
```

停止/强制停止容器

```shell
docker stop/kill [container]
```

删除容器

```shell
docker rm (-f) [container]
```

暂停容器

```shell
docker pause [container]
```

恢复容器

```shell
docker unpause [container]
```

查看容器的详细信息

```shell
docker inspect [container]
```

查看docker中正在运行的容器

```shell
docker ps (-a)
```

查看容器的日志

```shell
docker logs [container] (-f)
```

### 容器内部

在容器中执行命令

```shell
docker exec [...]
```

进入容器文件系统

```shell
docker exec -it [container] /bin/bash
docker exec -it [container] bash
```

查看容器的端口映射

```shell
docker port [container]
```

![image-20230725224300588](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230725224300588.png)

> - `port/tcp` 表示容器内部的端口号和协议类型；
> - `0.0.0.0:port1->port2/tcp` 表示将主机的port1端口映射到容器内部的port2端口，`0.0.0.0`表示监听所有的网络接口，`:::`表示监听所有的IPv6网络接口。

设置容器的自动启动

```shell
sudo docker update [container] --restart=always
```

### 数据卷

创建数据卷

```shell
docker volume create [volume] 
```

查看所有数据卷

```shel;l
docker volume ls
```

查看数据卷的详细信息

```shell
docker volume inspect [volume] 
```

删除未使用的数据卷

```shell
docker volume prune [volume] 
```

删除数据卷

```shell
docker volume rm [volume] 
```

### 构建镜像

```shell
docker build -t [image]:[version] ./[uri_dockerfile]
```

uri_dockerfile目录下必须包含"DockerFile"和"Dockerfile中需要的文件"

### 部署微服务集群

在docker-compose.yml中配置好

```shell
docker-compose up -d
```

## 安装Portainer可视化管理面板

拉取Portainer镜像

```shell
docker pull portainer/portainer-ce  # 英文版
```

```shell
docker pull 6053537/portainer-ce   # 汉化版
```

创建实例并启动

```shell
docker run -d -p 9000:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock --name portainer 6053537/portainer-ce
```

## 安装Mysql

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


## 安装Redis

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

> 参数说明：
> `-p 6379:6379`：将容器的 6379 端口映射到Linux机的 6379 端口
> `-v /mydata/redis/data:/data`：将redis数据库挂载到主机
> `-v /mydata/redis/conf/redis.conf:/etc/redis/redis.conf`：将配置文件夹挂载到主机
> `-d redis redis-server /etc/redis/redis.conf`：使用redis-server命令将使用配置运行


```shell
mkdir -p /mydata/redis2/conf
touch /mydata/redis2/conf/redis.conf
docker run -p 6380:6379 --name redis2 -v /mydata/redis2/data:/data \
-v /mydata/redis2/conf/redis.conf:/etc/redis/redis.conf \
-d redis redis-server /etc/redis/redis.conf
```

> 参数说明：
> `-p 6380:6379`：将容器的 6379 端口映射到Linux机的 6380 端口

```shell
mkdir -p /mydata/redis3/conf
touch /mydata/redis3/conf/redis.conf
docker run -p 6381:6379 --name redis3 -v /mydata/redis3/data:/data \
-v /mydata/redis3/conf/redis.conf:/etc/redis/redis.conf \
-d redis redis-server /etc/redis/redis.conf
```

使用redis镜像执行redis-cli命令连接

```shell
docker exec -it redis redis-cli
```

进入部署的redis命令行

```
docker exec -it redis redis-cli
```

Redis配置文件需要修改的项

```shell
# 注释掉这部分，不限制redis只能本地访问
bind 127.0.0.1
# 关闭保护模式，不限制为本地访问
protected-mode no
# （必改）是否开启守护线程，守护线程可后台运行，除非kill进程。改为yes会使配置文件方式启动redis失败！！
daemonize no


# 是否压缩，建议开启，否则rdb文件会变得巨大
rdbcompression yes
# （可选）RDB文件名称
dbfilename mydump.rdb
# （可选）数据库个数
databases 16
# rdb文件保存的路径目录
dir ./

# （可选）开启AOF持久化
appendonly yes
# AOF文件比上次文件增长超过多少百分比则出发重写，默认100%
auto-aof-rewrite-percentage 100
# AOF文件体积最小多大以上才触发重写，默认：64mb
auto-aof-rewrite-min-size 64mb
```

Redis持久化的RDB和AOF对比

|                | RDB                                          | AOF                                                         |
| -------------- | -------------------------------------------- | ----------------------------------------------------------- |
| 持久化方式     | 定时对整个内存做快照                         | 记录每一次执行的命令                                        |
| 数据完整性     | 不完整，两次备份之间会丢失                   | 相对完整，取决于刷盘策略                                    |
| 文件大小       | 会有压缩，文件体积小                         | 记录命令，文件体积很大                                      |
| 宕机恢复速度   | 很快                                         | 慢                                                          |
| 数据恢复优先级 | 低，因为数据完整性不如AOF                    | 高，因为数据完整性更高                                      |
| 系统资源占用   | 高，大量CPU和内存消耗                        | 低，主要占用磁盘IO资源，且重写时会占用大量CPU资源和内存资源 |
| 使用场景       | 可以容忍数分钟的数据丢失，追求更快的启动速度 | 对数据安全性要求较高                                        |

## 配置Redis主从关系

### 1、首先用Docker部署好三台Redis，部署好如下所示

主机为redis，ip地址：192.168.113.132:6379

从机为redis2和redis3，ip地址：192.168.113.132:6380和192.168.113.132:6381

![image-20230907171409814](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230907171409814.png)

### 2、进入docker沙箱内部操作redis

### 2.1 进入容器内部

```shell
docker exec -it redis2 bash
```

### 2.2 进入redis命令行

```shell
redis-cli
```

### 2.3 在从机上配置主机ip

```shell
slaveof 192.168.113.132 6379
replicaof 192.168.113.132 6379
```

另一个从机重复以上步骤：

```shell
docker exec -it redis3 bash
redis-cli
slaveof 192.168.113.132 6379
```

### 2.4 在主机上查看主从配置结果


```shell
info replication
```

![image-20230907172256490](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/image-20230907172256490.png)

至此，主从配置就好了！比单独部署更方便！

### 2.5 主从数据同步原理

#### 2.5.1 全量同步的流程

- slave节点请求增量同步
- master节点判断replid，发现不一致，拒绝增量同步
- master将完整内存数据生成RDB，发送RDB到slave
- slave清空本地数据，加载master的RDB
- master将RDB期间的命令记录在repl_baklog，并持续将log中的命令发送给slave
- slave执行接收到的命令，保持与master之间的同步

#### 2.5.2 增量同步的流程

master节点和slave节点中维护了一个环形数组（前文提到的repl_baklog）和一个指针为offset。

slave来申请增量同步，带着replid和offset，然后master根据获取offset之后的数据，将其发送给slave，slave进行同步。

- 此时会出现一个问题，当slave下限太久时，master中存储的数据已经超过了这个repl_baklog的上线，因此就需要重新进行全量同步。

## 安装nacos

windows下启动nacos

```shell
D:\devTools\nacos\bin\startup.cmd -m standalone
```


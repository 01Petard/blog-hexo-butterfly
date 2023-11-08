---
title: Docker安装配置及使用命令
date: 2023-07-25 22:06:15
updated: 2023-11-08 19:58:15
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
description: 在Linux上使用Docker部署相关服务
cover: https://miro.medium.com/v2/resize:fit:1400/0*ddZLS-Gd9GFc71Lc
top_img: https://www.docker.com/wp-content/uploads/2023/06/meta-image-what-is-a-container.png
top: 998
---

> 虚拟机用户：root，密码：1234
>
> Mysql账户：root，密码：root

> 服务器的ip和密码：
>
> IP：47.120.0.222
>
> 用户：root
>
> 密码：H开头的最长密码

## 安装CentOS

- 安装VMware虚拟机，随便找个教程即可

- 下载CentOS7 64位界面，推荐无GUI的简洁版

  > [最小安装CentOS 7.6 Linux系统](https://blog.csdn.net/qq_43003203/article/details/126163768)

## 查看Linux防火墙

查看防火墙状态：`systemctl status firewalld`

开启防火墙：`systemctl start firewalld`

关闭防火墙：`systemctl stop firewalld`

开启防火墙：`service firewalld start`

开机禁止启动防火墙：`systemctl disable firewalld.service`

开机允许启动防火墙：`systemctl unmask firewalld.service`、`systemctl start firewalld.service`

设置某个服务开机自启动：`systemctl enable [...]`

## 查看Linux端口是否对外开放

1、查询已经对外开放的端口：`netstat -anp`

2、查询指定端口是否已经开放：`firewall-cmd --query-port=8848/tcp`

返回**yes/no**。此时也有可能返回**firewalld is not running**，此时需要**打开防火墙在开放端口**。

## 开放Linux某个端口

添加指定需要开放的端口：`firewall-cmd --add-port=8848/tcp --permanent`

重载入添加的端口：`firewall-cmd --reload`

查询指定端口是否开启成功：`firewall-cmd --query-port=8848/tcp`

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

## 安装nodejs

在Windows和Macos上安装nodejs较方便，但是在Linux上就非常不方便，特此记录

去官网下载链接：[http://nodejs.cn/download](http://nodejs.cn/download/)

选择Linux二进制文件（x64）

![img](D:\devTools\Typora\学习\assets\v2-92bc8518d1788f784c6385a120c9b641_r.jpg)

或用wget命令下载指定版本的包

```shell
wget https://nodejs.org/dist/v14.15.4/node-v14.15.4-linux-x64.tar.xz
```

解压缩

```shell
tar -xvf node-v14.15.4-linux-x64.tar.xz
mkdir -p /usr/local/nodejs
（之后所有nodejs安装的文件，例如“hexo”都会保存在/usr/local/nodejs目录下）
mv node-v14.15.4-linux-x64/* /usr/local/nodejs/
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
# 设置国内淘宝镜像源
npm config set registry https://registry.npm.taobao.org
# 查看设置信息
npm config list
```

验证是否安装成功

```shell
node -v
npm -v
```

## 安装hexo部署博客

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

## 安装Portainer

> Portainer 是一款轻量级的应用，它提供了图形化界面，用于方便地管理Docker环境，包括单机环境和集群环境。

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

Portainer的默认账号和密码是：admin/admin，第一次进入需要创建用户

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

```shell
docker run -p 3388:3388 --name mysql8 \
-v /mydata/mysql8/log:/var/log/mysql \
-v /mydata/mysql8/data:/var/lib/mysql \
-v /mydata/mysql8/conf:/etc/mysql \
-e MYSQL_ROOT_PASSWORD=root \
-d mysql:latest
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

或 进入部署的redis命令行

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

### windows下启动nacos

下载nacos安装包：https://github.com/alibaba/nacos/releases

解压，进入bin目录下创建一个.bat文件，以后启动就双击这个.bat文件

my_startup.bat：`目录路径\nacos\bin\startup.cmd -m standalone`

正常的启动命令是：`startup.cmd -m standalone`

### Linux下安装nacos：

先远程连接服务器数据库，创建nacos数据库

```mysql
CREATE database if NOT EXISTS `nacos_config` default character set utf8mb4 collate utf8mb4_unicode_ci;
use `nacos_config`;
 
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = config_info   */
/******************************************/
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL COMMENT 'content',
  `md5` varchar(32) DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COMMENT 'source user',
  `src_ip` varchar(20) DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) DEFAULT NULL,
  `c_use` varchar(64) DEFAULT NULL,
  `effect` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `c_schema` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';
 
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = config_info_aggr   */
/******************************************/
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) NOT NULL COMMENT 'datum_id',
  `content` longtext NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';
 
 
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = config_info_beta   */
/******************************************/
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) DEFAULT NULL COMMENT 'app_name',
  `content` longtext NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COMMENT 'source user',
  `src_ip` varchar(20) DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';
 
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = config_info_tag   */
/******************************************/
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) DEFAULT NULL COMMENT 'app_name',
  `content` longtext NOT NULL COMMENT 'content',
  `md5` varchar(32) DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COMMENT 'source user',
  `src_ip` varchar(20) DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';
 
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = config_tags_relation   */
/******************************************/
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';
 
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = group_capacity   */
/******************************************/
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';
 
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = his_config_info   */
/******************************************/
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) NOT NULL,
  `group_id` varchar(128) NOT NULL,
  `app_name` varchar(128) DEFAULT NULL COMMENT 'app_name',
  `content` longtext NOT NULL,
  `md5` varchar(32) DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text,
  `src_ip` varchar(20) DEFAULT NULL,
  `op_type` char(10) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';
 
 
/******************************************/
/*   数据库全名 = nacos_config   */
/*   表名称 = tenant_capacity   */
/******************************************/
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';
 
 
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) default '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) default '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';
 
CREATE TABLE `users` (
    `username` varchar(50) NOT NULL PRIMARY KEY,
    `password` varchar(500) NOT NULL,
    `enabled` boolean NOT NULL
);
 
CREATE TABLE `roles` (
    `username` varchar(50) NOT NULL,
    `role` varchar(50) NOT NULL,
    UNIQUE INDEX `idx_user_role` (`username` ASC, `role` ASC) USING BTREE
);
 
CREATE TABLE `permissions` (
    `role` varchar(50) NOT NULL,
    `resource` varchar(255) NOT NULL,
    `action` varchar(8) NOT NULL,
    UNIQUE INDEX `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
);
 
INSERT INTO users (username, password, enabled) VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', TRUE);
 
INSERT INTO roles (username, role) VALUES ('nacos', 'ROLE_ADMIN');
```

拉取对应的镜像文件

```shell
docker pull nacos/nacos-server
```

接着挂载目录：

```shell
mkdir -p /mydata/nacos/data/
mkdir -p /mydata/nacos/logs/                   #新建logs目录
mkdir -p /mydata/nacos/init.d/                 
vim /mydata/nacos/init.d/custom.properties     #修改配置文件
```

```
server.contextPath=/nacos
server.servlet.contextPath=/nacos
server.port=8848
 
spring.datasource.platform=mysql
db.num=1
db.url.0=jdbc:mysql://localhost:3306/nacos_config? characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true #这里需要修改端口
db.user=root #用户名
db.password=root #密码
 
nacos.cmdb.dumpTaskInterval=3600
nacos.cmdb.eventTaskInterval=10
nacos.cmdb.labelTaskInterval=300
nacos.cmdb.loadDataAtStart=false
management.metrics.export.elastic.enabled=false
management.metrics.export.influx.enabled=false
server.tomcat.accesslog.enabled=true
server.tomcat.accesslog.pattern=%h %l %u %t "%r" %s %b %D %{User-Agent}i
nacos.security.ignore.urls=/,/**/*.css,/**/*.js,/**/*.html,/**/*.map,/**/*.svg,/**/*.png,/**/*.ico,/console-fe/public/**,/v1/auth/login,/v1/console/health/**,/v1/cs/**,/v1/ns/**,/v1/cmdb/**,/actuator/**,/v1/console/server/**
nacos.naming.distro.taskDispatchThreadCount=1
nacos.naming.distro.taskDispatchPeriod=200
nacos.naming.distro.batchSyncKeyCount=1000
nacos.naming.distro.initDataRatio=0.9
nacos.naming.distro.syncRetryDelay=5000
nacos.naming.data.warmup=true
nacos.naming.expireInstance=true
```

启动nacos容器：

```shell
docker  run \
--name nacos -d \
-p 8848:8848 \
--privileged=true \
--restart=always \
-e JVM_XMS=256m \
-e JVM_XMX=256m \
-e MODE=standalone \
-e PREFER_HOST_MODE=hostname \
-v /mydata/nacos/nacos/data:/home/nacos/data-v
-v /mydata/nacos/logs:/home/nacos/logs \
-v /mydata/nacos/init.d/custom.properties:/home/nacos/init.d/custom.properties \
nacos/nacos-server
```

（排错用）进入nacos容器编辑配置文件

```
docker exec -it nacos bash
cd conf
ll
vim application.properties
```

此时nacos容器就安装成功了可以打开浏览器进行登录：

```shell
https：xx.xx.xx.xx:8848/nacos
```

```
账号：nacos
密码：nacos
```

最后设置nacos自启动：

```shell
docker update --restart=always nacos
```


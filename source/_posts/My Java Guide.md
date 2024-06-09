---
title: My Java Guide
date: 2024-04-06 12:21:00
updated: 2024-04-17 23:00:00
categories: 
- 学习
tags: 
- Java
keywords:
- Java
description: Java, all in one！
cover: https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQChC-EwLOivWgSLpPH3v3bT_le_jAPVZkoKPZ1-go5eA&s
top_img: https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190718150152/Java-tutorials-by-GeeksForGeeks.png
top: 1000
---

# JavaSE

## NIO和BIO的区别

NIO（New IO）和BIO（Blocking IO）是Java编程语言中用于处理输入输出（IO）操作的两种不同机制，它们之间存在一些显著的区别。

- 工作原理：

  * BIO：这是一种同步阻塞式IO。服务器实现模式为“一个连接一个线程”，即当客户端发送请求时，服务器端需要启动一个线程进行处理。如果连接不进行任何操作，会造成不必要的线程开销。虽然可以通过线程池机制改善这个问题，但在高并发环境下，BIO的性能可能会受到影响，因为每个连接都需要创建一个线程，而且线程切换开销较大。

  * NIO：这是一种同步非阻塞式IO。服务器实现模式为“一个请求一个线程”，即客户端发送的连接请求都会注册到多路复用器（采用事件驱动思想实现）上，多路复用器轮询I/O请求时才启动一个线程进行处理。NIO在处理IO操作时，会把资源先操作至内存缓冲区，然后询问是否IO操作就绪。如果就绪，则进行IO操作；否则，进行下一步操作，并不断轮询是否IO操作就绪。

- 资源利用：

  * BIO：由于每个连接都需要创建一个线程，因此在高并发环境下可能会导致大量线程的创建和管理，这会增加系统开销。

  * NIO：通过单线程处理多个通道（Channel）的方式，减少了线程的数量，从而降低了系统开销。此外，NIO使用缓冲区（Buffer）进行数据的读写，提高了数据的处理效率。

- 应用场景：

  * BIO：适合一些简单的、低频的、短连接的通信场景，例如HTTP请求。

  * NIO：适用于高并发、长连接、大量数据读写的场景，如文件传输、分布式计算等。

总结来说，NIO和BIO在工作原理、资源利用和应用场景等方面都存在显著的差异。选择使用哪种IO模型取决于具体的应用需求和场景。





# 计算机基础

## OSI 七层模型是什么？每一层的作用是什么？

**OSI 七层模型** 是国际标准化组织提出的一个网络分层模型，其大体结构以及每一层提供的功能如下图所示：

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404061359765.png" alt="OSI 七层模型" style="zoom:100%;float: left;" />

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404061359201.png" alt="osi七层模型2" style="zoom:40%;float: left;" />

## TCP/IP 四层模型是什么？每一层的作用是什么？

**TCP/IP 四层模型** 是目前被广泛采用的一种模型,我们可以将 TCP / IP 模型看作是 OSI 七层模型的精简版本，由以下 4 层组成：

1. 应用层
2. 传输层
3. 网络层
4. 网络接口层

需要注意的是，我们并不能将 TCP/IP 四层模型 和 OSI 七层模型完全精确地匹配起来，不过可以简单将两者对应起来，如下图所示：

<img src="https://oss.javaguide.cn/github/javaguide/cs-basics/network/tcp-ip-4-model.png" alt="TCP/IP 四层模型" style="zoom:100%;float: left;" />

## 常见网络协议

**1. 应用层有哪些常见的协议？**

<img src="https://oss.javaguide.cn/github/javaguide/cs-basics/network/application-layer-protocol.png" alt="应用层常见协议" style="zoom:100%;float: left;" />

- **HTTP（Hypertext Transfer Protocol，超文本传输协议）**：基于 TCP 协议，是一种用于传输超文本和多媒体内容的协议，主要是为 Web 浏览器与 Web 服务器之间的通信而设计的。当我们使用浏览器浏览网页的时候，我们网页就是通过 HTTP 请求进行加载的。
- **SMTP（Simple Mail Transfer Protocol，简单邮件发送协议）**：基于 TCP 协议，是一种用于发送电子邮件的协议。注意 ⚠️：SMTP 协议只负责邮件的发送，而不是接收。要从邮件服务器接收邮件，需要使用 POP3 或 IMAP 协议。
- **POP3/IMAP（邮件接收协议）**：基于 TCP 协议，两者都是负责邮件接收的协议。IMAP 协议是比 POP3 更新的协议，它在功能和性能上都更加强大。IMAP 支持邮件搜索、标记、分类、归档等高级功能，而且可以在多个设备之间同步邮件状态。几乎所有现代电子邮件客户端和服务器都支持 IMAP。
- **FTP（File Transfer Protocol，文件传输协议）** : 基于 TCP 协议，是一种用于在计算机之间传输文件的协议，可以屏蔽操作系统和文件存储方式。注意 ⚠️：FTP 是一种不安全的协议，因为它在传输过程中不会对数据进行加密。建议在传输敏感数据时使用更安全的协议，如 SFTP。
- **Telnet（远程登陆协议）**：基于 TCP 协议，用于通过一个终端登陆到其他服务器。Telnet 协议的最大缺点之一是所有数据（包括用户名和密码）均以明文形式发送，这有潜在的安全风险。这就是为什么如今很少使用 Telnet，而是使用一种称为 SSH 的非常安全的网络传输协议的主要原因。
- **SSH（Secure Shell Protocol，安全的网络传输协议）**：基于 TCP 协议，通过加密和认证机制实现安全的访问和文件传输等业务
- **RTP（Real-time Transport Protocol，实时传输协议）**：通常基于 UDP 协议，但也支持 TCP 协议。它提供了端到端的实时传输数据的功能，但不包含资源预留存、不保证实时传输质量，这些功能由 WebRTC 实现。
- **DNS（Domain Name System，域名管理系统）**: 基于 UDP 协议，用于解决域名和 IP 地址的映射问题。

**2. 传输层有哪些常见的协议？**

<img src="https://oss.javaguide.cn/github/javaguide/cs-basics/network/transport-layer-protocol.png" alt="传输层常见协议" style="zoom:100%;float: left;" />

- **TCP（Transmission Control Protocol，传输控制协议 ）**：提供 **面向连接** 的，**可靠** 的数据传输服务。
- **UDP（User Datagram Protocol，用户数据协议）**：提供 **无连接** 的，**尽最大努力** 的数据传输服务（不保证数据传输的可靠性），简单高效。

**3. 网络层有哪些常见的协议？**

<img src="https://javaguide.cn/assets/nerwork-layer-protocol-VpGZIByy.png" alt="网络层常见协议" style="zoom:100%;float: left;" />

- **IP（Internet Protocol，网际协议）**：TCP/IP 协议中最重要的协议之一，属于网络层的协议，主要作用是定义数据包的格式、对数据包进行路由和寻址，以便它们可以跨网络传播并到达正确的目的地。目前 IP 协议主要分为两种，一种是过去的 IPv4，另一种是较新的 IPv6，目前这两种协议都在使用，但后者已经被提议来取代前者。
- **ARP（Address Resolution Protocol，地址解析协议）**：ARP 协议解决的是网络层地址和链路层地址之间的转换问题。因为一个 IP 数据报在物理上传输的过程中，总是需要知道下一跳（物理上的下一个目的地）该去往何处，但 IP 地址属于逻辑地址，而 MAC 地址才是物理地址，ARP 协议解决了 IP 地址转 MAC 地址的一些问题。
- **ICMP（Internet Control Message Protocol，互联网控制报文协议）**：一种用于传输网络状态和错误消息的协议，常用于网络诊断和故障排除。例如，Ping 工具就使用了 ICMP 协议来测试网络连通性。
- **NAT（Network Address Translation，网络地址转换协议）**：NAT 协议的应用场景如同它的名称——网络地址转换，应用于内部网到外部网的地址转换过程中。具体地说，在一个小的子网（局域网，LAN）内，各主机使用的是同一个 LAN 下的 IP 地址，但在该 LAN 以外，在广域网（WAN）中，需要一个统一的 IP 地址来标识该 LAN 在整个 Internet 上的位置。
- **OSPF（Open Shortest Path First，开放式最短路径优先）** ）：一种内部网关协议（Interior Gateway Protocol，IGP），也是广泛使用的一种动态路由协议，基于链路状态算法，考虑了链路的带宽、延迟等因素来选择最佳路径。
- **RIP(Routing Information Protocol，路由信息协议）**：一种内部网关协议（Interior Gateway Protocol，IGP），也是一种动态路由协议，基于距离向量算法，使用固定的跳数作为度量标准，选择跳数最少的路径作为最佳路径。
- **BGP（Border Gateway Protocol，边界网关协议）**：一种用来在路由选择域之间交换网络层可达性信息（Network Layer Reachability Information，NLRI）的路由选择协议，具有高度的灵活性和可扩展性。

## 从输入 URL 到页面展示到底发生了什么？（非常重要）

总体来说分为以下几个步骤:

1. 在浏览器中输入指定网页的 URL。
2. 浏览器通过 DNS 协议，获取域名对应的 IP 地址。
3. 浏览器根据 IP 地址和端口号，向目标服务器发起一个 TCP 连接请求。
4. 浏览器在 TCP 连接上，向服务器发送一个 HTTP 请求报文，请求获取网页的内容。
5. 服务器收到 HTTP 请求报文后，处理请求，并返回 HTTP 响应报文给浏览器。
6. 浏览器收到 HTTP 响应报文后，解析响应体中的 HTML 代码，渲染网页的结构和样式，同时根据 HTML 中的其他资源的 URL（如图片、CSS、JS 等），再次发起 HTTP 请求，获取这些资源的内容，直到网页完全加载显示。
7. 浏览器在不需要和服务器通信时，可以主动关闭 TCP 连接，或者等待服务器的关闭请求。

<img src="https://oss.javaguide.cn/github/javaguide/url%E8%BE%93%E5%85%A5%E5%88%B0%E5%B1%95%E7%A4%BA%E5%87%BA%E6%9D%A5%E7%9A%84%E8%BF%87%E7%A8%8B.jpg" alt="img" style="zoom:65%;float: left;" />

## HTTP 和 HTTPS 有什么区别？（重要）

<img src="https://oss.javaguide.cn/github/javaguide/cs-basics/network/http-vs-https.png" alt="HTTP 和 HTTPS 对比" style="zoom:100%;float: left;" />

- **端口号**：HTTP 默认是 80，HTTPS 默认是 443。
- **URL 前缀**：HTTP 的 URL 前缀是 `http://`，HTTPS 的 URL 前缀是 `https://`。
- **安全性和资源消耗**：HTTP 协议运行在 TCP 之上，所有传输的内容都是明文，客户端和服务器端都无法验证对方的身份。HTTPS 是运行在 SSL/TLS 之上的 HTTP 协议，SSL/TLS 运行在 TCP 之上。所有传输的内容都经过加密，加密采用对称加密，但对称加密的密钥用服务器方的证书进行了非对称加密。所以说，HTTP 安全性没有 HTTPS 高，但是 HTTPS 比 HTTP 耗费更多服务器资源。
- **SEO（搜索引擎优化）**：搜索引擎通常会更青睐使用 HTTPS 协议的网站，因为 HTTPS 能够提供更高的安全性和用户隐私保护。使用 HTTPS 协议的网站在搜索结果中可能会被优先显示，从而对 SEO 产生影响。

## URI 和 URL 的区别是什么？

- URI(Uniform Resource Identifier) 是统一资源标志符，可以唯一标识一个资源。
- URL(Uniform Resource Locator) 是统一资源定位符，可以提供该资源的路径。它是一种具体的 URI，即 URL 可以用来标识一个资源，而且还指明了如何 locate 这个资源。

URI 的作用像身份证号一样，URL 的作用更像家庭住址一样。URL 是一种具体的 URI，它不仅唯一标识资源，而且还提供了定位该资源的信息。

## 什么是 WebSocket？

WebSocket 是一种基于 TCP 连接的全双工通信协议，即客户端和服务器可以同时发送和接收数据。

WebSocket 协议在 2008 年诞生，2011 年成为国际标准，几乎所有主流较新版本的浏览器都支持该协议。不过，WebSocket 不只能在基于浏览器的应用程序中使用，很多编程语言、框架和服务器都提供了 WebSocket 支持。

WebSocket 协议本质上是应用层的协议，用于弥补 HTTP 协议在持久通信能力上的不足。客户端和服务器仅需一次握手，两者之间就直接可以创建持久性的连接，并进行双向数据传输。

## WebSocket 和 HTTP 有什么区别？

WebSocket 和 HTTP 两者都是基于 TCP 的应用层协议，都可以在网络中传输数据。

下面是二者的主要区别：

- WebSocket 是一种双向实时通信协议，而 HTTP 是一种单向通信协议。并且，HTTP 协议下的通信只能由客户端发起，服务器无法主动通知客户端。
- WebSocket 使用 ws:// 或 wss://（使用 SSL/TLS 加密后的协议，类似于 HTTP 和 HTTPS 的关系） 作为协议前缀，HTTP 使用 http:// 或 https:// 作为协议前缀。
- WebSocket 可以支持扩展，用户可以扩展协议，实现部分自定义的子协议，如支持压缩、加密等。
- WebSocket 通信数据格式比较轻量，用于协议控制的数据包头部相对较小，网络开销小，而 HTTP 通信每次都要携带完整的头部，网络开销较大（HTTP/2.0 使用二进制帧进行数据传输，还支持头部压缩，减少了网络开销）。

## TCP 与 UDP 的区别（重要）

1. **是否面向连接**：UDP 在传送数据之前不需要先建立连接。而 TCP 提供面向连接的服务，在传送数据之前必须先建立连接，数据传送结束后要释放连接。
2. **是否是可靠传输**：远地主机在收到 UDP 报文后，不需要给出任何确认，并且不保证数据不丢失，不保证是否顺序到达。TCP 提供可靠的传输服务，TCP 在传递数据之前，会有三次握手来建立连接，而且在数据传递时，有确认、窗口、重传、拥塞控制机制。通过 TCP 连接传输的数据，无差错、不丢失、不重复、并且按序到达。
3. **是否有状态**：这个和上面的“是否可靠传输”相对应。TCP 传输是有状态的，这个有状态说的是 TCP 会去记录自己发送消息的状态比如消息是否发送了、是否被接收了等等。为此 ，TCP 需要维持复杂的连接状态表。而 UDP 是无状态服务，简单来说就是不管发出去之后的事情了（**这很渣男！**）。
4. **传输效率**：由于使用 TCP 进行传输的时候多了连接、确认、重传等机制，所以 TCP 的传输效率要比 UDP 低很多。
5. **传输形式**：TCP 是面向字节流的，UDP 是面向报文的。
6. **首部开销**：TCP 首部开销（20 ～ 60 字节）比 UDP 首部开销（8 字节）要大。
7. **是否提供广播或多播服务**：TCP 只支持点对点通信，UDP 支持一对一、一对多、多对一、多对多；
8. ……

我把上面总结的内容通过表格形式展示出来了！确定不点个赞嘛？

|                        | TCP            | UDP        |
| ---------------------- | -------------- | ---------- |
| 是否面向连接           | 是             | 否         |
| 是否可靠               | 是             | 否         |
| 是否有状态             | 是             | 否         |
| 传输效率               | 较慢           | 较快       |
| 传输形式               | 字节流         | 数据报文段 |
| 首部开销               | 20 ～ 60 bytes | 8 bytes    |
| 是否提供广播或多播服务 | 否             | 是         |

## 什么时候选择 TCP，什么时候选 UDP？

- **UDP 一般用于即时通信**，比如：语音、 视频、直播等等。这些场景对传输数据的准确性要求不是特别高，比如你看视频即使少个一两帧，实际给人的感觉区别也不大。
- **TCP 用于对传输准确性要求特别高的场景**，比如文件传输、发送和接收邮件、远程登录等等。

# MySQL

## 如何定位慢查询 ?

需要在MySQL的配置文件（/etc/my.cnf）中配置如下信息：

```yaml
# 开启MySQL慢日志查询开关
slow_query_log=1
# 设置慢日志的时间为2秒，SQL语句执行时间超过2秒，就会视为慢查询，记录慢查询日志
long_query_time=2
```

配置完毕之后，通过以下指令重新启动MySQL服务器进行测试，查看慢日志文件中记录的信息 `/var/lib/mysql/localhost-slow.log`

![image-20240407153408047](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404071534117.png)

当然，也有相关的工具：

> 调试工具：Arthas
> 运维工具：Prometheus 、Skywalking

![image-20240407153456512](https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404071534566.png)

## 如何分析SQL语句？

SQL执行很慢，可能有一下原因：

- 聚合查询
- 多表查询
- 表数据量过大查询
- 深度分页查询

```sql
- 直接在select语句之前加上关键字 explain / desc
EXPLAIN SELECT 字段列表 FROM 表名 WHERE 条件 ;
```

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404071537829.png" alt="image-20240407153708794" style="zoom: 67%;" />

然后需要关注以下字段：

- `possible_key`：当前sql可能会使用到的索引

- `key`：当前sql实际命中的索引

- `key_len `：索引占用的大小


  > 通过它们两个查看是否可能会命中索引

- `Extra`：额外的优化建议

  > Using where; Using Index：查找使用了索引，需要的数据都在索引列中能找到，不需要回表查询数据
  > Using index condition：查找使用了索引，但是需要回表查询数据

- type 这条sql的连接的类型，性能由好到差为NULL、system、const、eq_ref、ref、range、 index、all

  > system：查询系统中的表
  > const：根据主键查询
  > eq_ref：主键索引查询或唯一索引查询
  > ref：索引查询
  > range：范围查询
  > index：索引树扫描
  > all：全盘扫描

## MySQL支持的存储引擎及其区别

**存储引擎**就是存储数据、建立索引、更新/查询数据等技术的实现方式 。存储引擎是基于表的，而不是基于库的，所以存储引擎也可被称为表类型。

在MySQL中提供了很多的存储引擎，比较常见有**InnoDB**、**MyISAM**、**Memory**

- `InnoDB`：存储引擎是mysql5.5之后是默认的引擎，它支持事务、外键、表级锁和行级锁。DML操作遵循ACID模型，支持事务。有行级锁，提高并发访问性能。支持外键，保证数据的完整性和正确性。
- `MyISAM`：是早期的引擎，它不支持事务、只有表级锁、也没有外键，用的不多
- `Memory`：主要把数据存储在内存，支持表级锁，没有外键和事务，用的也不多

| **特性** | **MyISAM** | **InnoDB**        | **Memory** |
| -------- | ---------- | ----------------- | ---------- |
| 事务安全 | 不支持     | **支持**          | 不支持     |
| 锁机制   | 表锁       | **表锁**/**行锁** | 表锁       |
| 外键     | 不支持     | **支持**          | 不支持     |

## 索引（Index）

**索引是一种用于快速查询和检索数据的数据结构，其本质可以看成是一种排序好的数据结构**。

**优点**：

- 使用索引可以大大加快 数据的检索速度（大大减少检索的数据量）, 这也是创建索引的最主要的原因。
- 通过创建唯一性索引，可以保证数据库表中每一行数据的唯一性。

**缺点**：

- 创建索引和维护索引需要耗费许多时间。当对表中的数据进行增删改的时候，如果数据有索引，那么索引也需要动态的修改，会降低 SQL 执行效率。
- 索引需要使用物理文件存储，也会耗费一定空间。

**特点**：

- 索引（index）是帮助MySQL高效获取数据的数据结构（有序）
- 提高数据检索的效率，降低数据库的IO成本（不需要全表扫描）
- 通过索引列对数据进行排序，降低数据排序的成本，降低了CPU的消耗

## 索引底层为什么使用B+树？

- 阶数更多，路径更短
- 磁盘读写代价B+树更低，非叶子节点只存储指针，叶子阶段存储数据
- B+树便于扫库和区间查询，叶子节点是一个双向链表

## B树与B+树的区别是什么？

- B树

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404071548218.png" alt="image-20240407154800153" style="zoom:67%;" />



- B+树

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404071548743.png" alt="image-20240407154859696" style="zoom: 100%;" />

> B树与B+树的区别：
>
> 1. 在B树中，非叶子节点和叶子节点都会存放数据，而B+树的所有的数据都会出现在叶子节点，在查询的时候，B+树查找效率更加稳定
> 2. 在进行范围查询的时候，B+树效率更高，因为B+树都在叶子节点存储，并且叶子节点是一个双向链表

> B树与B+树对比：
>
> 1. 磁盘读写代价B+树更低；
> 2. 查询效率B+树更加稳定；
> 3. B+树便于扫库和区间查询

## 什么是聚簇索引，非聚簇索引？

`聚集索引`：将数据存储与索引一起存放的索引，B+树的叶子节点保存行数据。有且只有一个。

`非聚集索引`：将数据与索引分开存储的索引，B+树的叶子节点关联的是对应的主键。可以有多个。

聚集索引选取规则：

- 如果存在主键，主键索引就是聚集索引。
- 如果不存在主键，将使用第一个唯一（UNIQUE）索引作为聚集索引。
- 如果表没有主键，或没有合适的唯一索引，则InnoDB会自动生成一个rowid作为隐藏的聚集索引。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404071555097.png" alt="image-20240407155510989" style="zoom:80%;" />

## 什么是回表查询？

`回表查询`：通过二级索引找到对应的主键值，到聚集索引中查找整行数据，这个过程就是回表。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404071555382.png" alt="image-20240407155539271" style="zoom:80%;" />

## 什么是覆盖索引？怎么处理超大分页？

`覆盖索引`：是指查询使用了索引，返回的列，必须在索引中全部能够找到。

- 使用id查询，直接走聚集索引查询，一次索引扫描，直接返回数据，性能高。
- 如果返回的列中没有创建索引，有可能会触发回表查询，尽量避免使用`select *`

在数据量比较大时，limit分页查询，需要对数据进行排序，效率低，通过创建`覆盖索引`能够比较好地提高性能，可以通过**覆盖索引+子查询**形式进行优化。

> 例如，该查询语句可以这样优化：
>
> ```sql
> select * from user limit 9000000,10;
> ```
>
> 采用子查询先对id进行覆盖索引**排序**，然后执行sql语句
>
> ```sql
> select * from user u,
> 	(select id from user order by id limit 9000000,10) a 
> where u.id = a.id;
> ```

## 索引的创建原则？什么情况下索引会失效？

- 索引创建原则

  > 1. **数据量较大，且查询比较频繁的表**
  > 2. **常作为查询条件、排序、分组的字段**
  > 3. 字段内容区分度高
  > 4. 内容较长，使用前缀索引
  > 5. **尽量创建联合索引**
  > 6. **控制索引的数量**
  > 7. 如果索引列不能存储NULL值，请在创建表时使用NOT NULL约束它

- 索引失效情况

  > 1. 违反最左前缀法则
  > 2. 范围查询右边的列
  > 3. 在索引列上进行运算操作
  > 4. 字符串不加单引号
  > 5. 以%开头的Like模糊查询

## 有哪些优化SQL的方法？

- 表的设计优化

  > 根据实际情况选择合适的数值类型（tinyint、int、bigint）
  >
  > 根据实际情况选择合适的字符串类型（char、varchar）

- 索引优化

  > 对数据量打的表创建索引
  >
  > 对常作为查询条件、排序、分组的字段创建索引
  >
  > 尽量创建联合索引
  >
  > 控制索引的数量
  >
  > ……

- SQL语句优化

  > 合理编写SQL语句（避免直接使用select *、用union all代替union、能用inner join 就不用left join、right join、避免在where子句中对字段进行表达式操作）
  >
  > 避免SQL语句造成索引失效的写法（使用函数或表达式处理索引列、隐式类型转换、使用不等于（<> 或 !=）操作……）

- 主从复制、读写分离

- 分库分表

## 什么是redo log，undo log？

> - redo log: 记录的是数据页的物理变化，服务宕机可用来同步数据
> - undo log ：记录的是逻辑日志，当事务回滚时，通过逆操作恢复原来的数据
> - redo log保证了事务的持久性，undo log保证了事务的原子性和一致性

**`redo log`**：重做日志，记录的是事务提交时数据页的物理修改，是用来实现事务的**持久性**。redo log是物理日志。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404071627255.png" alt="image-20240407162732189" style="zoom:67%;" />

**`undo log`**：回滚日志，用于记录数据被修改前的信息 , 作用包含两个 : **提供回滚** 和 **MVCC(多版本并发控制)** ，是用来实现事务的**一致性**和**原子性**。undo log是逻辑日志。

## 事务的特性？并发事务会带来哪些问题？怎么解决这些问题呢？

- 事务的特性：
  - 原子性（**A**tomicity）：事务是不可分割的最小操作单元，要么全部成功，要么全部失败。
  - 一致性（**C**onsistency）：事务完成时，必须使所有的数据都保持一致状态。
  - 隔离性（**I**solation）：保证事务在不受外部并发操作影响的独立环境下运行。
  - 持久性（**D**urability）：事务一旦提交或回滚，它对数据库中的数据的改变就是永久的。

- 并发事务问题：

  - 并发事务问题：脏读、不可重复读、幻读

  - 隔离级别：读未提交、读已提交、可重复读、串行化

| **问题**   | **描述**                                                     |
| ---------- | ------------------------------------------------------------ |
| 脏读       | 一个事务读到另外一个事务还没有提交的数据。                   |
| 不可重复读 | 一个事务先后读取同一条记录，但两次读取的数据不同，称之为不可重复读。 |
| 幻读       | 一个事务按照条件查询数据时，没有对应的数据行，但是在插入数据时，又发现这行数据已经存在，好像出现了”幻影”。 |

- 解决方案：对事务进行隔离

| 隔离级别                               | 脏读 | 不可重复读 | 幻读 |
| -------------------------------------- | ---- | ---------- | ---- |
| **R**ead **U**ncommitted 未提交读      | ×    | ×          | ×    |
| **R**ead **C**ommitted 读已提交        | √    | ×          | ×    |
| **R**epeatable **R**ead(默认) 可重复读 | √    | √          | ×    |
| Serializable 串行化                    | √    | √          | √    |

- 如何保证事务的隔离性：
  - 锁：排他锁（如一个事务获取了一个数据行的排他锁，其他事务就不能再获取该行的其他锁）
  - MVCC: 多版本并发控制

## 事务中的隔离性是如何保证？请解释一下MVCC

**`MVCC`**：Multi-Version Concurrency Control，**多版本并发控制**。指维护一个数据的多个版本，使得读写操作没有冲突MVCC的具体实现，主要依赖于数据库记录中的**隐式字段**、**undo log日志**、**ReadView**。

- 隐式字段

| 隐藏字段    | 含义                                                         |
| ----------- | ------------------------------------------------------------ |
| DB_TRX_ID   | 最近修改**事务ID**，记录插入这条记录或最后一次修改该记录的事务ID。 |
| DB_ROLL_PTR | **回滚指针**，指向这条记录的上一个版本，用于配合undo log，指向上一个版本。 |
| DB_ROW_ID   | **隐藏主键**，如果表结构没有指定主键，将会生成该隐藏字段。   |

- undo log

  - 回滚日志，在insert、update、delete的时候产生的便于数据回滚的日志。

  - undo log版本链：不同事务或相同事务对同一条记录进行修改，会导致该记录的undo log生成一条**记录版本链表**，链表的头部是最新的旧记录，链表尾部是最早的旧记录

    <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404071636491.png" alt="image-20240407163613418" style="zoom:67%;" />

- ReadView（解决一个事务查询选择版本的问题）

  > - 根据ReadView的匹配规则和当前的一些事务id判断该访问那个版本的数据。
  > - 不同的隔离级别快照读是不一样的，最终的访问的结果不一样
  >   - RC （**R**ead **C**ommitted 读已提交）：每一次执行快照读时生成ReadView
  >   - RR（**R**epeatable **R**ead(默认) 可重复读）：仅在事务中第一次执行快照读时生成ReadView，后续复用

  - 含义：**快照读**SQL执行时MVCC提取数据的依据，记录并维护系统当前活跃的事务（未提交的）id。

  - 当前读：读取的是记录的**最新版本**，读取时还要保证其他并发事务不能修改当前记录，会对读取的记录进行加锁。对于我们日常的操作，如：select ... lock in share mode(共享锁)，select ... for update、update、insert、delete(排他锁)都是一种当前读。

  - 快照读：简单的select（不加锁）就是快照读，快照读，读取的是记录数据的可见版本，有可能是历史数据，不加锁，是非阻塞读。

    - Read Committed：每次执行select，都生成一个快照读。
    - Repeatable Read（默认）：仅在事务中第一次执行select时生成ReadView，后续复用。

  - *ReadView中包含了四个核心字段：*

    | **字段**       | **含义**                                             |
    | -------------- | ---------------------------------------------------- |
    | m_ids          | 当前活跃的事务ID集合                                 |
    | min_trx_id     | 最小活跃事务ID                                       |
    | max_trx_id     | 预分配事务ID，当前最大事务ID+1（因为事务ID是自增的） |
    | creator_trx_id | ReadView创建者的事务ID                               |

## 主从同步原理是什么？

主从复制的核心就是**二进制日志**

主从复制步骤：

1. Master 主库在事务提交时，会把数据变更记录在二进制日志文件**Binlog**中。
2. 从库读取主库的二进制日志文件**Binlog**，写入到从库的中继日志**Relay Log**。
3. Slave重做中继日志中的事件，将改变反映它自己的数据。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404071648188.png" alt="image-20240407164836130" style="zoom: 50%;float: left;" />

## 分库分表时机、分表分库策略

分库分表的时机：

1. 前提，项目业务数据逐渐增多，或业务发展比较迅速
2. 优化已解决不了性能问题（主从读写分离、查询索引…）
3. IO瓶颈（磁盘IO、网络IO）、CPU瓶颈（聚合查询、连接数太多）

分表分库策略：

1. 垂直分库，根据业务进行拆分，高并发下提高磁盘IO和网络连接数
2. 垂直分表，冷热数据分离，多表互不影响
3. 水平分库，将一个库的数据拆分到多个库中，解决海量数据存储和高并发的问题
4. 水平分表，解决单表存储和性能的问题



# Redis

## 几种数据类型的应用场景：

- **String** 类型的应用场景：缓存对象、常规计数、分布式锁、共享 session 信息等。
- **List** 类型的应用场景：消息队列（但是有两个问题：1. 生产者需要自行实现全局唯一 ID；2. 不能以消费组形式消费数据）等。
- **Hash** 类型：缓存对象、购物车等。
- **Set** 类型：聚合计算（并集、交集、差集）场景，比如点赞、共同关注、抽奖活动等。
- **Zset** 类型：排序场景，比如排行榜、电话和姓名排序等。

*Redis 后续版本又支持四种数据类型，它们的应用场景如下：*

- BitMap（2.2 版新增）：二值状态统计的场景，比如签到、判断用户登陆状态、连续签到用户总数等；
- HyperLogLog（2.8 版新增）：海量数据基数统计的场景，比如百万级网页 UV 计数等；
- GEO（3.2 版新增）：存储地理位置信息的场景，比如滴滴叫车；
- Stream（5.0 版新增）：消息队列，相比于基于 List 类型实现的消息队列，有这两个特有的特性：自动生成全局唯一消息ID，支持以消费组形式消费数据。

## 缓存穿透

**缓存穿透**：查询一个不存在的数据，mysql查询不到数据也不会直接写入缓存，就会导致每次请求都查数据库

解决方案：

- 缓存空数据，查询返回的数据为空，仍把这个空结果进行缓存（简单，但是消耗内存，且可能会发生不一致的问题）
- 布隆过滤器（内存占用较少，没有多余key，但是实现复杂，存在误判）

**布隆过滤器**原理：布隆过滤器是一个以（bit）位为单位的很长的数组，数组中每个单元只能存储二进制数0或1。当一个key来了之后经过3次hash计算，模于数组长度找到数据的下标然后把数组中原来的0改为1，这样一来，三个数组的位置就能标明一个key的存在。

## 缓存击穿

**缓存击穿**：key过期的时候，恰好这时间点对这个key有大量的并发请求过来，这些并发的请求可能会瞬间把DB压垮

解决方案：

- 互斥锁（强一致性，但是性能差）
- 逻辑过期（高可用性、性能优，但是有一致性问题）

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404072123362.png" alt="image-20240407212348197" style="zoom: 50%;" />

## 缓存雪崩

**缓存雪崩**：是指在同一时段大量的缓存key同时失效或者Redis服务宕机，导致大量请求到达数据库，带来巨大压力。

解决方案：

- 给不同的Key的TTL添加随机值
- 利用Redis集群提高服务的可用性（哨兵模式、集群模式）
- 给缓存业务添加降级限流策略（ngxin或spring cloud gateway）
- 给业务添加多级缓存（Guava或Caffeine）

## 先删除缓存，还是先修改数据库？

- **先修改数据库，再删除缓存**

  > 1. **原子性**：数据库操作通常是原子的，这意味着它可以作为一个单一的工作单元执行，要么完全成功，要么完全失败。因此，先修改数据库可以确保数据的一致性。
  > 2. **降低脏读的风险**：如果在修改数据库之前删除了缓存，那么在缓存被重新填充之前，其他请求可能会读取到旧的（或脏）数据。
  > 3. **简化逻辑**：通常，在修改数据库后，删除缓存是一个简单的操作，因为缓存中的条目可以通过其键来直接定位。

- **先删除缓存，再修改数据库，再删除一遍缓存**

  > 1. **降低延迟**：在某些场景中，先删除缓存可以减少缓存与数据库之间的数据不一致时间，因为一旦缓存被删除，后续请求将直接从数据库读取数据。
  > 2. **避免并发问题**：在某些高并发的场景下，如果先修改数据库再删除缓存，可能会出现一个请求A修改数据库但还未删除缓存，此时另一个请求B读取到旧的缓存数据并基于旧数据进行了某些操作，然后请求A删除了缓存，此时如果请求B的数据操作依赖于最新的数据库数据，就可能出现问题。

## 哪些场景需要使用Redis？

缓存：穿透、击穿、雪崩、双写一致、持久化、数据过期策略，数据淘汰策略
分布式锁：setnx、redisson
消息队列、延迟队列

## 如何确保MySQL与Redis的双写一致性？

- 使用Canal组件实现数据同步：不更改业务代码，部署一个Canal服务。Canal服务把自己伪装成MySQL的一个从节点，当MySQL数据更新以后，Canal会读取bin log数据，然后在通过Canal的客户端获取到数据，更新缓存即可。
- 采用Redisson实现读写锁，在读的时候添加**共享锁**，可以保证共享读操作，互斥读写操作。当更新数据的时候，添加**排他锁**，互斥读写和读操作，确保在写数据的避免读脏数据。

## Redis的数据持久化是怎么做的？

- RDB（Redis Database Backup file：Redis数据备份文件）

  RDB：是一个二进制的快照文件，它是把Redis内存存储的数据写到磁盘上，当Redis实例宕机恢复数据的时候，方便从RDB的快照文件中恢复数据

  开启RDB：在redis.conf文件中找到，格式如下：

  ```yaml
  save 900 1     # 900秒内，如果至少有1个key被修改，则执行bgsave 
  save 300 10    # 原理同上
  save 60 10000  # 原理同上
  ```

  

  RDB执行原理：bgsave开始时会fork主进程得到子进程，子进程共享主进程的内存数据。完成fork后读取内存数据并写入 RDB 文件。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404072145797.png" alt="image-20240407214533706" style="zoom:50%;" />



- AOF（Append Only File：追加文件）

  AOF：Redis处理的每一个写命令都会记录在AOF文件，可以看做是命令日志文件

  开启AOF：

  ```yaml
  # 是否开启AOF功能，默认是no
  appendonly yes
  # AOF文件的名称
  appendfilename "appendonly.aof"
  ```

  修改AOF的记录频率：

  ```yaml
  # 表示每执行一次写命令，立即记录到AOF文件
  appendfsync always 
  # 写命令执行完先放入AOF缓冲区，然后表示每隔1秒将缓冲区数据写到AOF文件，是默认方案
  appendfsync everysec 
  # 写命令执行完先放入AOF缓冲区，由操作系统决定何时将缓冲区内容写回磁盘
  appendfsync no
  ```

  | **配置项** | **刷盘时机** | **优点**               | **缺点**                     |
  | ---------- | ------------ | ---------------------- | ---------------------------- |
  | always     | 同步刷盘     | 可靠性高，几乎不丢数据 | 性能影响大                   |
  | everysec   | 每秒刷盘     | 性能适中               | 最多丢失1秒数据              |
  | no         | 操作系统控制 | 性能最好               | 可靠性较差，可能丢失大量数据 |

  修改AOF的自动去重写阈值：

  ```yaml
  # 表示每执行一次写命令，立即记录到AOF文件
  appendfsync always 
  # 写命令执行完先放入AOF缓冲区，然后表示每隔1秒将缓冲区数据写到AOF文件，是默认方案
  appendfsync everysec 
  # 写命令执行完先放入AOF缓冲区，由操作系统决定何时将缓冲区内容写回磁盘
  appendfsync no
  ```

- RDB与AOF对比：

  | ** **          | **RDB**                                      | **AOF**                                                |
  | -------------- | -------------------------------------------- | ------------------------------------------------------ |
  | 持久化方式     | 定时对整个内存做快照                         | 记录每一次执行的命令                                   |
  | 数据完整性     | 不完整，两次备份之间会丢失                   | 相对完整，取决于刷盘策略                               |
  | 文件大小       | 会有压缩，文件体积小                         | 记录命令，文件体积很大                                 |
  | 宕机恢复速度   | 很快                                         | 慢                                                     |
  | 数据恢复优先级 | 低，因为数据完整性不如AOF                    | 高，因为数据完整性更高                                 |
  | 系统资源占用   | 高，大量CPU和内存消耗                        | 低，主要是磁盘IO资源但AOF重写时会占用大量CPU和内存资源 |
  | 使用场景       | 可以容忍数分钟的数据丢失，追求更快的启动速度 | 对数据安全性要求较高常见                               |

## Redis数据删除策略

- 惰性删除，在设置该key过期时间后，我们不去管它，当需要该key时，我们在检查其是否过期，如果过期，我们就删掉它，反之返回该key。

- 定期删除，就是说每隔一段时间，我们就对一些key进行检查，删除里面过期的key

  定期清理的两种模式：

  - SLOW模式是定时任务，执行频率默认为10hz，每次不超过25ms，以通过修改配置文件redis.conf 的 **hz** 选项来调整这个次数
  - FAST模式执行频率不固定，每次事件循环会尝试执行，但两次间隔不低于2ms，每次耗时不超过1ms

## Redis中的数据淘汰策略

- noeviction： 不淘汰任何key，但是内存满时不允许写入新数据，默认就是这种策略。
- volatile-ttl： 对设置了TTL的key，比较key的剩余TTL值，TTL越小越先被淘汰。
- allkeys-random：对全体key ，随机进行淘汰。
- volatile-random：对设置了TTL的key ，随机进行淘汰。
- allkeys-lru： 对全体key，基于LRU算法进行淘汰
- volatile-lru： 对设置了TTL的key，基于LRU算法进行淘汰
- allkeys-lfu： 对全体key，基于LFU算法进行淘汰
- volatile-lfu： 对设置了TTL的key，基于LFU算法进行淘汰

LRU(Least Recently Used)：最少最近使用，用当前时间减去最后一次访问时间，这个值越大则淘汰优先级越高。

LFU(Least Frequently Used)：最少频率使用。会统计每个key的访问频率，值越小淘汰优先级越高

数据淘汰策略-使用建议：

1. 优先使用 **allkeys-lru** 策略。充分利用 LRU 算法的优势，把最近最常访问的数据留在缓存中。如果业务有明显的冷热数据区分，建议使用。
2. 如果业务中数据访问频率差别不大，没有明显冷热数据区分，建议使用 **allkeys-random** ，随机选择淘汰。
3. 如果业务中有置顶的需求，可以使用 **volatile-lru** 策略，同时置顶数据不设置过期时间，这些数据就一直不被删除，会淘汰其他设置过期时间的数据。
4. 如果业务中有短时高频访问的数据，可以使用 **allkeys-lfu** 或 **volatile-lfu** 策略。

## 如何保证Redis中的数据都是热点数据？

可以使用 **allkeys-lru** （挑选最近最少使用的数据淘汰）淘汰策略，那留下来的都是经常访问的热点数据

## 分布式锁有哪些应用场景？会发生什么问题？如何实现分布式锁？

有两种常见场景：

- 电商超卖

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404101314095.png" alt="image-20240410131415868" style="zoom: 40%;float: left;" />



- 假脱机打印问题

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404101315234.png" alt="image-20240410131506091" style="zoom: 55%;float: left;" />

分布式场景发生问题的原因：

多个执行体去操作共享数据时才发生的

在并发场景中，在需要操作同一个共享数据时，如果当前的进程或线程对数据的操作还没有结束的话，另一个进程或线程也开始操作这个数据，这个时候就会发生无法预测的结果。解决这个问题的一种思路就是：我们可以控制执行体的时序，在当前的这个执行体对共享数据的操作完成前，不允许其他的执行体去操作这个共享数据。具体我们可以设置一个公共的标记，这个标记对每个执行体都可见，当这个标记不可见的时候，执行体可以重新设置这个标记，这个标记就是锁，对于解决**多线程**、**多进程**、**分布式服务**同时竞争共享资源所产生的一系列问题思想都是加锁。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404101325704.png" alt="image-20240410132556603" style="zoom:60%;float: left;" />



## 锁王

互斥锁：锁的基本思想

读写锁：互斥锁的扩充

同步锁：本质就是互斥锁

表锁：数据库中的互斥锁

行锁：数据库中的互斥锁

间隙锁：数据库中的互斥锁

共享锁：读写锁

排他锁：互斥锁的别名

可重入锁：互斥锁的别名

悲观锁：一种抽象概念

乐观锁：一种抽象概念

分布式锁：分布式场景下的互斥锁

在redisson中需要手动加锁，并且可以控制锁的失效时间和等待时间，当锁住的一个业务还没有执行完成的时候，在redisson中引入了一个看门狗机制，就是说每隔一段时间就检查当前业务是否还持有锁，如果持有就增加加锁的持有时间，当业务执行完成之后需要使用释放锁就可以了

两种方式：

- 用Redis的setnx
- 













## Redis集群有哪些方案？

主从复制、哨兵模式、Redis分片集群

主从同步：单节点Redis的并发能力是有上限的，要进一步提高Redis的并发能力，可以搭建主从集群，实现读写分离。一般都是一主多从，主节点负责写数据，从节点负责读数据，主节点写入数据之后，需要把数据同步到从节点中

主从同步数据的流程：

- 全量同步：全量同步是指从节点第一次与主节点建立连接的时候使用全量同步

  > 1. 从节点请求主节点同步数据，其中从节点会携带自己的replication id和offset偏移量。
  > 2. 主节点判断是否是第一次请求，主要判断的依据就是，主节点与从节点是否是同一个replication id，如果不是，就说明是第一次同步，那主节点就会把自己的replication id和offset发送给从节点，让从节点与主节点的信息保持一致。
  > 3. 在同时主节点会执行bgsave，生成rdb文件后，发送给从节点去执行，从节点先把自己的数据清空，然后执行主节点发送过来的rdb文件，这样就保持了一致
  >
  > 当然，如果在rdb生成执行期间，依然有请求到了主节点，而主节点会以命令的方式记录到缓冲区，缓冲区是一个日志文件，最后把这个日志文件发送给从节点，这样就能保证主节点与从节点完全一致了，后期再同步数据的时候，都是依赖于这个日志文件，这个就是全量同步

增量同步：当从节点服务重启之后，数据就不一致了，所以这个时候，从节点会请求主节点同步数据，主节点还是判断不是第一次请求，不是第一次就获取从节点的offset值，然后主节点从命令日志中获取offset值之后的数据，发送给从节点进行数据同步

## *什么是Redis集群脑裂，如何解决？*

有的时候由于网络等原因可能会出现脑裂的情况，就是说，由于redis master节点和redis salve节点和sentinel处于不同的网络分区，使得sentinel没有能够心跳感知到master，所以通过选举的方式提升了一个salve为master，这样就存在了两个master，就像大脑分裂了一样，这样会导致客户端还在old master那里写入数据，新节点无法同步数据，当网络恢复后，sentinel会将old master降为salve，这时再从新master同步数据，这会导致old master中的大量数据丢失。

解决方案：在redis的配置中可以设置：第一可以设置最少的salve节点个数，比如设置至少要有一个从节点才能同步数据，第二个可以设置主从数据复制和同步的延迟时间，达不到要求就拒绝请求，就可以避免大量的数据丢失

## Redis的分片集群有什么作用？分片集群中数据是怎么存储和读取的？

分片集群主要解决的是，海量数据存储的问题，集群中有多个master，每个master保存不同数据，并且还可以给每个master设置多个slave节点，就可以继续增大集群的高并发能力。同时每个master之间通过ping监测彼此健康状态，就类似于哨兵模式了。当客户端请求可以访问集群任意节点，最终都会被转发到正确节点

Redis 集群引入了哈希槽的概念，有 16384 个哈希槽，集群中每个主节点绑定了一定范围的哈希槽范围， key通过 CRC16 校验后对 16384 取模来决定放置哪个槽，通过槽找到对应的节点进行存储。

## Redis是单线程的，但是为什么还那么快？



简单来说有以下几个原因：

1. 完全基于内存的，C语言编写
2. 采用单线程，避免不必要的上下文切换可竞争条件
3. 使用多路I/O复用模型，非阻塞IO

> 例如：bgsave 和 bgrewriteaof  都是在**后台**执行操作，不影响主线程的正常使用，不会产生阻塞

详细的说有以下几个原因

- Redis 的大部分操作**都在内存中完成**，并且采用了高效的数据结构，因此 Redis 瓶颈可能是机器的内存或者网络带宽，而并非 CPU，既然 CPU 不是瓶颈，那么自然就采用单线程的解决方案了；
- Redis 采用单线程模型可以**避免了多线程之间的竞争**，省去了多线程切换带来的时间和性能上的开销，而且也不会导致死锁问题。
- Redis 采用了 **I/O 多路复用机制**处理大量的客户端 Socket 请求，IO 多路复用机制是指一个线程处理多个 IO 流，就是我们经常听到的 select/epoll 机制。简单来说，在 Redis 只运行单线程的情况下，该机制允许内核中，同时存在多个监听 Socket 和已连接 Socket。内核会一直监听这些 Socket 上的连接请求或数据请求。一旦有请求到达，就会交给 Redis 线程处理，这就实现了一个 Redis 线程处理多个 IO 流的效果。

## 解释一下I/O多路复用模型？

**I/O多路复用**是指利用单个线程来同时监听多个Socket ，并在某个Socket可读、可写时得到通知，从而避免无效的等待，充分利用CPU资源。目前的I/O多路复用都是采用的epoll模式实现，它会在通知用户进程Socket就绪的同时，把已就绪的Socket写入用户空间，不需要挨个遍历Socket来判断是否就绪，提升了性能。

**I/O多路复用模型**是Redis的网络模型，它结合事件的处理器来应对多个Socket请求，比如，提供了连接应答处理器、命令回复处理器，命令请求处理器；

在Redis6.0之后，为了提升更好的性能，在命令回复处理器使用了多线程来处理回复事件，在命令请求处理器中，将命令的转换使用了多线程，增加命令转换速度，在命令执行的时候，依然是单线程





# Spring

## Spring框架中的bean是线程安全的吗？不安全的话如何解决？

不是线程安全的。

如果注入的对象是无状态，没有线程安全问题；

如果在bean中定义了可修改的成员变量，是要考虑线程安全问题的。

**解决方案**：可以使用多例或者加锁来解决，Spring框架中有一个`@Scope`注解，默认的值就是singleton，可以改为prototype保证线程安全。





## IOC







## 什么是AOP？AOP有什么用？你有没有用过AOP？

**AOP**：将对多个对象产生影响的公共行为和逻辑，抽取并封装为一个可重用的模块，这个模块被命名为“切面”（Aspect）。

**AOP的作用**：

- 减少系统中的重复代码
- 降低模块间的耦合度
- 提高系统的可维护性

**常见的AOP使用场景**：

- 记录操作日志

- 缓存处理

- Spring中内置的事务处理

**AOP使用方法**（以记录操作日志为例）：使用AOP中的环绕通知+切点表达式（找到要记录日志的方法），通过环绕通知的参数获取请求方法的参数（类、方法、注解、请求方式等），获取到这些参数以后，保存到数据库。

eg.

```java
@Around("pointcut()")
public Object around(ProceedingJoinPoint joinPoint) {
    //获取用户名
    //获取请求方式
    //获取访问结果
    //获取模块名称
    //登录IP
    //操作时间
    
    //保存到数据库（操作日志）
    
    return null;
}

```

## Spring中的事务是如何实现的？事务失效的场景和原因有哪些？

事务分为**编程式事务**和**声明式事务**：

- 编程式事务控制：需使用TransactionTemplate来进行实现，对业务代码有侵入性，项目中很少使用

- 声明式事务管理：声明式事务管理建立在AOP之上的。其本质是通过AOP功能，对方法前后进行拦截，将事务处理的功能编织到拦截的方法中，也就是在目标方法开始之前加入一个事务，在执行完目标方法之后根据执行情况提交或者回滚事务。

**事务的原理**：通过AOP功能，对方法前后进行拦截，在执行方法之前开启事务，在执行完目标方法之后根据执行情况提交或者回滚事务。

**事务失效**：

| 事务失效场景 |                             原因                             | 解决办法                                                     |
| :----------: | :----------------------------------------------------------: | ------------------------------------------------------------ |
| 异常捕获处理 | 代码自己处理了异常，没有抛出异常，Transactional没有知悉异常，就会失效。 | 手动抛出异常，在catch块添加throw new RuntimeException(e)     |
| 抛出检查异常 | Transactional默认只会回滚非检查异常，当代码抛出检查异常（例如：FileNotFoundException ）时就会失效。 | 配置rollbackFor属性@Transactional(rollbackFor=Exception.class) |
| 非public方法 |       Spring 只能为 public 方法创建代理、添加事务通知        | 改为 public 方法                                             |

## 讲一下Bean的生命周期

Bean 生命周期大致分为 Bean 定义、Bean 的初始化、Bean的生存期和 Bean 的销毁4个部分。具体步骤如下：

1. 通过BeanDefinition获取bean的定义信息
2. 调用构造函数实例化bean
3. bean的依赖注入
4. 处理Aware接口（BeanNameAware、BeanFactoryAware、ApplicationContextAware）
5. Bean的后置处理器BeanPostProcessor-前置
6. 初始化方法(InitializingBean、init-method)
7. Bean的后置处理器BeanPostProcessor-后置
8. 销毁bean

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404121907270.png" alt="image-20240412190726153" style="zoom:40%;float: left;" />

## Bean的生命周期哪些地方可以干预？

Bean的生命周期是由Spring容器自动管理的，其中有两个环节我们可以进行干预。 

1. 可以自定义**初始化**方法，增加@PostConstruct注解，会在**调用SetBeanFactory方法之后**调用该方法。
2. 可以自定义**销毁**方法，增加@PreDestroy注解，会在**自身销毁前调用**这个方法。

## 什么是循环依赖？Spring是怎么解决循环依赖的？Spring如果解决不了，我们该怎么解决？

**循环依赖**：有多个类被Spring管理，它们在实例化时互相持有对方，最终形成闭环。

Spring采用**三级缓存**解决循环依赖：

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404121911396.png" alt="image-20240412191107333" style="zoom:50%;float: left;" />

| **缓存名称** | **源码名称**          | **作用**                                                     |
| ------------ | --------------------- | ------------------------------------------------------------ |
| 一级缓存     | singletonObjects      | 单例池，缓存已经经历了完整的生命周期，已经初始化完成的bean对象，只实现了singleton scope，**解决不了循环依赖** |
| 二级缓存     | earlySingletonObjects | 缓存早期的bean对象（生命周期还没走完）                       |
| 三级缓存     | singletonFactories    | 缓存的是ObjectFactory，表示对象工厂，用来创建某个对象的      |

**二级缓存**和**三级缓存**解决循环依赖的过程：

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404121917148.png" alt="image-20240412191731029" style="zoom:50%;float: left;" />

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404121917842.png" alt="image-20240412191748709" style="zoom:50%;float: left;" />



Spring无法解决**构造方法**上出现的循环依赖，解决：在构造方法的参数上使用`@Lazy`。

## SpringMVC的执行流程

Springmvc的执行流程分为老的和新的：

- 视图阶段（老旧JSP年代）
  1. 用户发送出请求到前端控制器DispatcherServlet
  2. DispatcherServlet收到请求调用HandlerMapping（处理器映射器）
  3. HandlerMapping找到具体的处理器，生成处理器对象及处理器拦截器(如果有)，再一起返回给DispatcherServlet。
  4. DispatcherServlet调用HandlerAdapter（处理器适配器）
  5. HandlerAdapter经过适配调用具体的处理器（Handler/Controller）
  6. Controller执行完成返回ModelAndView对象
  7. HandlerAdapter将Controller执行结果ModelAndView返回给DispatcherServlet
  8. DispatcherServlet将ModelAndView传给ViewReslover（视图解析器）
  9. ViewReslover解析后返回具体View（视图）
  10. DispatcherServlet根据View进行渲染视图（即将模型数据填充至视图中）
  11. DispatcherServlet响应用户

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404121921126.png" alt="image-20240412192120003" style="zoom: 50%;float: left;" />

- 前后端分离阶段（接口开发，异步）
  1. 用户发送出请求到前端控制器DispatcherServlet
  2. DispatcherServlet收到请求调用HandlerMapping（处理器映射器）
  3. HandlerMapping找到具体的处理器，生成处理器对象及处理器拦截器(如果有)，再一起返回给DispatcherServlet。
  4. DispatcherServlet调用HandlerAdapter（处理器适配器）
  5. HandlerAdapter经过适配调用具体的处理器（Handler/Controller）
  6. 方法上添加了@ResponseBody
  7. 通过HttpMessageConverter来返回结果转换为JSON并响应

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404121921353.png" alt="image-20240412192132239" style="zoom:50%;float: left;" />



## SpringBoot自动配置原理

SpringBoot的自动配置通过注解 `@SpringBootApplication` 实现，这个注解是对三个注解进行了封装，分别是：

- `@SpringBootConfiguration`：声明当前是一个配置类，与 @Configuration 注解作用相同。
- `@ComponentScan`：组件扫描，默认扫描当前引导类所在包及其子包。
- `@EnableAutoConfiguration`：SpringBoot实现自动化配置的核心注解，该注解通过`@Import`注解导入对应的配置选择器，它的核心是`META-INF`文件夹下的`spring.factories`文件，里面存放了需要扫描注解的类。在内部它读取了该项目和该项目引用的jar包的的classpath路径下`META-INF/spring.factories`文件中的所配置的类的全类名。 在这些配置类中所定义的Bean会根据条件注解所指定的条件来决定是否需要将其导入到Spring容器中。条件判断会有像`@ConditionalOnClass`或`@ConditionalOnMissingBean`这样的注解，判断是否有对应的class文件或bean对象，如果有则加载该类，把这个配置类的所有的Bean放入Spring容器中使用。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404121934450.png" alt="image-20240412193405294" style="zoom: 60%;float: left;" />

## Spring框架常见注解有哪些？

- Spring

| **注解**                                       | **说明**                                                     |
| ---------------------------------------------- | ------------------------------------------------------------ |
| @Component、@Controller、@Service、@Repository | 使用在类上用于实例化Bean                                     |
| @Autowired                                     | 使用在字段上用于根据类型依赖注入                             |
| @Qualifier                                     | 结合@Autowired一起使用用于根据名称进行依赖注入               |
| @Scope                                         | 标注Bean的作用范围                                           |
| @Configuration                                 | 指定当前类是一个 Spring 配置类，当创建容器时会从该类上加载注解 |
| @ComponentScan                                 | 用于指定 Spring  在初始化容器时要扫描的包                    |
| @Bean                                          | 使用在方法上，标注将该方法的返回值存储到Spring容器中         |
| @Import                                        | 使用@Import导入的类会被Spring加载到IOC容器中                 |
| @Aspect、@Before、@After、@Around、@Pointcut   | 用于切面编程（AOP）                                          |

- SpringMVC

| **注解**        | **说明**                                                     |
| --------------- | ------------------------------------------------------------ |
| @RequestMapping | 用于映射请求路径，可以定义在类上和方法上。用于类上，则表示类中的所有的方法都是以该地址作为父路径 |
| @RequestBody    | 注解实现接收http请求的json数据，将json转换为java对象         |
| @RequestParam   | 指定请求参数的名称                                           |
| @PathViriable   | 从请求路径下中获取请求参数(/user/{id})，传递给方法的形式参数 |
| @ResponseBody   | 注解实现将controller方法返回对象转化为json对象响应给客户端   |
| @RequestHeader  | 获取指定的请求头数据                                         |
| @RestController | @Controller + @ResponseBody                                  |

- Springboot

| **注解**                 | **说明**                                       |
| ------------------------ | ---------------------------------------------- |
| @SpringBootConfiguration | 组合了- @Configuration注解，实现配置文件的功能 |
| @EnableAutoConfiguration | 打开自动配置的功能，也可以关闭某个自动配置的选 |
| @ComponentScan           | Spring组件扫描                                 |

## 讲一下Mybatis的执行流程

1. 读取MyBatis配置文件：mybatis-config.xml加载运行环境和映射文件
2. 构造会话工厂SqlSessionFactory
3. 会话工厂创建SqlSession对象（包含了执行SQL语句的所有方法）
4. 操作数据库的接口，Executor执行器，同时负责查询缓存的维护
5. Executor接口的执行方法中有一个MappedStatement类型的参数，封装了映射信息
6. 输入参数映射
7. 输出结果映射

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404121939016.png" alt="image-20240412193916911" style="zoom:50%;float: left;" />

MapperStatement对象的结构：

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404121940933.png" alt="image-20240412194031857" style="zoom: 50%;float: left;" />

## 讲一下Sql的执行过程（参数映射、sql解析、执行和结果处理）















## 什么是延迟加载？有什么用？实现原理是什么？怎么开启？

**延迟加载**：查询一个实体类的时候，暂时不查询将其一对多的数据，当需要的时候，再查询，这就是延迟加载。

**作用**：提高响应速度、避免资源浪费。

**实现原理**：

1. 使用**CGLIB**创建目标对象的代理对象
2. 当调用目标方法时，进入拦截器invoke方法，发现目标方法是null值，执行sql查询
3. 获取数据以后，调用set方法设置属性值，再继续查询目标方法，就有值了

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404121947175.png" alt="image-20240412194719114" style="zoom:60%;float: left;" />

## 讲一下Mybatis的一级缓存、二级缓存

- **一级缓存**：基于 PerpetualCache 的 HashMap 本地缓存，其存储作用域为 Session，当Session进行flush或close之后，该Session中的所有Cache就将清空，默认打开一级缓存。当某一个作用域的进行了新增、修改、删除操作后，默认该作用域下所有 select 中的缓存将被 clear。会话提交或者关闭以后，一级缓存中的数据才会转移到二级缓存中

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404121951400.png" alt="image-20240412195111353" style="zoom: 50%;float: left;" />

- **二级缓存**：基于namespace和mapper的作用域起作用的，不是依赖于SQL session，默认也是采用 PerpetualCache，HashMap 存储。使用二级缓存需要缓存的数据实现Serializable接口。当某一个作用域的进行了新增、修改、删除操作后，默认该作用域下所有 select 中的缓存将被 clear。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404121951987.png" alt="image-20240412195131930" style="zoom:50%;float: left;" />

- **二级缓存开启方式**：

  1. 全局配置文件

  ```xml
  <settings>
      <setting name="cacheEnabled" value="true/>
  </settings>
  ```

  2. 映射文件

  ```xml
  使用<cache/>标签让mapper.xml映射文件生效二级缓存
  ```

  



# 微服务

## SpringCloud的组件

通常情况下：

- 注册中心：Eureka
- 负载均衡：Ribbon
- 远程调用：Feign
- 服务熔断：Hystrix
- 网关：Zuul/Gateway

随着SpringCloudAlibba在国内兴起 , 我们项目中使用了一些阿里巴巴的组件 

- 注册中心/配置中心：Nacos
- 负载均衡：Ribbon
- 服务调用：Feign
- 服务保护：Sentinel
- 服务网关：Gateway

## Nacos和Eureka有什么区别？它们分别是怎么实现`服务注册`和`服务发现`的？

- Eureka的工作流程

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122005022.png" alt="image-20240412200506917" style="zoom: 50%;float: left;" />

- Nacos的工作流程

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122005543.png" alt="image-20240412200551427" style="zoom:50%;float: left;" />



Nacos与Eureka的共同点（注册中心）：

- 都支持服务注册和服务拉取
- 都支持服务提供者心跳方式做健康检测

Nacos与Eureka的区别（注册中心）：

- Nacos支持服务端主动检测提供者状态：临时实例采用心跳模式，非临时实例采用主动检测模式
- 临时实例心跳不正常会被剔除，非临时实例则不会被剔除
- Nacos支持服务列表变更的消息推送模式，服务列表更新更及时
- Nacos集群默认采用AP（高可用）方式，当集群中存在非临时实例时，采用CP（强一致）模式；Eureka采用AP方式

Nacos还支持了配置中心，eureka则只有注册中心，也是选择使用nacos的一个重要原因

## Ribbon如何实现负载均衡？有哪些负载均衡策略？如何实现自定义负载均衡？

**Ribbon工作流程**：

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122006437.png" alt="image-20240412200656355" style="zoom: 50%;float: left;" />

**Ribbon负载均衡策略**：

- **RoundRobinRule：简单轮询服务列表来选择服务器**
- **WeightedResponseTimeRule：按照权重来选择服务器，响应时间越长，权重越小**
- **RandomRule：随机选择一个可用的服务器**
- BestAvailableRule：忽略那些短路的服务器，并选择并发数较低的服务器
- RetryRule：重试机制的选择逻辑
- AvailabilityFilteringRule：可用性敏感策略，先过滤非健康的，再选择连接数较小的实例
- **ZoneAvoidanceRule：以区域可用的服务器为基础进行服务器的选择。使用Zone对服务器进行分类，这个Zone可以理解为一个机房、一个机架等。而后再对Zone内的多个服务做轮询**

**自定义负载均衡**：

1. **全局**：创建类实现IRule接口，可以指定负载均衡策略
2. **局部**：在客户端的配置文件中，可以配置某一个服务调用的负载均衡策略

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122010417.png" alt="image-20240412201020336" style="zoom:50%;float: left;" />

## 什么是服务雪崩？怎么解决服务雪崩？

**服务雪崩**：就是一个服务失败，导致整条链路的服务都失败的情形。

**解决**：

- 服务熔断（Hystrix ）：默认关闭，需要手动在引导类上添加注解`@EnableCircuitBreaker`。如果检测到 10 秒内请求的失败率超过 50%，就触发熔断机制。之后每隔 5 秒重新尝试请求微服务，如果微服务不能响应，继续走熔断机制。如果微服务可达，则关闭熔断机制，恢复正常请求

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122016785.png" alt="image-20240412201605723" style="zoom: 60%;float: left;" />

- 服务降级（Feign）：服务自我保护的一种方式，或者保护下游服务的一种方式，用于确保服务不会受请求突增影响变得不可用，确保服务不崩溃，一般在实际开发中与feign接口整合，编写降级逻辑

```java
@FeignClient(value = "leadnews-article",fallback = IArticleClientFallback.class)
public interface IArticleClient {
    @PostMapping("/api/v1/article/save")
    public ResponseResult saveArticle(@RequestBody ArticleDto dto);
}
```

```java
@Component
public class IArticleClientFallback implements IArticleClient {
    @Overridepublic ResponseResult saveArticle(ArticleDto dto) {
        return ResponseResult.errorResult(AppHttpCodeEnum.SERVER_ERROR,"获取数据失败");
    }
}
```

## 怎么监控微服务？用过哪些APM工具？

> APM：**A**pplication **P**erformance **M**anagment，应用程序性能监控工具
>
> 常见APM工具：
>
> 1. Springboot-admin
> 2. prometheus+Grafana
> 3. zipkin
> 4. skywalking

skywalking的监控流程：

1. 用skywalking监控接口、服务、物理实例的一些状态。特别是在压测的时候了解哪些服务和接口比较慢，可以针对性的分析和优化。
2. 在skywalking设置告警规则，如果报错可以给相关负责人发短信和发邮件，第一时间知道项目的bug情况，第一时间修复。

# 微服务业务

## 限流常见的算法有哪些？

限流的实现方式：

- Tomcat：可以设置最大连接数
- Nginx：漏桶算法
- 网关：令牌桶算法
- 自定义拦截器





## 解释一下CAP和BASE









## 有哪些分布式事务解决方案？

- Seata框架(XA、AT、TCC)
- MQ





## 如何设计分布式服务的接口幂等性？









## xxl-job路由策略有哪些？xxl-job任务执行失败怎么解决？









## 如果有大数据量的任务同时都需要执行，怎么解决？









# 消息队列（RabbitMQ、Kafka）

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122032227.png" alt="image-20240412203231163" style="zoom: 55%;float: left;" />



## 如何保证消息不丢失？

**RabbitMQ**

- 生产者确认（publisher confirm）机制：消息发送到RabbitMQ以后，会返回一个结果给发送者，表示消息是否处理成功。

- 消息持久化：RabbitMQ的消息默认是存储在内存，开启持久化功能将消息缓存在磁盘，可以确保消息不丢失，但会受IO性能影响。

  - 交换机持久化

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122049298.png" alt="image-20240412204947267" style="zoom: 67%;float: left;" />

  - 队列持久化

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122049650.png" alt="image-20240412204956621" style="zoom:67%;float: left;" />

  - 消息持久化，SpringAMQP中的的消息默认是持久的，可以通过MessageProperties中的DeliveryMode来指定的：

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122050214.png" alt="image-20240412205003184" style="zoom:67%;float: left;" />

- 消费者确认：消费者处理消息后可以向RabbitMQ发送ack回执，RabbitMQ收到ack回执后才会删除该消息。

  - SpringAMQP则允许配置三种确认模式：

    - **manual**：手动ack，需要在业务代码结束后，调用api发送ack。

    - **auto**：自动ack，由spring监测listener代码是否出现异常，没有异常则返回ack；抛出异常则返回nack

    - **none**：关闭ack，MQ假定消费者获取消息后会成功处理，因此消息投递后立即被删除

- 消费者失败重试机制：在消费者出现异常时利用本地重试，设置重试次数，当次数达到了以后，如果消息依然失败，将消息投递到异常交换机，交由人工处理

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122051452.png" alt="image-20240412205111394" style="zoom: 50%;float: left;" />

**Kafka**

从三个方面考虑消息丢失：

- 生产者发送消息到Brocker丢失：

  - ·设置异步发送，发送失败使用回调进行记录或重发

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122042582.png" alt="image-20240412204234529" style="zoom:50%;float: left;" />

  - 失败重试，参数配置，可以设置重试次数

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122042205.png" alt="image-20240412204243173" style="zoom:50%;float: left;" />

- 消息在Brocker中存储丢失：

  -  发送确认acks，选择all，让所有的副本都参与保存数据后确认

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122043471.png" alt="image-20240412204309426" style="zoom: 50%;float: left;" />

  | **确认机制**     | **说明**                                                     |
  | ---------------- | ------------------------------------------------------------ |
  | acks=0           | 生产者在成功写入消息之前不会等待任何来自服务器的响应,消息有丢失的风险，但是速度最快 |
  | acks=1（默认值） | 只要集群首领节点收到消息，生产者就会收到一个来自服务器的成功响应 |
  | acks=all         | 只有当所有参与赋值的节点全部收到消息时，生产者才会收到一个来自服务器的成功响应 |

- 消费者从Brocker接收消息丢失（重平衡）：

  - 禁用自动提交偏移量，改为手动提交偏移量
  - 提交方式，最好是异步（优先）+同步提交

## 如何解决消息的重复消费？

**RabbitMQ**：

- 每条消息设置一个唯一的标识id：*eg.在处理支付业务时，可以先拿着业务的唯一标识到数据库查询一下，如果这个数据不存在，说明没有处理过，这个时候就可以正常处理这个消息了。如果已经存在这个数据了，就说明消息重复消费了，我们就不需要再消费了。*
- 幂等方案：redis分布式锁、数据库锁（悲观锁、乐观锁）

**Kafka**：

- 禁用自动提交偏移量，改为手动提交偏移量
- 提交方式，异步提交 + 同步提交

- 幂等方案：redis分布式锁、数据库锁（悲观锁、乐观锁）

## 了解RabbitMQ/Kafka的高可用机制吗？

**RabbitMQ**：

在生产环境下，使用集群来保证高可用性

- 普通集群

  - 会在集群的各个节点间共享部分数据，包括：交换机、队列元信息。不包含队列中的消息
  - 当访问集群某节点时，如果队列不在该节点，会从数据所在节点传递到当前节点并返回
  - 队列所在节点宕机，队列中的消息就会丢失

- **镜像集群**（本质是主从模式）

  - 交换机、队列、队列中的消息会在各个mq的镜像节点之间同步备份。
  - 创建队列的节点被称为该队列的主节点，备份到的其它节点叫做该队列的镜像节点。
  - 一个队列的主节点可能是另一个队列的镜像节点
  - 所有操作都是主节点完成，然后同步给镜像节点
  - 主宕机后，镜像节点会替代成新的主

- 仲裁队列（优化镜像集群）

  - 与镜像队列一样，都是主从模式，支持主从数据同步
  - 使用非常简单，没有复杂的配置
  - 主从同步基于Raft协议，**强一致性**
  - 代码实现：

  ```java
  @Bean
  public Queue quorumQueue() {
      return QueueBuilder
          .durable("quorum.queue") // 持久化 
          .quorum() // 仲裁队列
          .build();
  }
  ```

**Kafka**：

- 集群模式

  - Kafka 的服务器端由被称为 Broker 的服务进程构成，即一个 Kafka 集群由多个 Broker 组成
  - 如果集群中某一台机器宕机，其他机器上的 Broker 也依然能够对外提供服务。这其实就是 Kafka 提供高可用的手段之一

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404151659488.png" alt="image-20240415165935408" style="zoom:50%;float: left;" />


- 分区备份机制

  - 一个topic有多个分区，每个分区有多个副本，其中有一个leader，其余的是follower，副本存储在不同的broker中
  - 所有的分区副本的内容是都是相同的，如果leader发生故障时，会自动将其中一个follower提升为leader

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404151700526.png" alt="image-20240415170035456" style="zoom:50%;float: left;" />

- 分区副本复制机制

  - ISR（in-sync replica）分区是Leader分区**同步**复制保存的一个队列，普通分区是Leader分区**异步**复制保存的一个队列
  - 如果leader失效后，需要选出新的leader，选举的原则如下：
    - 第一：选举时优先从ISR中选定，因为这个列表中follower的数据是与leader同步的
    - 第二：如果ISR列表中的follower都不行了，就只能从其他follower中选取

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404151707886.png" alt="image-20240415170718823" style="zoom:50%;float: left;" />

## RabbitMQ：如何解决消息堆积？

- 增加更多消费者，提高消费速度

- 在消费者内开启线程池加快消息处理速度

- 扩大队列容积，提高堆积上限，采用惰性队列

  - 在声明队列的时候可以设置属性 `x-queue-mode` 为 `lazy` ，即为惰性队列
  - 惰性队列基于磁盘存储，消息上限高
  - 惰性队列性能比较稳定，但基于磁盘存储，受限于磁盘IO，时效性会降低
  - 代码实现：

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122119871.png" alt="image-20240412211926837" style="zoom:67%;float: left;" />

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122119934.png" alt="image-20240412211935887" style="zoom:67%;float: left;" />

## RabbitMQ：延迟队列、死信队列、死信交换机

> 延迟队列 = 死信交换机 + TTL（生存时间）

**延迟队列**：进入队列的消息会被延迟消费的队列。**应用场景**：超时订单、限时优惠、定时发布

**死信**：当一个队列中的消息满足下列情况之一时，可以成为死信：

- 消费者使用 `basic.reject` 或 `basic.nack` 声明消费失败，并且消息的 requeue 参数设置为 false
- 消息过期了，超时无人消费
- 要投递的队列消息堆积满了，最早的消息可能成为死信

**死信交换机**：配置了dead-letter-exchange属性的队列所指定的交换机。

```java
@Bean
public Queue ttlQueue(){
    return QueueBuilder.durable("simple.queue"）         // 指定队列名称, 并持久化
                       .tt1(10000）                      // 设置队列的超时时间，10秒
                       .deadLetterExchange("dl.direct"） // 指定死信交换机
                       .build();
}
```

## Kafka：如何保证消费的顺序性

**消息消费无序的原因**：

一个topic的数据可能存储在不同的分区中，每个分区都有一个按照顺序的存储的偏移量，如果消费者关联了多个分区不能保证顺序。

topic分区中消息只能由消费者组中的唯一消费者处理，想要顺序的处理Topic的所有消息，那就为消息者只提供一个分区或将相同的业务设置相同的key。

**解决方案**：

- 发送消息时指定同一个topic的分区号
- 发送消息时按照相同的业务设置相同的key（分区默认通过key的hashcode值来选择分区，hash值一致，分区也一致）

**代码实现**：

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404122102814.png" alt="image-20240412210253778" style="zoom:67%;float: left;" />

## Kafka：数据存储和清理

- Kafka文件存储机制：

  topic的数据存储在分区上，分区如果文件过大会分段存储segment

  每个分段都在磁盘上以**索引 `xxxx.index`** 和**日志文件 `xxxx.log` **的形式存储，减少单个文件内容的大小，查找数据方便，方便kafka进行日志清理

- 数据清理机制

  - **根据消息的保留时间**：当消息保存的时间超过了指定的时间，就会触发清理，默认是168小时（ 7天）
  - **根据topic存储的数据大小**：当topic所占的日志文件大小大于一定的阈值，则开始删除最久的消息。（默认关闭）

## Kafka：高性能设计

- **消息分区**：不受单台服务器的限制，可以不受限的处理更多的数据

- **顺序读写**：磁盘顺序读写，提升读写效率

- **页缓存**：把磁盘中的数据缓存到内存中，把对磁盘的访问变为对内存的访问

- **零拷贝**：减少上下文切换及数据拷贝

  <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404151722200.png" alt="image-20240415172213122" style="zoom:67%;float: left;" />

- 消息压缩：减少磁盘IO和网络IO

- 分批发送：将消息打包批量发送，减少网络开销







# 集合

## ArrayList

### 基础

1. 数组（Array）是一种用连续的内存空间存储相同数据类型数据的线性数据结构。

2. 数组下标为什么从0开始?

   寻址公式是：baseAddress+i*dataTypeSize，计算下标的内存地址效率较高

3. 查找的时间复杂度

   随机(通过下标)查询的时间复杂度是0(1)

   查找元素 (未知下标）的时间复杂度是O(n)

   查找元素（未知下标但排序）通过二分查找的时间复杂度是O(logn)

4. 插入和删除时间复杂度

   插入和删除的时候，为了保证数组的内存连续性，需要挪动数组元素，平均时间复杂度为O(n)

### 扩容原理

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405032304675.png" alt="image-20240503230443354" style="zoom: 50%;float: left;" />

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405032304295.png" alt="image-20240503230431987" style="zoom:50%;float: left;" />

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405032306575.png" alt="image-20240503230655288" style="zoom:50%;float: left;" />

### 底层实现原理

ArrayList底层是用动态的数组实现的

ArrayList初始容量为0，当第一次添加数据的时候才会初始化容量为10

ArrayList在进行扩容的时候是原来容量的1.5倍，每次扩容都需要拷贝数组

ArrayList在添加数据的时候

- 确保数组已使用长度（size）加1之后足够存下下一个数据
- 计算数组的容量，如果当前数组已使用长度+1后的大于当前的数组长度，则调用grow方法扩容（原来的1.5倍）
- 确保新增的数据有地方存储之后，则将新元素添加到位于size的位置上
- 返回添加成功布尔值。

### 数组和List之间的转换

```java
//数组转List
//Arrays.asList()的数据会受影响
public static void testArray2List(){
    String[] strs = {"aaa","bbb","ccc"};
    List<String> list = Arrays.asList(strs);
    for (String s : list) {
        System.out.println(s);
    }
}
//List转数组
//list.toArray()的数据不会受影响
public static void testList2Array(){
    List<String> list = new ArrayList<String>();
    list.add("aaa");
    list.add("bbb");
    list.add("ccc");
    String[] array = list.toArray(new String[list.size()]);
    //String[] array = list.toArray(new String[0]);
    for (String s : array) {
        System.out.println(s);
    }
}
```

### 如何让ArrayList 和 LinkedList 线程安全？

两种方法：

1. 在方法内使用线程安全的局部变量
2. 使用线程安全的 ArrayList 和 LinkedList 

```java
List syncArrayList  = Collections.synchronizedList(new ArrayList(); 
List syncLinkedList = Collections.synchronizedList(new LinkedList());
```

### ArrayList和LinkedList的区别

- 底层数据结构

  - ArrayList 是动态数组的数据结构实现

  - LinkedList 是双向链表的数据结构实现

- 操作数据效率
  - ArrayList按照下标查询的时间复杂度O(1)【内存是连续的，根据寻址公式】， LinkedList不支持下标查询
  - 查找（未知索引）： ArrayList需要遍历，链表也需要链表，时间复杂度都是O(n)
  - 新增和删除
    - ArrayList尾部插入和删除，时间复杂度是O(1)；其他部分增删需要挪动数组，时间复杂度是O(n)
    - LinkedList头尾节点增删时间复杂度是O(1)，其他都需要遍历链表，时间复杂度是O(n)

- 内存空间占用

  - ArrayList底层是数组，内存连续，节省内存

  - LinkedList 是双向链表需要存储数据，和两个指针，更占用内存

- 线程安全
  - ArrayList和LinkedList都不是线程安全的
  - 如果需要保证线程安全，有两种方案：
    - 在方法内使用，局部变量则是线程安全的
    - 使用线程安全的ArrayList和LinkedList

## HashMap

### 实现原理

HashMap的数据结构： 底层使用hash表数据结构，即数组和链表或红黑树

1. 当我们往HashMap中put元素时，利用key的hashCode重新hash计算出当前对象的元素在数组中的下标 

2. 存储时，如果出现hash值相同的key，此时有两种情况。

   a. 如果key相同，则覆盖原始值；

   b. 如果key不同（出现冲突），则将当前的key-value放入链表或红黑树中 

3. 获取时，直接找到hash值对应的下标，在进一步判断key是否相同，从而找到对应值。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405071519247.png" alt="image-20230428204902016" style="zoom:80%;float: left;" />

面试官追问：HashMap的jdk1.7和jdk1.8有什么区别

- JDK1.8之前采用的是拉链法。拉链法：将链表和数组相结合。也就是说创建一个链表数组，数组中每一格就是一个链表。若遇到哈希冲突，则将冲突的值加到链表中即可。

- jdk1.8在解决哈希冲突时有了较大的变化，当链表长度大于阈值（默认为8） 时并且数组长度达到64时，将链表转化为红黑树，以减少搜索时间。扩容 resize( ) 时，红黑树拆分成的树的结点数小于等于临界值6个，则退化成链表

### put()-添加元素

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405091509067.png" alt="image-20240509150950892" style="zoom: 50%;float: left;" />

1. 判断键值对数组table是否为空或为null，否则执行resize(进行扩容 (初始化)
2. 根据键值key计算hash值得到数组索引
3. 判断table[i] == null，直接新建节点添加
4. 如果table[i] != null，进行判断
   1. 判断table[i]的首个元素是否和key一样，如果相同直接覆盖value
   2. 判断table[i] 是否为treeNode，即table[i] 是否是红黑树，如果是红黑树，则直接在树中插入键值对
   3. 遍历table[i]，链表的尾部插入数据，然后判断链表长度是否大于8，大于8的话把链表转换为红黑树，在红黑树中执行插入操作，遍历过程中若发现key已经存在直接覆盖value
5. 插入成功后，判断实际存在的键值对数量size是否超多了最大容量threshold（数组长度*0.75），如果超过，进行扩容。



### resize()-扩容机制

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405091519087.png" alt="image-20240509151952950" style="zoom: 55%;float: left;" />

1. 在添加元素或初始化的时候需要调用resize方法进行扩容，第一次添加数据初始化数组长度为16，以后每次每次扩容都是达到了扩容阈值 (数组长度＊0.75)
2. 每次扩容的时候，都是扩容之前容量的2倍
3. 扩容之后，会新创建一个数组，需要把老数组中的数据挪动到新的数组中
   1. 没有hash冲突的节点，则直接使用e.hash ＆(newCap-1)计算新数组的索引位置
   2. 如果是红黑树，走红黑树的添加
   3. 如果是链表，则需要遍历链表，可能需要拆分链表，判断(e.hash & oldCap)是否为0，该元素的位置要么停留在原始位置，要么移动到原始位置+增加的数组大小这个位置上

### 寻址算法

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405091555688.png" alt="image-20240509155515506" style="zoom:55%;float: left;" />



1. 计算对象的 hashCode()
2. 调用 hash() 方法进行二次哈希， hashcode值右移16位再异或运算，让哈希分布更为均匀
3. 最后 (capacity – 1) & hash 得到索引

**为何HashMap的数组长度一定是2的次幂？**

1. 计算索引时效率更高：如果是 2 的 n 次幂可以使用位与运算代替取模
2. 扩容时重新计算索引效率更高： hash & oldCap == 0 的元素留在原来位置 ，否则新位置 = 旧位置 + oldCap

### 在1.7情况下的多线程死循环问题（简略版）

在 JDK1.7的HashMap中在数组进行扩容的时候，因为链表是**头插法，在进行数据迁移的过程中，有可能导致死循环**

比如说，现在有两个线程
线程一：读取到当前的hashmap数据，数据中一个链表，在准备扩容时，线程二介入
线程二：也读取hashmap，直接进行扩容。因为是头插法，链表的顺序会进行颠倒过来。比如原来的顺序是AB，扩容后的顺序是BA，线程二执行结束。
线程一：继续执行的时候就会出现死循环的问题。
线程一先将A移入新的链表，再将B插入到链头，由于另外一个线程的原因，B的next指向了A，所以B->A->B,形成循环。
因此，JDK 8 调整了扩容算法，不再将元素加入链表头（而是保持与扩容前一样的顺序），**采用尾插法避免了jdk7中死循环的问题**。

### HashSet与HashMap的区别

- HashSet实现了Set接口，仅存储对象；HashMap实现了 Map接口，存储的是键值对。
- HashSet底层其实是用HashMap实现存储的，HashSet封装了一系列HashMap的方法。依靠HashMap来存储元素值，利用hashMap的key键进行存储，而value值默认为Object对象。所以HashSet也不允许出现重复值，判断标准和HashMap判断标准相同，两个元素的hashCode相等并且通过equals()方法返回true。首先根据hashCode方法计算出对象存放的地址位置，然后使用equals方法比较两个对象是否真的相同   

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405101547987.png" alt="image-20221007110404375" style="zoom:110%;float: left;" />

### HashTabe与HashMap的区别

| **区别**       | **HashTable**                  | **HashMap**      |
| -------------- | ------------------------------ | ---------------- |
| 数据结构       | 数组+链表                      | 数组+链表+红黑树 |
| 是否可以为null | Key和value都不能为null         | 可以为null       |
| hash算法       | key的hashCode()                | 二次hash         |
| 扩容方式       | 当前容量翻倍 +1                | 当前容量翻倍     |
| 线程安全       | 同步(synchronized)的，线程安全 | 线程不安全       |

在实际开中不建议使用HashTable，在多线程环境下可以使用ConcurrentHashMap类

### ConcurrentHashMap的特点

**底层数据结构**

- JDK1.7采用分段的数组+链表实现

- JDK1.8 采用与HashMap 一样的结构，数组+链表/红黑二叉树

**加锁方式**

- JDK1.7采用Segment分段锁，底层使用的是ReentrantLock

- JDK1.8采用CAS添加新节点，采用synchronized锁定链表或红黑二叉树的头节点，相对Segment分段锁粒度更细，性能更好

**插入过程：**

- 对插入操作进行加锁，但锁的范围仅精确到 bucket 的头节点，而非整个数据结构。
- 这种细粒度的锁机制确保了高并发环境下插入操作的高效执行。

**扩容过程：**

- 扩容同样涉及加锁，但仅锁定涉及迁移的头节点。
- 支持多线程并行进行扩容操作，通过CAS操作竞争获取迁移任务，每个线程负责一部分槽位的数据转移。
- 获得任务的线程将原数组中对应链表或红黑树的数据迁移到新数组，进一步提升了扩容时的并发处理能力。

**查找过程：**

- 查找操作设计为非阻塞，不加锁，直接访问，保证了快速响应。
- 在扩容期间也不中断查找，若槽未迁移，则直接从旧数组读取；若已迁移完成，通过扩容线程设置的转发节点指引，从新数组中定位数据，确保了查找操作的连续性和高效性。

# 并发

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405091632962.png" alt="image-20240509163226838" style="zoom:67%;" />

## 进程、线程的区别

- **进程**是程序的一次执行过程，是系统运行程序的基本单位，因此进程是动态的。系统运行一个程序即是一个进程从创建，运行到消亡的过程。
- **线程**与进程相似，但线程是一个比进程更小的执行单位。一个进程在其执行的过程中可以产生多个线程。与进程不同的是同类的多个线程共享进程的**堆**和**方法区**资源，但每个线程有自己的**程序计数器**、**虚拟机栈**和**本地方法栈**。

Java 程序天生就是多线程程序，我们可以通过 JMX 来看看一个普通的 Java 程序有哪些线程，代码如下。

```java
public class MultiThread {
	public static void main(String[] args) {
		// 获取 Java 线程管理 MXBean
		ThreadMXBean threadMXBean = ManagementFactory.getThreadMXBean();
		// 不需要获取同步的 monitor 和 synchronizer 信息，仅获取线程和线程堆栈信息
		ThreadInfo[] threadInfos = threadMXBean.dumpAllThreads(false, false);
		// 遍历线程信息，仅打印线程 ID 和线程名称信息
		for (ThreadInfo threadInfo : threadInfos) {
			System.out.println("[" + threadInfo.getThreadId() + "] " + threadInfo.getThreadName());
		}
	}
}
```

上述程序输出如下（输出内容可能不同，不用太纠结下面每个线程的作用，只用知道 main 线程执行 main 方法即可）：

```java
[5] Attach Listener //添加事件
[4] Signal Dispatcher // 分发处理给 JVM 信号的线程
[3] Finalizer //调用对象 finalize 方法的线程
[2] Reference Handler //清除 reference 线程
[1] main //main 线程,程序入口
```

从上面的输出内容可以看出：**一个 Java 程序的运行是 main 线程和多个其他线程同时运行**。

**总结：线程是进程划分成的更小的运行单位。线程和进程最大的不同在于基本上各进程是独立的，而各线程则不一定，因为同一进程中的线程极有可能会相互影响。线程执行开销小，但不利于资源的管理和保护；而进程正相反。**

## 并发、并行的区别

- **并发**：两个及两个以上的作业在同一 **时间段** 内执行。
- **并行**：两个及两个以上的作业在同一 **时刻** 执行。

最关键的点是：是否是 **同时** 执行。

## 同步、异步的区别

- **同步**：发出一个调用之后，在没有得到结果之前， 该调用就不可以返回，一直等待。
- **异步**：调用在发出之后，不用等待返回结果，该调用直接返回。

## JMM（Java内存模型）

JMM（Java内存模型），定义了**共享内存**中**多线程程序读写操作**的行为规范，通过这些规则来规范对内存的读写操作从而保证指令的正确性

JMM把内存分为两块，一块是私有线程的**工作区域**（工作内存），一块是所有线程的**共享区域**（主内存）

线程跟线程之间是相互隔离，线程跟线程交互需要通过主内存

## 使用多线程可能带来的问题

并发编程的目的就是为了能提高程序的执行效率进而提高程序的运行速度，但是并发编程并不总是能提高程序运行速度的，而且并发编程可能会遇到很多问题，比如：内存泄漏、死锁、线程不安全等等。

## 如何理解线程安全和不安全？

线程安全和不安全是在多线程环境下对于同一份数据的访问是否能够保证其正确性和一致性的描述。

- **线程安全**：在多线程环境下，对于同一份数据，不管有多少个线程同时访问，都能保证这份数据的正确性和一致性。
- **线程不安全**：在多线程环境下，对于同一份数据，多个线程同时访问时可能会导致数据混乱、错误或者丢失。

## 线程通信方式

线程的通信方式有两种：**monitor**和**condition**两种。

具体使用那种通信方式与线程同步的方式有关：

- 对于Synchronized来说，使用的是monitor的同步方式。尝试用的方法有waite(),notify(),notifyAll()
- 对于Lock锁接口来说，使用的是condition，依赖于lock锁的创建而创建。常使用的方法有await(),signal(),signalAll();

## 如何创建线程？

一般来说，创建线程有很多种方式，例如继承`Thread`类、实现`Runnable`接口、实现`Callable`接口、利用`Callable`接口和`Future`接口方式、使用线程池、使用`CompletableFuture`类等等。

不过，这些方式其实并没有真正创建出线程。准确点来说，这些都属于是在 Java 代码中使用多线程的方法。

严格来说，Java 就只有一种方式可以创建线程，那就是通过`new Thread().start()`创建。不管是哪种方式，最终还是依赖于`new Thread().start()`。

|                  | 优点                                                         | 缺点                                       |
| ---------------- | ------------------------------------------------------------ | ------------------------------------------ |
| 继承Thread类     | 继承Thread类编程比较简单，可以直接使用Thread类中的方法       | 不能再继承其他的类扩展性较差，             |
| 实现Runnable接口 | 扩展性强，实现该接口的同时还可以继承其他的类                 | 编程相对复杂，不能直接使用Thread类中的方法 |
| 实现Callable接口 | 可以获取多线程运行过程中的结果；扩展性强，实现该接口的同时还可以继承其他的类 | 编程相对复杂，不能直接使用Thread类中的方法 |
| 线程池创建       |                                                              |                                            |

## 线程的生命周期和状态

<img src="C:\Users\hzx\AppData\Roaming\Typora\typora-user-images\image-20240510161617583.png" alt="image-20240510161617583" style="zoom:50%;" />

Java 线程在运行的生命周期中的指定时刻只可能处于下面 6 种不同状态的其中一个状态：

| 线程状态      | 具体含义                                                     |
| ------------- | ------------------------------------------------------------ |
| NEW           | 初始状态，线程被创建出来，但没有被调用 `start()`             |
| RUNNABLE      | 运行状态，线程被调用了 `start()`等待运行的状态               |
| BLOCKED       | 阻塞状态，需要等待锁释放                                     |
| WAITING       | 等待状态，表示该线程需要等待其他线程做出一些特定动作（通知或中断） |
| TIMED_WAITING | 超时等待状态，造成限时等待状态的原因有三种：`Thread.sleep(long)`、`Object.wait(long)`、`join(long)` |
| TERMINATED    | 终止状态，表示该线程已经运行完毕=                            |

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404061226955.png" alt="Java 线程状态变迁图" style="zoom: 85%;float: left;" />

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404231254196.png" alt="image-20240423125407032" style="zoom:50%;display: inline-block;" /><img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404231301568.png" alt="image-20240423130126469" style="zoom:50%;display: inline-block;" />



## runnable 和 callable 有什么区别？

1. Runnable 接口run方法没有返回值
2. Callable接口call方法有返回值，是个泛型，和Future、FutureTask配合可以用来获取异步执行的结果
3. Callable接口的call()方法允许抛出异常；而Runnable接口的run()方法的异常只能在内部消化，不能继续上抛

## `run()` 和 `start()` 有什么区别？

- `start()`: 用来启动线程，通过该线程调用run方法执行run方法中所定义的逻辑代码。**只能被调用一次**。
- `run()`: 封装了要被线程执行的代码，**可以被调用多次。**

## `notify()` 和 `notifyAll()` 有什么区别？

- `notifyAll()`：唤醒所有wait的线程
- `notify()`：只随机唤醒一个 wait 线程

## `wait()` 和 `sleep()` 方法的不同？

共同点：都是让当前线程暂时放弃 CPU 的使用权，进入阻塞状态

不同点：

1. 方法归属不同
   - `sleep(long)` 是 Thread 的静态方法
   - `wait()`和`wait(long)` 都是 Object 的成员方法
2. 醒来时机不同
   - 执行 `sleep(long)` 和 `wait(long)` 的线程都会在等待相应毫秒后醒
   - `wait(long)` 和 `wait()` 还可以被 notify 唤醒
   - 它们都可以被打断唤醒
3. 锁特性不同（重点）
   - `wait()` 和`wait(long)` 方法的调用必须先获取wait对象的锁，而 `sleep()` 则无此限制
   - **`wait()`和 `wait(long)` 方法执行后会释放对象锁，允许其它线程获得该对象锁**
   - **`sleep()` 如果在同步代码块中执行，并不会释放对象锁**

## 如何中断/停止正在运行的线程？

1. **调用`interrupt()`方法**:
   使用`Thread.interrupt()`方法中断线程。线程需要在适当的地方检查中断状态（如通过`Thread.currentThread().isInterrupted()`或捕获`InterruptedException`）并做出响应。

   ```java
   public void run() {
       try {
           while (!Thread.currentThread().isInterrupted()) {
               // 可能需要在适当的地方检查中断，尤其是阻塞操作前
               // 执行任务...
           }
       } catch (InterruptedException e) {
           // 线程在等待/睡眠/ join等操作时可能被中断
           // 清理工作
       } finally {
           // 清理工作
       }
   }
   
   // 在其他地方调用以请求中断
   myThread.interrupt();
   ```

2. **使用volatile布尔标记**:
   创建一个volatile类型的布尔标记，作为线程是否应该继续运行的指示器。线程在运行过程中定期检查这个标记，如果标记变为`false`，则线程自行结束。

   ```java
   private volatile boolean running = true;
   
   public void run() {
       while (running) {
           // 执行任务...
       }
       // 清理工作
   }
   
   public void stopThread() {
       running = false;
   }
   ```

3. **利用`Future`和`ExecutorService`**:
   如果使用`ExecutorService`来管理线程，可以通过取消相关的`Future`任务来间接停止线程。

   ```java
   ExecutorService executor = Executors.newSingleThreadExecutor();
   Future<?> future = executor.submit(() -> {
       // 执行任务...
   });
   
   // 请求取消任务
   future.cancel(true); // true表示应该中断正在执行的任务
   executor.shutdownNow(); // 尝试停止所有活动的执行任务
   ```

避免使用已废弃的`Thread.stop()`、`Thread.suspend()`和`Thread.resume()`方法，因为这些方法可能会导致数据不一致性、死锁或其他不可预料的问题。正确的线程结束策略应当确保线程能够清理资源、释放锁并以一种安全的方式终止。

## 什么是乐观锁和悲观锁？

**乐观锁**：总是假设最好的情况，认为共享资源每次被访问的时候不会出现问题，线程可以不停地执行，无需加锁也无需等待，只是在提交修改的时候去验证对应的资源（也就是数据）是否被其它线程修改了（**版本号机制**或 **CAS 算法**）。

**悲观锁**：悲观锁总是假设最坏的情况，认为共享资源每次被访问的时候就会出现问题（比如共享数据被修改），所以每次在获取资源操作的时候都会上锁，这样其他线程想拿到这个资源就会阻塞直到锁被上一个持有者释放。也就是说，**共享资源每次只给一个线程使用，其它线程阻塞，用完后再把资源转让给其它线程**。

像 Java 中 **`synchronized`** 和 **`ReentrantLock`** 等独占锁就是悲观锁思想的实现。

**如何实现乐观锁**

- 版本号机制

一般是在数据表中加上一个数据版本号 `version` 字段，表示数据被修改的次数。当数据被修改时，`version` 值会加一。当线程 A 要更新数据值时，在读取数据的同时也会读取 `version` 值，在提交更新时，若刚才读取到的 version 值为当前数据库中的 `version` 值相等时才更新，否则重试更新操作，直到更新成功。

- CAS 算法

CAS：**Compare And Swap（比较与交换）** ，用于实现乐观锁，保证在无锁情况下保证线程操作共享数据的原子性，被广泛应用于各大框架中。CAS 的思想是用一个预期值和要更新的变量值进行比较，两值相等才会进行更新。

CAS 是一个原子操作，底层依赖于一条 CPU 的原子指令。

CAS 涉及到三个操作数：

1. **V**：要更新的变量值(Var)
2. **E**：预期值(Expected)
3. **N**：拟写入的新值(New)

当且仅当 V 的值等于 E 时，CAS 通过原子方式用新值 N 来更新 V 的值。如果不等，说明已经有其它线程更新了 V，则当前线程放弃更新。

- 存在的问题：ABA 问题、循环时间长开销大

- 底层：依赖于一个 Unsafe 类来直接调用操作系统底层的 CAS 指令

## 公平锁和非公平锁有什么区别？

- **公平锁** : 锁被释放之后，先申请的线程先得到锁。性能较差一些，因为公平锁为了保证时间上的绝对顺序，上下文切换更频繁。
- **非公平锁**：锁被释放之后，后申请的线程可能会先获取到锁，是随机或者按照其他优先级排序的。性能更好，但可能会导致某些线程永远无法获取到锁。

## 共享锁和独占锁有什么区别？

- **共享锁**：一把锁可以被多个线程同时获得。
- **独占锁**：一把锁只能被一个线程获得。

## volatile 的作用

- 保证线程间的可见性：用 volatile 修饰共享变量，能够防止编译器等优化发生，让一个线程对共享变量的修改对另一个线程可见。
- 禁止进行指令重排序：用 volatile 修饰共享变量会在读、写共享变量时加入不同的屏障，阻止其他读写操作越过屏障，从而达到阻止重排序的效果。

## synchronized 的底层原理

Synchronized【对象锁】采用互斥的方式让同一时刻至多只有一个线程能持有【对象锁】

Synchronized 底层由monitor实现的，线程获得锁需要使用对象（锁）关联monitor

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405111658920.png" alt="image-20240511165805762" style="zoom:45%;float: left;" />

- Owner：存储当前获取锁的线程的，只能有一个线程可以获取
- EntryList：关联没有抢到锁的线程，处于Blocked状态的线程
- WaitSet：关联调用了wait方法的线程，处于Waiting状态的线程

## synchronized 中的锁升级、重量级锁、轻量级锁

- Monitor实现的锁属于重量级锁，里面涉及到了用户态和内核态的切换、进程的上下文切换，成本较高，性能比较低。
- 在JDK 1.6引入了两种新型锁机制：偏向锁和轻量级锁，它们的引入是为了解决在没有多线程竞争或基本没有竞争的场景下因使用传统锁机制带来的性能开销问题。

在HotSpot虚拟机中，对象在内存中存储的布局可分为3块区域：对象头（Header）、实例数据（Instance Data）和对齐填充

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405111720813.png" alt="image-20240511172032734" style="zoom: 50%;float: left;" />

**轻量级锁的执行过程**

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405111721449.png" alt="image-20240511172124354" style="zoom:50%;float: left;" />

synchronized有**偏向锁**、**轻量级锁**、重量级锁三种形式，分别对应了**锁只被一个线程持有**、**不同线程交替持有锁**、**多线程竞争锁**三种情况。

|          | 描述                                                         |
| -------- | ------------------------------------------------------------ |
| 重量级锁 | 底层使用的Monitor实现，里面涉及到了用户态和内核态的切换、进程的上下文切换，成本较高，性能比较低。 |
| 轻量级锁 | 线程加锁的时间是错开的（也就是没有竞争），可以使用轻量级锁来优化。轻量级修改了对象头的锁标志，相对重量级锁性能提升很多。每次修改都是CAS操作，保证原子性 |
| 偏向锁   | 一段很长的时间内都只被一个线程使用锁，可以使用了偏向锁，在第一次获得锁时，会有一个CAS操作，之后该线程再获取锁，只需要判断mark word中是否是自己的线程id即可，而不是开销相对较大的CAS命令 |

## AQS的工作机制

AQS（AbstractQueuedSynchronizer），是一个抽象类，提供了构建锁和其他同步组件的基础框架，用于同步多线程中的队列，ReentrantLock、Semaphore都是基于AQS实现的。

**工作机制：**

- 在AQS中维护了一个使用了volatile修饰的**state**属性来表示资源的状态，0表示无锁，1表示有锁，如果队列中的有一个线程修改成功了state为1，则当前线程就相等于获取了资源。

- AQS内部维护了一个先进先出的等待队列，类似于 Monitor 的 EntryList，修改state时使用CAS操作保证原子性，确保只能有一个线程修改成功，修改失败的线程将会进入队列中等待

- 通过条件变量来实现等待、唤醒机制，支持多个条件变量，类似于 Monitor 的 WaitSet

## AQS与synchronized的区别

| **synchronized**               | **AQS**                                |
| ------------------------------ | -------------------------------------- |
| 关键字，c++ 语言实现           | java 语言实现                          |
| 悲观锁，自动释放锁             | 悲观锁，手动开启和关闭                 |
| 锁竞争激烈都是重量级锁，性能差 | 锁竞争激烈的情况下，提供了多种解决方案 |

**AQS支持实现多种类型的锁，包括公平锁和非公平锁**。

- 新的线程与队列中的线程共同来抢资源，是非公平锁
- 新的线程到队列中等待，只让队列中的head线程获取锁，是公平锁

>ReentrantLock是基于AQS实现的一个互斥锁，它可以被配置为公平锁或非公平锁，通过构造函数的参数来决定。因此，谈论AQS是公平锁还是非公平锁并不准确，应当说是AQS支持构建公平锁和非公平锁两种模式的同步组件。

## ReentrantLock的实现原理

ReentrantLock翻译过来是可重入锁，相对于synchronized它具备以下特点：

- 可中断

- 可以设置超时时间

- 可以设置公平锁

- 支持多个条件变量

- 与synchronized一样，都支持重入

**ReentrantLock主要利用CAS+AQS队列来实现**。它支持公平锁和非公平锁，两者的实现类似，构造方法接受一个可选的公平参数（默认非公平锁），当设置为true时，表示公平锁，否则为非公平锁。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405112311695.png" alt="image-20240511231128610" style="zoom:45%;float: left;" />



- 线程来抢锁后使用CAS的方式修改`state`状态，修改状态成功为1，则让`exclusiveOwnerThread`属性指向当前线程，获取锁成功
- 假如修改状态失败，则会进入双向队列中等待，`head`指向双向队列头部，`tail`指向双向队列尾部
- 当`exclusiveOwnerThread`为null的时候，则会唤醒在双向队列中等待的线程
- 公平锁则体现在按照先后顺序获取锁，非公平体现在不在排队的线程也可以抢锁

## synchronized和Lock有什么区别 ? 

- 语法层面
  * synchronized 是关键字，源码在 JVM 中，用 C++ 实现
  * Lock 是接口，源码由 JDK 提供，用 Java 语言实现
  * 使用 synchronized 时，退出同步代码块锁会自动释放，而使用 Lock 时，需要手动调用 unlock 方法释放锁
- 功能层面
  * 二者均属于悲观锁、都具备基本的互斥、同步、锁重入功能
  * Lock 提供了许多 synchronized 不具备的功能，例如获取等待状态、公平锁、可打断、可超时、多条件变量
  * Lock 有适合不同场景的实现，如 ReentrantLock， ReentrantReadWriteLock
- 性能层面
  * 在没有竞争时，synchronized 做了很多优化，如偏向锁、轻量级锁
  * 在竞争激烈时，Lock 的实现通常会提供更好的性能

## 死锁产生的条件是什么？如何进行死锁诊断？

**死锁**：一个线程需要同时获取多把锁，这时就容易发生死锁

>例如：
>
>t1 线程获得A对象锁，接下来想获取B对象的锁
>
>t2 线程获得B对象锁，接下来想获取A对象的锁 

**死锁诊断**：

使用jdk自带的工具：jps和 jstack

1. 使用 `jps` 查看运行的线程
2. 第二：使用`jstack -l <进程ID>`查看线程运行的情况

**其他解决工具，可视化工具**

- jconsole

用于对jvm的内存，线程，类 的监控，是一个基于 jmx 的 GUI 性能监控工具

打开方式：java 安装目录 bin目录下 直接启动 jconsole.exe 就行

- VisualVM：故障处理工具

能够监控线程，内存情况，查看方法的CPU时间和内存中的对 象，已被GC的对象，反向查看分配的堆栈

打开方式：java 安装目录 bin目录下 直接启动 jvisualvm.exe就行

## 怎么保证多线程的执行安全？

导致并发程序出现问题的**根本原因**和**解决办法**：

- 原子性：一个线程在CPU中操作不可暂停，也不可中断，要不执行完成，要不不执行

  **synchronized、lock**

- 内存可见性：让一个线程对共享变量的修改对另一个线程可见

  **volatile、synchronized、lock**

- 有序性：处理器为了提高程序运行效率，可能会对输入代码进行优化，它不保证程序中各个语句的执行先后顺序同代码中的顺序一致，但是它会保证程序最终执行结果和代码顺序执行的结果是一致的

  **volatile**

## 线程池的核心参数、执行原理，如何实现自定义线程池？

用 `ThreadPoolExecutor` 类创建线程：

```java
public class MyThreadPoolDemo3 {
    
    public static void main(String[] args) {
        
        ThreadPoolExecutor pool = new ThreadPoolExecutor(
            2,                                   // 参数一：核心线程数量
            5,                                   // 参数二：最大线程数
            2,                                   // 参数三：空闲线程最大存活时间
            TimeUnit.SECONDS,                    // 参数四：存活时间单位
            new ArrayBlockingQueue<>(10),        // 参数五：任务队列
            Executors.defaultThreadFactory(),    // 参数六：创建线程工厂
            //r -> new Thread(r, name:"myThread" + c.getAndIncrement(),
            new ThreadPoolExecutor.AbortPolicy() // 参数七：任务的拒绝策略
        );
        
        pool.submit(new MyRunnable());
        pool.submit(new MyRunnable());

        pool.shutdown();
    }
}
```

## 线程池有哪些任务拒绝策略？

| 任务拒绝策略                               | 说明                                                       |
| ------------------------------------------ | ---------------------------------------------------------- |
| ThreadPoolExecutor.**AbortPolicy**         | 丢弃任务并抛出异常（RejectedExecutionException），默认策略 |
| ThreadPoolExecutor.**DiscardPolicy**       | 丢弃任务，但是不抛出异常（不推荐）                         |
| ThreadPoolExecutor.**DiscardoldestPolicy** | 抛弃队列中等待最久的任务，然后把当前任务加入队列中         |
| ThreadPoolExecutor.**CallerRunsPolicy**    | 调用任务的run()方法绕过线程池直接执行                      |

## 线程池有哪些常见的阻塞队列？

workQueue - 当没有空闲核心线程时，新来任务会加入到此队列排队，队列满会创建救急线程执行任务

比较常见workQueue 的有4个，用的最多是**ArrayBlockingQueue**和**LinkedBlockingQueue**

1.**ArrayBlockingQueue：基于数组结构的有界阻塞队列，FIFO。**

2.**LinkedBlockingQueue：基于链表结构的有界阻塞队列，FIFO。**

3.DelayedWorkQueue ：是一个优先级队列，它可以保证每次出队的任务都是当前队列中执行时间最靠前的。

4.SynchronousQueue：不存储元素的阻塞队列，每个插入操作都必须等待一个移出操作。

**ArrayBlockingQueue的LinkedBlockingQueue区别**

|                  |             **ArrayBlockingQueue**             |               **LinkedBlockingQueue**               |
| ---------------- | :--------------------------------------------: | :-------------------------------------------------: |
| **长度**         |                  **强制有界**                  |               **默认无界，支持有界**                |
| **底层数据结构** |                      数组                      |                        链表                         |
| **创建方式**     | 提前初始化 Node  数组，Node 需要是提前创建好的 | 是懒惰的，创建节点的时候添加数据，入队会生成新 Node |
| **加锁方式**     |                     一把锁                     |                     头尾两把锁                      |

**ArrayBlockingQueue**和**LinkedBlockingQueue**加锁方式：

- **ArrayBlockingQueue**只有一把锁，读和写公用，性能较差

- **LinkedBlockingQueue**读和写各有一把锁，性能较好

## 如何确定核心线程数

**参考回答：**

① 高并发、任务执行时间短 -->（ CPU核数+1 ），减少线程上下文的切换

② 并发不高、任务执行时间长

- IO密集型的任务 --> (CPU核数 * 2 + 1)

- 计算密集型任务 --> （ CPU核数+1 ）

③ 并发高、业务执行时间长，解决这种类型任务的关键不在于线程池而在于整体架构的设计，看看这些业务里面某些数据是否能做缓存是第一步，增加服务器是第二步，至于线程池的设置，设置参考（2）

## 线程池的种类有哪些

- newFixedThreadPool：创建一个定长线程池，可控制线程最大并发数，超出的线程会在队列中等待

  **允许的请求队列长度为Integer.MAX_VALUE，可能会堆积大量的请求，从而导致OOM**

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405131641783.png" alt="image-20240513164118730" style="float: left;"/>

- newSingleThreadExecutor：创建一个单线程化的线程池，它只会用唯一的工作线程来执行任 务，保证所有任务按照指定顺序(FIFO)执行

  **允许的请求队列长度为Integer.MAX_VALUE，可能会堆积大量的请求，从而导致OOM**

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405131641155.png" alt="image-20240513164133123" style="float: left;"/>

- newCachedThreadPool：创建一个可缓存线程池，如果线程池长度超过处理需要，可灵活回收空闲线程，若无可回收，则新建线程

  **允许的创建线程数量为Integer.MAX_VALUE，可能会创建大量的线程，从而导致OOM**

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405131646303.png" alt="image-20240513164601273" style="float: left;"/>

- newScheduledThreadPool：可以执行延迟任务的线程池，支持定时及周期性任务执行

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405131641651.png" alt="image-20240513164158611" style="float: left;"/>

## CountDownLatch 的使用场景

CountDownLatch（闭锁/倒计时锁）用来进行线程同步协作，等待所有线程完成倒计时（一个或者多个线程，等待其他多个线程完成某件事情之后才能执行）

- 其中构造参数用来初始化等待计数值
- await() 用来等待计数归零
- countDown() 用来让计数减一

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405141957968.png" alt="image-20240514195748914" style="zoom:75%;float: left;" />

应用场景：

- 批量导入：使用了线程池+CountDownLatch批量把数据库中的数据导入到了ES中，避免OOM
- 数据汇总：调用多个接口来汇总数据，如果所有接口（或部分接口）的没有依赖关系，就可以使用线程池+future来提升性能
- 异步线程（线程池）：为了避免下一级方法影响上一级方法（性能考虑），可使用异步线程调用下一个方法（不需要下一级方法返回值），可以提升方法响应时间

## Semaphore 的使用场景

Semaphore  可以用来限制线程的执行数量，达到限流的效果。

当一个线程执行时先通过其方法进行获取许可操作，获取到许可的线程继续执行业务逻辑，当线程执行完成后进行释放许可操作，未获取达到许可的线程进行等待或者直接结束。

Semaphore 两个重要的方法：

`acquire()`： 请求一个信号量，这时候的信号量个数-1（一旦没有可使用的信号量，也即信号量个数变为负数时，再次请求的时候就会阻塞，直到其他线程释放了信号量）

`release()`：释放一个信号量，此时信号量个数+1

##ThreadLocal 的实现原理

ThreadLocal 是多线程中对于解决线程安全的一个操作类，本质是一个线程内部存储类，让多个线程只操作自己内部的值，从而实现线程数据隔离。

ThreadLocal 会为每个线程都分配一个独立的线程副本，**解决了变量并发访问冲突**、**实现了线程内的资源共享**的问题。

ThreadLocal 三个主要方法：

- set(value) 设置值

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405142042596.png" alt="image-20240514204219542" style="float: left;" />

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405142004066.png" alt="image-20240514200431014" style="float: left; " />

- get() 获取值 / remove() 清除值

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405142004819.png" alt="image-20240514200437775" style="float: left;" />

## ThreadLocal 的内存泄露问题

每一个Thread维护一个ThreadLocalMap，ThreadLocalMap中的**Entry对象继承了WeakReference**，其中**key为使用弱引用的ThreadLocal实例，value为线程变量的副本**

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405142052855.png" alt="image-20240514205228790" style="zoom:60%;float: left;" />

# **JVM**

## JVM的组成，运行流程是什么？

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405181542311.png" alt="image-20240518154206180" style="zoom:58%;float: left;" />

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404152105989.png" alt="1359e67d-c872-4a59-87bf-224d31a36b1c" style="zoom:90%;float: left;" />

- 类加载子系统：核心组件类加载器，负责将字节码文件中的内容加载到内存中。
- 运行时数据区：JVM管理的内存，创建出来的对象、类的信息等等内容都会放在这块区域中。
- 执行引擎：包含了即时编译器、解释器、垃圾回收器，执行引擎使用解释器将字节码指令解释成机器码，使用即时编译器优化性能，使用垃圾回收器回收不再使用的对象。
- 本地接口：调用本地使用C/C++编译好的方法，本地方法在Java中声明时，都会带上native关键字，如下图所示。

## 堆

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202405181600231.png" alt="image-20240518160048142" style="zoom:55%;float: left;" />

- 线程共享的区域：主要用来保存对象实例，数组等，内存不够则抛出OutOfMemoryError异常。
- 组成：年轻代+老年代
  - 年轻代被划分为三部分，Eden区和两个大小严格相同的Survivor区
  - 老年代主要保存生命周期长的对象，一般是一些老的对象

- Jdk1.7和1.8的区别
  - 1.7中的永久代（存储的是类信息、静态变量、常量、编译后的代码）在堆中
  - 1.8移除了永久代，把数据存储到了本地内存的元空间中，防止内存溢出

## 虚拟机栈

虚拟机栈：每个线程运行时所需要的内存

每个虚拟机栈由多个栈帧（frame）组成，对应着每次方法调用时所占用的内存

每个线程只能有一个活动栈帧，对应着当前正在执行的那个方法

## 什么情况下会导致栈内存溢出？

- 栈帧过多导致栈内存溢出，典型问题：递归调用
- 栈帧过大导致栈内存溢出

## 如何判断方法内的局部变量是否线程安全？

- 如果方法内局部变量没有逃离方法的作用范围，它是线程安全的
- 如果是局部变量引用了对象，并逃离方法的作用范围，需要考虑线程安全

```java
public static void main(String[] args) {
    StringBuilder sb = new StringBuilder();
    sb.append(1);
    sb.append(2);
    new Thread(()->{
        m2(sb);
    }).start();
}
//线程安全
public static void m1(){
    StringBuilder sb = new StringBuilder();
    sb.append(1);
    sb.append(2);
    System.out.println(sb.toString());
}
//线程不安全
public static void m2(StringBuilder sb){
    sb.append(3);
    sb.append(4);
    System.out.println(sb.toString());
}
//线程不安全
public static StringBuilder m3(){
    StringBuilder sb = new StringBuilder();
    sb.append(5);
    sb.append(6);
    return sb;
}
```

## 类的生命周期 / 类装载的执行过程

1. **加载**：类加载器根据类的全限定名获取类的二进制数据流，解析二进制数据流为方法区内的Java类模型，最后创建java.lang.Class类的实例
2. 连接：
   - 验证：验证内容是否满足《Java虚拟机规范》（文件格式验证、元信息验证、验证程序执行指令的语义、符号引用验证）
   - 准备：给静态变量赋初值
   - 解析：将常量池中的符号引用替换成指向内存的直接引用。

3. **初始化**：执行字节码文件中 `clinit` 方法的字节码指令，包含了静态代码块中的代码，并为静态变量赋值
4. **使用**：调用静态类成员信息、使用new关键字为其创建对象实例、执行用户的程序代码
5. **卸载**（详见垃圾回收）：代码执行完毕后，JVM销毁Class对象

## 类加载器

**含义**：在类加载过程中，获取并加载字节码（.class文件），放到内存中，转换成二进制文件（byte[]），并调用虚拟机底层方法将二进制文件转换成方法区和堆中的数据。

- **启动类**加载器：加载核心jar包（JAVA_HOME/jre/lib目录下的库）
- **扩展类**加载器：加载通用的扩展jar包（JAVA_HOME/jre/lib/ext目录中的类）
- **应用程序类**加载器：加载项目中的类、maven中的引用的jar包等（加载classPath下的类）

### 双亲委派机制

双亲委派机制：当一个类加载器接收到加载类的任务时，会向上查找是否加载过，如果加载过，就直接返回，如果没有加载，就向下委派子类加载。

**作用：**

- 避免核心类库被覆写，确保完整性、安全性。
- 避免某一个类被重复加载，确保唯一性。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404171633515.png" alt="image-20240417163337417" style="zoom:45%;float: left;" />

### 如何打破双亲委派机制？什么时候需要打破双亲委派机制？

- **自定义类加载器**：定义类加载器并且重写`loadclass`方法，去除双亲委派机制的代码（Tomcat的应用之间类隔离）。

- **线程上下文类加载器**：利用SPI机制和上下文类加载器加载类，比如`JDBC`、`JNDI`、`JCE`、`JAXB`和`JBI`等

  > JDBC案例：
  >
  > 1. 启动类加载器加载DriverManager。
  > 2. 在初始化DriverManager时，通过SPI机制加载jar包中的myq驱动。
  > 3. SPI中利用了线程上下文类加载器（应用程序类加载器）去加载类并创建对象。
  >
  > <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404162258658.png" style="zoom:45%;float: left;" />

- ***OSGi框架的类加载器：OSGi框架实现了一套新的类加载器机制，允许同级之间委托进行类的加载***

## 运行时数据区域（JDK8）

- 线程不共享：

  - **程序计数器**：记录当前要执行的字节码指令的地址。可以控制程序指令的进行实现分支、跳转、异常等逻辑。

  - **虚拟机栈**：采用栈的数据结构来管理方法调用中的基本数据，每一个方法的调用使用一个**栈帧**来保存。

    > **栈帧**（StackFrame）的组成：
    >
    > - 局部变量表：在运行过程中存放所有的局部变量。数据结构是一个数组，数组中每一个位置称之为槽（slot），long和double类型占用两个槽，其他类型占用一个槽。
    >
    > - 操作数栈：在执行指令过程中用来存放临时数据的一块区域。
    > - 帧数据：主要包含动态链接、方法出口、异常表的引用。

  - **本地方法栈**：与上雷同，用来管理native本地方法的栈帧。

- 线程共享：

  - **堆**：用来存放创建出来的对象。栈的局部变量表存放堆上对象的引用。静态变量也可以存放堆对象的引用，通过静态变量就可以实现对象在线程之间共享。

  - **方法区**：存放**类的元信息**（基本信息）和**运行时常量池**，在类的加载阶段完成，方法区是线程共享的。JDK7及之前，方法区存放在堆区域的永久代中，JDK8及之后，方法去存放在直接内存的元空间中。

    > - 类的元信息：保存了所有类的基本信息
    > - 运行时常量池：保存了字节码文件中的常量池内容
    > - 字符串常量池：保存了字符串常量
    >
    > > 字符串常量池和运行时常量池的关系：
    > >
    > > - JDK6及之前：运行时常量池包含字符串常量池，hotspot虚拟机对方法区的实现为永久代。
    > > - JDK7：字符串常量池被从方法区拿到了堆中，运行时常量池剩下的东西还在永久代。
    > > - JDK8及之后：hotspot用元空间取代了永久代，字符串常量池还在堆。
    
  - **直接内存**（非运行时数据区的一部分）：为了在NIO的使用中，减少对用户的影响，以及提升写文件和读文件的效率，在JDK8及之后，还可以保存方法区中的数据。     

## 查看字节码的软件

- jclasslib插件

- javap

  - ```shell
    jar –xvf xxxx.jar
    ```

  - ```shell
    javap -v xxxx.class > xxxx.txt
    ```

- **Arthas**

  - ```shell
    java -jar arthas-boot.jar
    ```

  - ```shell
    jad --source-only com.demo.package.Main.clss
    ```

## 

## 不用JDK版本的`运行时数据区域`的区别

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404182259973.png" alt="image-20240418225940800" style="zoom: 40%;float: left;" />

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404182300408.png" alt="image-20240418230034266" style="zoom:40%;float: left;" />

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404182301963.png" alt="image-20240418230109816" style="zoom:40%;float: left;" />

## Java的内存分成哪几部分？详细介绍一下吧

1. **寄存器**（Register）：用来暂时存放指令、数据和位址。
2. 栈（Stack）：存放基本类型数据和对象的引用（地址）。当一段代码块定义一个变量时，Java就在栈中为这个变量分配内存空间，当变量退出作用域后，Java会自动释放掉为该变量所分配的空间。栈是用来存储局部变量表、操作数栈、动态链接、方法出口等信息的区域。每个线程在执行方法时都会创建一个栈帧，存储对应的方法信息。
3. **堆**（Heap）：存放通过new关键字创建的对象和数组。堆内存是JVM中内存最大的一块，主要用来存放运行过程中所有的对象。
4. **方法区**（Method Area）：用于存储类信息、常量、静态变量、即时编译器编译后的代码等。在Java 8中，方法区被重命名为元空间（Metaspace），并存在于本地内存（Native memory）中。
5. **常量池**（Constant Pool）：存放常量。
6. **本地方法栈**（Native Method Stack）：与虚拟机栈的作用类似，为JVM调用Native方法服务。

## Java内存中哪些部分会内存溢出?

1. **堆内存溢出**：当堆内存不足以存放更多的对象时，会发生堆内存溢出。错误信息通常显示为：java.lang.OutOfMemoryError: Java heap space。
2. **方法区/元空间内存溢出**：如果加载的类过多或者常量池中保存的常量过多、动态代理导致反复生成的类型过多，都有可能导致方法区/元空间的内存溢出。
3. **栈内存溢出**：如果请求栈的深度过大而超出了栈所能承受的范围，就会抛出StackOverflowError错误。这通常发生在有大量递归调用的情况下。

## JDK7和8中在内存结构上的区别是什么？

在JDK7中，堆内存通常被分为Nursery内存（young generation）、长时内存（old generation）和永久内存（Permanent Generation for VM Matedata）。

在JDK8中，存放元数据中的永久内存从堆内存中移到了本地内存（native memory）中，因此不再占用堆内存。这一改变有助于避免由于永久内存不足而导致的内存溢出错误。同时，JDK8中方法区的实现也发生了变化，它现在存在于元空间（Metaspace）中，且元空间与堆内存不再连续，而是存在于本地内存中。

## 垃圾回收（GC）

### 方法区的回收

1. 此类所有实例对象都已经被回收（在堆中不存在任何该类的实例对象以及子类对象）。
2. 加载该类的类加载器已经被回收。
3. 该类对应的java.lang.Class 对象没有在任何地方被引l用。

实际开发中，我们写的类是被`应用程序类加载器`创建的，所以开发中方法区的回收一般很少出现，但在如OSGi、JSP的热部署等应用场景中会出现。每个jsp文件对应一个唯一的类加载器，当一个jsp文件修改了，京就直接卸载这个jsp类加载器。重新创建类加载器，重新加载jsp文件。

### 堆回收

对象能否被回收，是根据对象是否被引用来决定的。只有无法通过引用获取到对象时，该对象才能被回收；如果对象被引引用了，说明该对象还在使用，不允许被回收。

对象回收判断

- **引用计数法**：

  为每个对象维护一个引用计数器，当对象被引用时加1，取消引用时减1。当对象计数为0时就会触发回收机制。无法解决循环引用的垃圾回收。

- **可达性分析法**：

  如果从某个到GC Root对象是可达的，对象就不可被回收。

  > 根对象（不可回收）：
  >
  > - 线程Thread对象
  > - 系统类加载器加载的java.lang.Class对象
  > - 监视器对象，用来保存同步锁synchronized关键字持有的对象
  > - 本地方法调用时使用的全局对象

常见引用对象

- **强引用：如果对象在根对象的引用链上，则不能被回收。**

- **软引用：如果对象被软引用关联，当程序内存不足时会回收。**

  > 在JDK1.2版之后提供了SoftReference类来实现软引l用，软引用常用于缓存中

- **弱引用：和软引用基本一致，区别在于弱引用在垃圾回收时，会被直接回收。**

  > 在JDK1.2版之后提供了WeakReference类来实现弱引用，弱引用主要在ThreadLocal中使用。弱引|用对象本身也可以使用引|用队列进行回收。

- ***虚引用：*无法获取包含的对象。唯一用途是当对象被回收时，可以接收到对应的通知，知道对象被回收了。**

  > Java中使用PhantomReference实现了虚引用，使用虚引用实现了直接内存中为了及时知道直接内存对象不再使用，从而回收内存。

- ***终结器引用：*对象回收时可以自救，不建议使用。（在对象需要被回收时，对象将会被放置在Finalizer类中的引用队列中，并在稍后由一条由FinalizerThread线程从队列中获取对象，然后执行对象的finalize方法（再将自身对象使用强引用关联上））**

### 垃圾回收算法

**评价标准**：

1. **吞吐量**：指的是CPU用于执行用户代码的时间与CPU总执行时间的比值，即吞吐量=执行用户代码时间 /（执行用户代码时间+GC时间）。吞吐量数值越高，垃圾回收的效率就越高。
2. **最大暂停时间**：指的是所有在垃圾回收过程中的STW时间最大值。
3. **堆使用效率**：不同垃圾回收算法，对堆内存的使用方式是不同的。比如标记清除算法，可以使用完整的堆内存。而复制算法会将堆内存一分为二，每次只能使用一半内存。从堆使用效率上来说，标记清除算法要优于复制算法。

- **标记-清除算法**：

  1. 标记阶段，使用可达性分析算法将所有存活的对象进行标记，从GCRoot开始通过引用链遍历出所有存活对象。
  2. 清除阶段，从内存中删除没有被标记的非存活对象。

  > 优点：实现简单，只需要在第一阶段给每个对象维护标志位，第二阶段删除对象即可。
  >
  > 缺点：
  >
  > 1. 碎片化问题由于内存是连续的，所以在对象被删除之后，内存中会出现很多细小的可用内存单元。如果我们需要的是一个比较大的空间，很有可能这些内存单元的大小过小无法进行分配。
  > 2. 分配速度慢。由于内存碎片的存在，需要维护一个空闲链表，极有可能发生每次需要遍历到链表的最后才能获得合适的内存空间。

- **标记-整理（标记-压缩）算法**：

  ​	是对`标记-清理算法`中容易产生内存碎片问题的一种解决方案。

  1. 标记阶段，将所有存活的对象进行标记。使用可达性分析算法，从GCRoot开始通过引l用链遍历出所有存活对象。
  2. 整理阶段，将存活对象移动到堆的一端。清理掉存活对象的内存空间。

  > 优点：
  >
  > 1. 内存使用效率高。整个堆内存都可以使用，不会像复制算法只能使用半个堆内存。
  > 2. 不会发生碎片化。在整理阶段可以将对象往内存的一侧进行移动，剩下的空间都是可以分配对象的有效空间。
  >
  > 缺点：整理阶段的效率不高。整理算法有很多种，比如`Lisp2`整理算法需要对整个堆中的对象搜索3次，整体性能不佳。可以通过`Two-Finger`、`表格算法`、`ImmixGc`等高效的整理算法优化此阶段的性能。

- **复制算法**：

  1. 将堆内存分割成两块From空间To空间，对象分配阶段，创建对象。
  2. GC阶段开始，将GC Root搬运到To空间。
  3. 将GCRoot关联的对象，搬运到To空间。
  4. 清理From空间，并把名称互换。

  > 优点：
  >
  > 1. 吞吐量高。复制算法只需要遍历一次存活对象复制到To空间即可，比标记-整理算法少了一次遍历的过程，因而性能较好，但是不如标记-清除算法因为标记清除算法不需要进行对象的移动。
  > 2. 不会发生碎片化。复制算法在复制之后就会将对象按顺序放入To空间中，所以对象以外的区域都是可用空间，不存在碎片化内存空间。
  >
  > 缺点：内存使用效率低。每次只能让一半的内存空间来为创建对象使用。


### 分代垃圾回收（分代GC）

    1. 将整个内存区域划分为**年轻代**和**老年代**。
    2. 分代回收时，创建出来的对象，首先会被放入Eden伊甸园区。
    3. 随着对象在Eden区越来越多，Eden区满了就会触发年轻代的GC（Minor GC / Young GC），将不需要回收的对象放到To区，新创建的对象继续放到Eden区。
    4. 如果MinorGC后对象的年龄达到阈值（最大15，最小为0，默认值和垃圾回收器有关），对象就会被晋升至老年代。
    5. 当老年代中空间不足，无法放入新的对象时，先尝试Minor GC如果还是不足，就会触发Full GC，Full GC会对整个堆进行垃圾回收。
    6. 如果Full GC依然无法回收掉老年代的对象，那么当对象继续放入老年代时，就会抛出Out Of Memory异常。

### 垃圾回收器

垃圾回收器是垃圾回收算法的具体实现，在JVM中，实现了多种垃圾收集器，包括：

- 串行垃圾收集器
  - Serial和Serial Old串行垃圾收集器，是指使用单线程进行垃圾回收，堆内存较小，适合个人电脑
  - Serial 作用于新生代，采用复制算法
  - Serial Old 作用于老年代，采用标记-整理算法
  - 垃圾回收时，只有一个线程在工作，并且java应用中的所有线程都要暂停（STW），等待垃圾回收的完成。
- 并行垃圾收集器
  - Parallel New和Parallel Old是一个并行垃圾回收器，JDK8默认使用此垃圾回收器
  - Parallel New作用于新生代，采用复制算法
  - Parallel Old作用于老年代，采用标记-整理算法
  - 垃圾回收时，多个线程在工作，并且java应用中的所有线程都要暂停（STW），等待垃圾回收的完成。
- CMS（并发）垃圾收集器
  - CMS全称 Concurrent Mark Sweep，是一款并发的、使用标记-清除算法的垃圾回收器，该回收器是针对老年代垃圾回收的，是一款以获取最短回收停顿时间为目标的收集器，停顿时间短，用户体验就好。其最大特点是在进行垃圾回收时，应用仍然能正常运行。
- G1垃圾收集器
  - 应用于新生代和老年代，在JDK9之后默认使用G1
  - 划分成多个区域，每个区域都可以充当 eden，survivor，old， humongous，其中 humongous 专为大对象准备
  - 采用复制算法
  - 响应时间与吞吐量兼顾
  - 分成三个阶段：新生代回收、并发标记、混合收集
  - 如果并发失败（即回收速度赶不上创建新对象速度），会触发 Full GC

由于垃圾回收器分为年轻代和老年代，除了G1之外其他垃圾回收器必须成对组合进行使用，具体的关系图如下：

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404271337777.png" alt="image-20240427133704772" style="zoom:50%;float: left;" />

1. **年轻代-Serial垃圾回收器 + 老年代-SerialOld垃圾回收器**

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404271425975.png" alt="image-20240427142529922" style="zoom: 67%;float: left;" />

| 回收年代 | 算法     | 优点                        | 缺点                                                         | 适用场景                                   |
| -------- | -------- | --------------------------- | ------------------------------------------------------------ | ------------------------------------------ |
| 年轻代   | 复制算法 | 单CPU处理器下吞吐量非常出色 | 多CPU下吞吐量不如其他垃圾回收器，堆如果偏大会让用户线程处于长时间的等待 | Java编写的客户端程序或者硬件配置有限的场景 |

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404271425975.png" alt="image-20240427142529922" style="zoom: 67%;float: left;" />

| 回收年代 | 算法          | 优点                        | 缺点                                                         | 适用场景                                            |
| -------- | ------------- | --------------------------- | ------------------------------------------------------------ | --------------------------------------------------- |
| 老年代   | 标记-整理算法 | 单CPU处理器下吞吐量非常出色 | 多CPU下吞吐量不如其他垃圾回收器，堆如果偏大会让用户线程处于长时间的等待 | 与Serial垃圾回收器搭配使用，或者在CMS特殊情况下使用 |

2. **年轻代-ParNew垃圾回收器 + 老年代- CMS(Concurrent Mark Sweep)垃圾回收器**

   <img src="C:\Users\hzx\AppData\Roaming\Typora\typora-user-images\image-20240427142921039.png" alt="image-20240427142921039" style="zoom:67%;float: left;" />

| 回收年代 | 算法     | 优点                      | 缺点                                             | 适用场景                                          |
| -------- | -------- | ------------------------- | ------------------------------------------------ | ------------------------------------------------- |
| 年轻代   | 复制算法 | 多CPU处理器下停顿时间较短 | 吞吐量和停顿时间不如G1，所以在JDK9之后不建议使用 | JDK8及之前的版本中，与CMS老年代垃圾回收器搭配使用 |

<img src="C:\Users\hzx\AppData\Roaming\Typora\typora-user-images\image-20240427143027649.png" alt="image-20240427143027649" style="zoom:75%;float: left;" />

| 回收年代 | 算法          | 优点                                           | 缺点                                 | 适用场景                                                     |
| -------- | ------------- | ---------------------------------------------- | ------------------------------------ | ------------------------------------------------------------ |
| 老年代   | 标记-清除算法 | 系统由于垃圾回收出现的停顿时间较短，用户体验好 | 内存碎片问题、退化问题、浮动垃圾问题 | 大型的互联网系统中用户请求数据量大、频率高的场景，比如订单接口、商品接口等 |

> CMS执行步骤：
>
> 1.初始标记，用极短的时间标记出GC Roots能直接关联到的对象。
>
> 2.并发标记,   标记所有的对象，用户线程不需要暂停。
>
> 3.重新标记，由于并发标记阶段有些对象会发生了变化，存在错标、漏标等情况，需要重新标记。
>
> 4.并发清理，清理死亡的对象，用户线程不需要暂停。
>
> 缺点：
>
> 1、CMS使用了标记-清除算法，在垃圾收集结束之后会出现大量的内存碎片，CMS会在Full GC时进行碎片的整理。这样会导致用户线程暂停，可以使用-XX:CMSFullGCsBeforeCompaction=N 参数（默认0）调整N次Full GC之后再整理。
>
> 2.、无法处理在并发清理过程中产生的“浮动垃圾”，不能做到完全的垃圾回收。
>
> 3、如果老年代内存不足无法分配对象，CMS就会退化成Serial Old单线程回收老年代。

3. **年轻代-Parallel Scavenge垃圾回收器 + 老年代-Parallel Old垃圾回收器**

<img src="C:\Users\hzx\AppData\Roaming\Typora\typora-user-images\image-20240427143236251.png" alt="image-20240427143236251" style="zoom: 50%;float: left;" />

| 回收年代 | 算法     | 优点                                                         | 缺点                   | 适用场景                                                     |
| -------- | -------- | ------------------------------------------------------------ | ---------------------- | ------------------------------------------------------------ |
| 年轻代   | 复制算法 | 吞吐量高，而且手动可控。为了提高吞吐量，虚拟机会动态调整堆的参数 | 不能保证单次的停顿时间 | 后台任务，不需要与用户交互，并且容易产生大量的对象。比如：大数据的处理，大文件导出 |

<img src="C:\Users\hzx\AppData\Roaming\Typora\typora-user-images\image-20240427143236251.png" alt="image-20240427143236251" style="zoom: 50%;float: left;" />

| 回收年代 | 算法          | 优点                          | 缺点             | 适用场景                    |
| -------- | ------------- | ----------------------------- | ---------------- | --------------------------- |
| 老年代   | 标记-整理算法 | 并发收集，在多核CPU下效率较高 | 暂停时间会比较长 | 与Parallel Scavenge配套使用 |

4. **G1垃圾回收器（JDK9之后强烈建议）**

- 支持巨大的堆空间回收，并有较高的吞吐量。
- 支持多CPU并行垃圾回收。
- 允许用户设置最大暂停时间。

G1的整个堆会被划分成多个大小相等的区域，称之为区Region，区域不要求是连续的。分为Eden、Survivor、Old区。Region的大小通过堆空间大小/2048计算得到，也可以通过参数-XX:G1HeapRegionSize=32m指定(其中32m指定region大小为32M)，Region size必须是2的指数幂，取值范围从1M到32M。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404271434286.png" alt="image-20240427143448227" style="zoom:40%;float: left;" />

**回收过程：（简略版）**

1. 当G1判断年轻代区不足（max默认60%），无法分配对象时需要回收时会执行Young GC。

   根据配置的最大暂停时间选择某些区域将存活对象复制到一个新的Survivor区中（年龄+1），清空这些区域。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404271438170.png" alt="image-20240427143816094" style="zoom: 40%;float: left;" />

2. 当某个存活对象的年龄到达阈值（默认15），将被放入老年代。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404271439985.png" alt="image-20240427143922933" style="zoom:40%;float: left;" />

3. 部分对象如果大小超过Region的一半，会直接放入老年代，这类老年代被称为Humongous区。比如堆内存是4G，每个Region是2M，只要一个大对象超过了1M就被放入Humongous区，如果对象过大会横跨多个Region。

<img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202404271440569.png" alt="image-20240427143951445" style="zoom:40%;float: left;" />

4. 多次回收之后，会出现很多Old老年代区，此时总堆占有率达到阈值45%（默认）时，会触发混合回收MixedGC（过程略）。回收所有年轻代和部分老年代的对象以及大对象区。采用复制算法来完成。









# 业务问题

**问题1：实现用户端短信登陆，将用户Session数据转移到Redis存储，实现分布式会话**

1. 请简述你如何设计并实现用户短信登录的流程，包括验证码的生成、发送和验证。

   短信登录流程设计：我们首先生成一个唯一的验证码，并将其存储到Redis中，设置一定的过期时间。然后将这个验证码通过短信服务发送到用户的手机上。用户在前端输入验证码并提交后，我们与Redis中存储的验证码进行比对，如果一致则验证成功，创建用户会话并登录。

2. 你为什么选择将Session数据转移到Redis存储？这样做的好处和潜在问题是什么？

   Redis作为内存数据库，读写速度快，适合存储临时数据。将Session数据转移到Redis中，可以实现跨服务器共享Session，从而支持分布式会话。潜在问题在于，如果Redis服务故障，可能导致用户会话丢失，因此需要考虑Redis的高可用性。

3. 在实现分布式会话时，你如何处理Session的一致性和失效问题？

   使用Redis的分布式锁机制确保Session数据的一致性。同时，为每个Session设置一个过期时间，当Session过期后自动失效，防止长时间占用资源。

**问题2：使用Thymeleaf生成文章模板并上传保存到Minio中**

1. 能否描述一下你如何使用Thymeleaf模板引擎动态生成文章模板的？

   根据文章的数据模型设计Thymeleaf模板，利用Thymeleaf的语法动态填充数据。通过Spring MVC的控制器，将渲染后的HTML内容作为响应返回给前端。

2. 你如何将生成的模板文件上传到Minio存储服务中？上传过程中考虑了哪些性能和安全因素？

   将生成的HTML内容保存为文件，并使用Minio的Java SDK将文件上传到指定的Bucket中。上传过程中，我们考虑了文件的分块上传以提高性能，并使用了HTTPS协议确保数据传输的安全性。

3. 如果Minio服务出现异常，你如何处理上传失败的情况？

   如果Minio服务异常导致上传失败，我们会捕获异常并记录错误日志。同时，向前端返回上传失败的提示，并尝试重新上传或提供其他备选方案。

**问题3：采用Kafka监听消息队列，完成延时发布文章功能**

1. 请解释你如何利用Kafka实现延时发布文章的功能？具体使用了Kafka的哪些特性？

   当文章创建时，我们将其封装为消息并发送到Kafka的延时队列中，设置相应的延时时间。Kafka会在指定的时间后将消息发送到相应的主题，我们的消费者监听这个主题并处理消息，完成文章的发布。

2. 当Kafka中的消息处理失败时，你如何保证消息不丢失？

   配置了Kafka的消息持久化，确保即使Kafka服务重启，消息也不会丢失。同时，消费者在处理消息时，会进行确认操作，只有确认后的消息才会从Kafka中删除。如果处理失败，消息会重新进入队列等待再次处理。

3. Kafka在高并发场景下可能会遇到哪些挑战？你如何优化Kafka的性能？

   在高并发场景下，通过增加Kafka的分区数、调整消费者的并发数以及优化消息的序列化方式等手段来提高Kafka的性能。

**问题4：封装阿里云内容安全模块和离线图片文字识别模块，完成文章图片和文字的内容安全审查**

1. 你如何封装和使用阿里云的内容安全模块？具体实现了哪些内容安全审查功能？

   使用了阿里云的内容安全API，封装了相应的Java客户端。通过调用这些API，我们可以对文章中的图片和文字进行内容安全审查，包括识别违规内容、过滤敏感词等。

2. 在使用离线图片文字识别模块时，你如何保证识别的准确性和效率？

   使用了阿里云的离线图片文字识别服务。该服务可以准确识别图片中的文字内容，我们将其与文字内容一起进行内容安全审查。

3. 如果阿里云服务不可用，你的内容安全审查系统如何应对？

   阿里云服务不可用，我们会暂时关闭内容安全审查功能，并向用户提示服务不可用。同时，我们会建立监控机制，及时发现并处理云服务异常。

**问题5：利用Maven的继承特性管理共有jar包的依赖，利用其聚合特性拆分依赖，实现分层工程开发**

1. 能否解释一下Maven的继承和聚合特性在分层工程开发中的具体应用？

   创建了一个父级Maven项目，其中定义了共有jar包的依赖。子项目通过继承这个父项目，可以自动获取这些依赖，无需在每个子项目中重复定义。同时，我们利用Maven的聚合特性，将多个子项目聚合到一个总项目中，方便统一构建和管理。

2. 你是如何管理共有jar包的依赖的？有没有遇到过依赖冲突的问题？如何解决的？

   对于依赖冲突问题，我们通常使用Maven的依赖管理功能来解决。在父项目中，我们定义了依赖的版本和范围，子项目继承这些定义时，Maven会自动处理依赖冲突，选择最合适的版本。

3. 你在拆分依赖时，考虑了哪些因素？拆分后的项目结构是怎样的？

   在拆分依赖时，我们考虑了项目的模块化和可维护性。我们将功能相关的代码和依赖划分到同一个模块中，形成清晰的层次结构。这样不仅可以提高代码的可读性和可维护性，还可以降低模块之间的耦合度。

**问题6：完成服务订单管理功能，包括创建订单、取消订单、删除订单、历史订单等**

1. 请描述一下你如何设计服务订单管理系统的数据库模型？

   订单管理系统设计了包括订单表、订单项表、用户表等在内的数据库模型。订单表存储订单的基本信息，如订单号、用户ID、创建时间等；订单项表存储订单的详细信息，如商品名称、数量、价格等。通过外键关联，我们实现了订单与订单项之间的关联关系。

2. 在处理订单状态变更（如取消、删除）时，你是如何保证数据的一致性和完整性的？

   在处理订单状态变更时，我们使用了数据库的事务管理来确保数据的一致性。例如，在取消订单时，我们需要同时更新订单状态和订单项的状态，这两个操作必须作为一个整体来完成，要么全部成功，要么全部失败。通过使用Spring框架的事务管理功能，我们可以方便地实现这一点。

3. 对于历史订单数据的查询和展示，你采用了哪些优化策略？

   对于历史订单的查询和展示，我们采用了分页和索引优化的策略。首先，我们为订单表的关键字段建立了索引，以提高查询效率。其次，我们使用了分页查询的方式，每次只加载部分订单数据到内存中，降低了内存消耗。同时，我们还提供了多种查询条件，方便用户根据订单状态、时间等条件进行筛选和排序。

**问题7：使用Redis优化用户端的查询接口，定时缓存热点服务数据，搭配布隆过滤器防止缓存穿透**

1. 你如何确定哪些数据是热点服务数据？定时缓存的策略是怎样的？

   通过分析用户请求日志和系统访问数据，确定了哪些数据是热点服务数据。这些数据通常具有访问频率高、变化不频繁的特点。

2. 在使用Redis缓存数据时，你如何保证数据的一致性和实时性？

   使用了Redis的缓存机制来存储这些热点数据。通过定时任务，我们定期从数据库中加载最新的热点数据到Redis中，并设置适当的过期时间。这样，当用户请求这些数据时，可以直接从Redis中获取，提高了查询速度。

3. 请解释一下布隆过滤器在防止缓存穿透中的作用和实现原理。

   布隆过滤器可以快速地判断一个元素是否存在于某个集合中，而不需要实际存储这个元素。在查询Redis之前，我们先通过布隆过滤器判断数据是否可能存在。如果布隆过滤器判断数据不存在，则直接返回空结果，避免了对Redis的无效查询。

**问题8：在优惠券分发接口中，使用Redisson+Lua实现一人一单，解决超卖问题**

1. 能否详细解释一下你如何使用Redisson和Lua实现一人一单的优惠券分发逻辑的？

   使用了Redisson的分布式锁和Lua脚本来实现一人一单的优惠券分发逻辑。首先，我们使用Redisson的分布式锁来确保同一时间只有一个线程能够处理优惠券的分发。然后，我们编写了一个Lua脚本，该脚本在Redis中原子地执行优惠券的扣减和分配操作。通过这两个机制的结合，我们确保了每个用户只能领取一张优惠券。

2. 在高并发场景下，你的优惠券分发系统如何保证性能和稳定性？

   通过水平扩展Redis集群、优化Lua脚本的性能以及调整Redisson的配置参数等手段来提高系统的性能和稳定性。同时，我们还建立了监控和报警机制，及时发现并处理可能出现的性能瓶颈或异常。

3. 如果在优惠券分发过程中出现了超卖问题，你如何检测和修复这个问题？

   如果出现了超卖问题，我们会首先通过日志和监控数据定位问题的原因。然后，我们会根据具体情况采取回滚优惠券、补偿用户等措施来修复问题，并总结经验教训，完善系统的容错和恢复能力。

# 基础知识

**问题1（短信登录与Redis存储Session）：**

- 请简述Session在Web应用中的作用，以及为什么我们需要将其转移到Redis中？

  Session在Web应用中的作用：Session在Web应用中用于跟踪用户的会话状态，存储用户在网站上的活动信息，如登录状态、购物车内容等。通过Session，网站能够在用户的不同请求之间保持状态，提供个性化的服务。

  为什么将Session转移到Redis中：将Session转移到Redis中可以实现Session的共享和持久化。传统的Session存储在单个服务器的内存中，当服务器宕机或扩展时，Session数据容易丢失或不可访问。而Redis作为内存数据库，具有高性能和可靠性，可以实现Session的分布式存储和快速访问，支持水平扩展和容错。

- Redis的数据结构有哪些？并说明每种数据结构的适用场景。

  字符串（String）、哈希（Hash）、列表（List）、集合（Set）和有序集合（Sorted Set）。每种数据结构都有其特定的应用场景。例如，字符串可用于简单的键值存储；哈希可用于存储结构化数据；列表可用于实现队列或栈等数据结构；集合可用于存储不重复的元素；有序集合则支持元素的排序和范围查询。

- 你如何理解分布式会话，以及实现它需要注意哪些关键点？

**问题2（Thymeleaf与Minio文件上传）：**

- 能否解释一下Thymeleaf的工作原理，它与其他模板引擎相比有何优势？

  Thymeleaf是一个用于Web和独立环境的现代服务器端Java模板引擎。它允许在HTML中直接使用Thymeleaf属性来展示数据，支持HTML5、表达式语言、条件逻辑等功能。其优势在于与Spring框架的紧密集成，易于学习和使用，以及清晰的模板结构。

- Minio是一个怎样的存储服务？它与Amazon S3有何异同？

  Minio是一个高性能的对象存储服务器。Minio允许用户构建私有云或混合云解决方案。Minio易于部署和管理，适合在本地或私有环境中使用。

- 在文件上传过程中，你通常如何处理文件大小和上传速度的问题？

  采取分块上传、并行上传、压缩文件等方式。同时，需要考虑服务器的带宽和存储能力，以及客户端的网络状况，以确保上传过程的稳定性和效率。

**问题3（Kafka延时队列）：**

- Kafka的核心概念有哪些？它们是如何协同工作的？

  Kafka的核心概念：Kafka的核心概念包括Producer（生产者）、Broker（代理服务器）、Consumer（消费者）、Topic（主题）和Partition（分区）。Producer负责发送消息到Kafka；Broker负责存储和转发消息；Consumer从Kafka中消费消息；Topic是消息的类别；Partition是Topic的物理分区，用于实现消息的并行处理和存储。

- 请描述一下Kafka的延时队列是如何实现的，它适用于哪些场景？

  Kafka延时队列的实现及适用场景：Kafka通过其延时消息功能实现延时队列。生产者可以设置消息的延时时间，使消息在指定的时间后才会被消费者消费。这适用于需要实现定时任务、订单超时处理、消息重试等场景。

- 在处理Kafka消息时，如何确保消息的可靠性和一致性？

  确保消息的可靠性和一致性：为了确保消息的可靠性和一致性，Kafka采用了多种机制，如消息的持久化存储、消息的确认机制、消息的幂等性处理等。同时，可以通过设置消息的重复发送策略、消费者的容错处理等方式来进一步保障消息的可靠性。

**问题4（内容安全审查与图片文字识别）：**

- 内容安全审查通常涉及哪些方面的检查？

  内容安全审查通常涉及对文本、图片、视频等多媒体内容进行审查，以检测是否存在违规内容，如色情、暴力、恶意广告等。此外，还需要对内容的版权、政治敏感性等进行检查。

- 图片文字识别技术的基本原理是什么？目前有哪些主流的技术或工具？

  基本原理：通过图像处理技术将图片中的文字信息提取出来，并转换为可编辑的文本格式。目前主流的技术包括基于深度学习的OCR算法和传统的图像处理算法。常见的OCR工具包括Tesseract、百度OCR等。

- 在进行内容安全审查时，如何平衡审查的准确性和性能？

  在平衡内容安全审查的准确性和性能时，可以采用多种策略。例如，通过优化算法和模型来提高审查的准确性；通过分布式处理和缓存机制来提高审查的性能；同时，可以根据实际需求调整审查的严格程度，以达到准确性和性能的平衡。

**问题5（Maven依赖管理）：**

- Maven的核心功能有哪些？它是如何帮助我们管理Java项目的？

  Maven的核心功能包括项目构建、依赖管理和项目信息管理。它可以通过坐标系统精确地定位和管理项目的依赖关系，自动下载和更新依赖库，简化项目的构建和部署过程。

- 在使用Maven进行依赖管理时，如何处理依赖冲突的问题？

  首先，明确依赖的范围和版本，避免引入不必要的依赖；其次，使用Maven的依赖树功能查看项目的依赖关系，找出冲突的来源；最后，通过排除特定依赖或指定依赖的优先级来解决冲突。

- Maven的继承和聚合特性分别解决了什么问题？请举例说明。

  Maven的继承特性允许子项目继承父项目的配置和依赖，减少了重复配置的工作量。聚合特性则可以将多个子项目整合到一个父项目中，方便统一管理和构建。通过合理使用继承和聚合特性，可以简化Maven项目的组织结构，提高开发效率。

**问题6（服务订单管理）：**

- 在设计订单管理系统时，通常需要考虑哪些核心功能和模块？

  订单管理系统的核心功能包括订单创建、订单查询、订单修改、订单取消和订单统计等。对应的模块可以包括用户模块、商品模块、支付模块、物流模块等，这些模块共同协作以实现订单的全流程管理。

- 如何确保订单数据的完整性和一致性？

  可以通过数据库的事务管理、数据校验、日志记录等方式来实现。同时，在设计系统时，需要考虑到并发控制和数据一致性的问题，避免出现数据冲突或不一致的情况。

- 在处理大量订单数据时，你通常采取哪些优化措施来提高性能？

  在处理大量订单数据时，可以采用分页查询、索引优化、缓存机制等方式来提高性能。此外，还可以考虑使用分布式数据库或大数据处理技术来扩展系统的处理能力，应对高并发的场景。

**问题7（Redis优化与缓存策略）：**

- 请简述Redis在缓存场景中的优势以及常见使用方式。

  优势主要体现在高性能、低延迟、支持多种数据结构以及丰富的操作命令上。它可以将热点数据存储在内存中，快速响应客户端的请求，减轻数据库的压力。

- 什么是缓存穿透、缓存雪崩和缓存击穿？如何预防和处理这些问题？

  缓存穿透是指查询一个不存在的数据，由于缓存中也没有该数据，导致每次请求都要去数据库查询，造成数据库压力过大。可以通过布隆过滤器或缓存空对象等方式来预防。缓存雪崩是指大量缓存数据同时失效或过期，导致大量请求直接打到数据库上。可以通过设置缓存的过期时间分散一些、使用缓存预热和降级策略等方式来应对。缓存击穿是指热点数据缓存过期，此时大量并发请求会穿透缓存直接访问数据库。可以通过设置热点数据永不过期或使用互斥锁等方式来避免。

- 在设计缓存策略时，你通常如何权衡数据的实时性和缓存的命中率？

  如果数据实时性要求较高，可以设置较短的缓存过期时间或采用实时更新的策略；

  如果数据实时性要求不，可以设置较长的缓存过期时间或采用定时刷新的策略；

  同时，可以通过监控和分析缓存的命中率和性能数据来优化缓存策略。

**问题8（优惠券分发与防超卖策略）：**

- 在实现优惠券分发功能时，如何确保每个用户只能领取一次优惠券？

  可以在数据库中为每个用户设置一个优惠券领取状态字段，并在用户领取优惠券时更新该字段。同时，可以使用Redis的分布式锁或数据库的事务来保证操作的原子性，避免重复领取。

- 请解释超卖现象是如何发生的，以及如何通过技术手段来避免它？

  可以采用乐观锁或悲观锁来控制并发操作，确保同一时间只有一个线程能够修改库存数量。此外，还可以使用Redis的Lua脚本来原子地执行库存扣减和优惠券发放操作，避免超卖的发生。

- 在高并发场景下，你通常如何设计优惠券分发系统来保证其性能和稳定性？

  可以通过水平扩展服务器、使用高性能的数据库和缓存系统、优化代码和算法等方式来提高系统的处理能力。同时，需要建立监控和报警机制，及时发现和处理可能出现的性能瓶颈或异常。



# 面试问题



1. **ThreadLocal的用途和实现：**
   ThreadLocal主要用于保存线程私有数据，避免线程间的数据共享和竞争。它可以在多线程环境下为每个线程提供独立的变量副本，从而避免锁竞争带来的性能损耗。实现上，ThreadLocal内部使用了一个ThreadLocalMap来存储每个线程的变量副本。这个Map的键是线程对象，值是线程的变量副本。当线程访问ThreadLocal变量时，ThreadLocal会通过当前线程作为键从Map中获取对应的变量副本；如果Map中不存在该键，则创建一个新的变量副本并存储到Map中。
2. **MySQL索引的设置与优化：**
   MySQL索引的设置和优化是提高数据库查询性能的重要手段。在设置索引时，需要根据查询的条件和顺序选择合适的索引类型和列。例如，对于经常用于查询条件的列，可以创建单列索引或联合索引；对于需要覆盖查询结果的列，可以选择合适的覆盖索引。在优化索引时，可以通过分析查询语句、避免全表扫描、定期维护索引等方式来提高查询效率。
3. **Spring AOP原理：**
   Spring AOP的原理主要基于动态代理和切面编程。动态代理是指在运行时动态地为目标对象创建代理对象，从而在不修改目标对象代码的情况下增强其功能。切面编程则是将跨多个类的通用逻辑（如日志记录、事务管理等）封装成切面，并将其织入到目标对象的执行流程中。Spring AOP通过代理类和切面类来实现这一功能，代理类负责拦截目标对象的方法调用，并根据切面类中的定义执行相应的逻辑。
4. **Spring动态代理的应用场景：**
   Spring动态代理主要应用于需要为已有对象提供额外功能而又不修改其代码的场景。例如，我们可以在不修改业务逻辑代码的情况下为其添加日志记录、性能监控或事务管理等功能。通过Spring动态代理，我们可以灵活地扩展和增强已有对象的功能，提高代码的可维护性和可扩展性。
5. **MyBatis的一级缓存和二级缓存：**
   MyBatis的一级缓存是SqlSession级别的缓存，它默认开启并自动管理。一级缓存用于存储同一个SqlSession中执行的相同SQL语句的结果集。当再次执行相同的SQL语句时，MyBatis会先从一级缓存中查找结果，如果找到则直接返回缓存结果，避免了重复查询数据库。二级缓存是Mapper级别的缓存，它可以被多个SqlSession共享。二级缓存用于存储跨SqlSession的相同SQL语句的结果集。通过合理配置和使用一、二级缓存，可以有效地提高MyBatis的查询性能。
6. **MyBatis的执行过程：**
   MyBatis的执行过程大致如下：首先，MyBatis会根据配置文件和映射文件初始化SqlSessionFactory；然后，通过SqlSessionFactory创建SqlSession对象；接着，SqlSession根据Mapper接口或XML映射文件生成Mapper代理对象；当调用Mapper代理对象的方法时，MyBatis会根据方法名和参数生成SQL语句并执行；最后，MyBatis将执行结果映射成Java对象并返回给调用者。
7. **Redis缓存穿透：**
   Redis缓存穿透是指查询一个不存在的数据，由于缓存中也没有该数据，导致每次请求都要去数据库中查询，从而给数据库带来压力。解决这个问题的方法之一是使用布隆过滤器来过滤掉不存在的请求，或者在缓存中存储一个空对象或特殊标记来表示该数据不存在。
8. **高频数据的存储：**
   高频数据的存储需要考虑数据的实时性、并发性和持久化需求。常见的存储方案包括使用内存数据库（如Redis）来存储实时数据，通过负载均衡和分片技术来提高并发性能，同时定期将数据持久化到磁盘或分布式存储系统中以保证数据的可靠性。
9. **Redis和数据库的一致性问题：**
   Redis和数据库的一致性问题主要发生在数据更新时。由于Redis是内存数据库，其数据更新速度通常比数据库快，因此可能导致Redis中的数据与数据库中的数据不一致。解决这个问题的方法之一是使用双写策略，即在更新数据库的同时也更新Redis；或者使用延时双删策略，即在删除数据库数据前先删除Redis中的数据，并在一定时间后再次删除Redis中的数据以防止脏读。此外，还可以使用分布式锁或事务来保证数据的一致性。
10. **Redis宕机数据丢失问题：**
    Redis宕机时，如果未采取持久化措施，内存中的数据将会丢失。为了解决这个问题，Redis提供了两种持久化方式：RDB（快照）和AOF（追加文件）。RDB通过定期将内存中的数据生成快照并保存到磁盘上来实现持久化，而AOF则通过记录每次写操作到日志文件中来实现数据的持久化。在实际应用中，可以根据业务需求选择适合的持久化方式，并配置合理的持久化策略，以确保数据的可靠性。
11. **JVM垃圾回收算法：**
    JVM中的垃圾回收算法主要包括标记-清除、标记-整理、复制和分代收集等。标记-清除算法通过标记出不再使用的对象并清除它们来回收内存空间；标记-整理算法在标记的基础上对存活对象进行整理，以便消除内存碎片；复制算法将可用内存划分为两个大小相等的区域，每次只使用其中一个区域，当该区域内存用完时，将存活对象复制到另一个区域并清空当前区域；分代收集算法则根据对象的生命周期将内存划分为不同的代，并针对不同的代采用不同的回收策略。
12. **OOM（OutOfMemoryError）问题的排查：**
    当JVM出现OOM错误时，通常是因为堆内存不足。排查OOM问题可以从以下几个方面入手：首先，检查堆内存设置是否合理，是否需要根据应用需求调整堆内存大小；其次，分析堆内存中的对象占用情况，找出占用内存较大的对象；然后，根据对象类型和来源分析是否存在内存泄漏或对象生命周期过长的问题；最后，优化代码和配置，减少不必要的对象创建和内存占用。
13. **JVM分区：**
    JVM的内存分区主要包括堆、栈、方法区、程序计数器和本地方法栈等。堆用于存储对象实例，是垃圾回收的主要区域；栈用于存储基本数据类型和对象引用，每个线程都有一个私有的栈；方法区用于存储已被虚拟机加载的类信息、常量、静态变量等；程序计数器用于记录当前线程执行的字节码位置；本地方法栈则为虚拟机执行本地方法提供服务。
14. **Linux命令杀死线程：**
    在Linux中，线程是进程的一部分，因此没有直接杀死线程的命令。要杀死一个线程，实际上是杀死包含该线程的整个进程。可以使用`kill`命令来发送信号给进程，从而终止它。例如，使用`kill -9 <进程ID>`可以发送SIGKILL信号强制终止进程。要获取进程ID，可以使用`ps`命令结合其他选项来查找。
15. **一次IO操作的内核与用户态切换次数：**
    一次完整的IO操作通常涉及多次内核态与用户态之间的切换。以读取文件为例，大致过程如下：首先，用户态程序发起读文件请求，进入内核态；内核态处理请求，将数据从磁盘读入内核缓冲区；然后，内核将数据从内核缓冲区拷贝到用户态缓冲区，并切换回用户态；最后，用户态程序处理数据。在这个过程中，至少发生了两次用户态与内核态之间的切换。
16. **线程池的创建：**
    在Java中，可以使用`java.util.concurrent.Executors`类提供的静态方法来创建线程池。例如，`Executors.newFixedThreadPool(int nThreads)`方法用于创建一个固定大小的线程池；`Executors.newCachedThreadPool()`方法用于创建一个可缓存的线程池，能根据需要创建新线程，并在空闲时回收线程；`Executors.newSingleThreadExecutor()`方法则用于创建一个单线程的线程池，确保所有任务按提交顺序依次执行。此外，也可以直接使用`ThreadPoolExecutor`类来创建线程池，并设置更详细的参数。
17. **参数：**
    由于您没有具体指出是哪个方面的参数，我无法给出具体的回答。参数通常用于配置和控制程序或系统的行为。在不同的上下文中，参数可能包括命令行参数、配置文件中的设置、系统属性、环境变量等。如果您能提供更具体的上下文或需求，我将能够给出更准确的回答。







### session、cookie和cache的区别是什么

在Web应用程序中，session、cookie和cache是常用的存储数据的方式，它们在功能和用途上有所不同，其区别如下： 

Session Session是服务器端存储数据的一种方式，它通过在服务器上存储一个唯一的标识符（Session ID）来跟踪用户的会话状态。

Session可以存储任何类型的数据，例如用户登录状态、购物车内容等。 Session的优点是数据的安全性高，不容易被恶意篡改和伪造，同时可以保存较大量的数据。缺点是需要在服务器上进行存储和管理，会占用服务器的资源，需要开发人员进行维护。 



Cookie Cookie是一种在客户端存储数据的方式，它通过在用户的浏览器上存储一个小型的文本文件来保存数据。

Cookie可以存储一些临时的用户数据，例如用户的偏好设置、购物车内容等。 优点是存储数据的速度快，不需要在服务器上进行存储和管理，缺点是数据容易被篡改和伪造，同时每个浏览器对于Cookie的数量和大小都有限制。 Cache Cache是一种缓存数据的方式，它可以将频繁访问的数据存储在内存中，以提高访问速度。Cache可以存储一些不经常更新的数据，例如静态文件、数据库查询结果等。 

Cache的优点是访问速度快，可以大大减少对数据库和其他数据源的访问次数，缺点是需要开发人员进行维护，以避免缓存数据的过期和失效。同时，缓存数据的大小也需要控制，避免占用过多的内存资源。 总的来说，Session、Cookie和Cache在功能和用途上有所不同，可以根据实际需要选择合适的存储方式。





### session怎么提高效率？

Session持久化：将session信息存储在持久化存储中，如数据库、文件系统或NoSQL存储中，这样可以避免将所有session信息存储在内存中，从而减少内存的使用量。

 Session复制：将session信息从一台服务器复制到另一台服务器上，这样可以实现负载均衡，并将会话信息在多个服务器之间共享。 

Session失效策略：设置合理的session失效策略，例如根据用户活动时间、最大不活动时间等来决定session的失效时间，可以减少无用的session信息。

 集群：使用集群环境来分散请求和负载，这样可以使应用程序在多个服务器上运行，从而提高应用程序的性能和可扩展性。

 总之，为了提高会话管理的效率，需要使用合理的持久化和集群技术，并设置合理的会话失效策略，以避免会话信息的无限增长。

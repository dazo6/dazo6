---
title: 薅资本主义羊毛：如何用TeamViewer进行mc联机
date: 2018-10-10 02:18:15
categories: ["minecraft"]
tags: [minecraft-tutorial]
---

### **前言**

前段时间和小伙伴联机的时候因为两个人都没有独立ip，研究了挺久，找到了这个方法。

**不知道啥是独立ip的也没有关系，都可以用这个方法。**

适用于最多4个人的小伙伴开黑的联机。 

废话少说教程开始~

---

### **步骤一**

前往 TeamViewer 官网（**https://www.teamviewer.com/zhcn**）选择免费版下载安装包。

安装时选择 **个人/非商务用途** 

然后勾选 **显示高级设置** **（重要）**

点击 **接受 - 下一步** 按钮

安装完成后需要登陆一个TeamViewer 账号 按照流程拿邮箱注册一个就好了~

<img width="600" class="article-image" src="teamviewertutorial\image1.png" alt="步骤一图一" title="步骤一图一"/>

---

### **步骤二**

在这个界面勾选 **TeamViewer VPN（重要）**

剩下的如果有需要可以勾选，在mc联机中用不上。

点击完成 TeamViewer 就安装好了。

**以上两个步骤是 你和你的小伙伴都需要的**

<img width="600" class="article-image" src="teamviewertutorial\image2.png" alt="步骤二图一" title="步骤二图一"/>

---

### **步骤三**

这一步骤是开服的小伙伴需要做的：

打开 **控制面板 -> 系统和安全 -> Windows Defender 防火墙 -> 允许的应用**

看到这个界面 先点 **更改设置**

再在下面的允许的应用和功能中，找到所有的**Java**开头的和所有**TeamViewer**开头的程序，把后面的专用和公用的框框都勾起来

<img width="600" class="article-image" src="teamviewertutorial\image3.png" alt="步骤三图一" title="步骤三图一"/>

---

### **步骤四**

这一步依旧是开服的小伙伴需要做的：

进入你的世界 按下ESC 选择 对**局域网开放** 按钮 开放选项根据自己设置 设置完后点击 **创建一个局域网世界** 就好了 。

之后你的聊天栏会出现一个 ：“本地游戏已在端口XXXXX上开启”

把这个 **端口号** 和 **TeamViewer的ID和密码（图四中的打码部分）**发给你的小伙伴 你的任务就结束了~ 等着你的小伙伴进来吧。

<img width="600" class="article-image" src="teamviewertutorial\image4.png" alt="步骤四图一" title="步骤四图一"/>
<img width="600" class="article-image" src="teamviewertutorial\image5.png" alt="步骤四图二" title="步骤四图二"/>
<img width="600" class="article-image" src="teamviewertutorial\image6.png" alt="步骤四图三" title="步骤四图三"/>
<img width="600" class="article-image" src="teamviewertutorial\image7.png" alt="步骤四图四" title="步骤四图四"/>

---

**步骤五**

这一步是要加入别人的世界的小伙伴要做的。

打开你的 TeamViewer 在控制远程计算机下面填入伙伴的ID **连接方式选择VPN（重要）**

点击连接按钮 之后会提示输入密码 输入小伙伴提供的密码看到图二所示的界面就连接成功啦~

<img width="600" class="article-image" src="teamviewertutorial\image7.png" alt="步骤五图一" title="步骤五图一"/>
<img width="600" class="article-image" src="teamviewertutorial\image8.png" alt="步骤五图二" title="步骤五图二"/>

---

## **步骤六**

这一步是要加入别人的世界的小伙伴要做的。

在步骤五做完后的连接成功界面（步骤五最后一张图）找到 **伙伴的IP** 。

打开你的mc 点击多人游戏 选择下面的直接连接在 服务器地址处 输入：**伙伴的IP:伙伴的端口** 

中间的冒号一定要是英文冒号 分不清楚的建议在这里直接复制。

然后点击加入服务器就可以进入别人的服务器了~

---

### **一些注意事项：**

- 千万不要把连接的ID和密码给不熟悉的人。
- 连接完了后记得关掉TeamViewver。
- 这个方法同样适用于使用服务端开服的玩家。
- 如果开服人是forge端的话，进入服务器的人必须要有服务器有的所有mod。
- 本文允许规范转载 注意署名就好了。
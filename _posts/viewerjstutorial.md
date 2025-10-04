---
title: 为你的Hexo博客添加图片查看器
date: 2018-10-11 19:07:44
categories: [归档, 博客, 前端]
tags: [viewerjs, javascript]
---

## **前言**

我写完上一篇关于如何使用teamviewer进行mc联机的时候，审视我的文章的时候想看大图的时候发现我并不能点击图片打开进行放大之类的（之前不知道这个主题没有集成）

所以希望可以有这样的一个js插件：

- 可以放大缩小
- 有较好看的动画效果
- 可以进行图片切换
- 可配置性强

最后我找到的是一个非常强大的js的图片查看的插件：[viewerjs](https://fengyuanchen.github.io/viewerjs)

它几乎满足了我的需求，由于我没有任何的前端基础下面的操作最多作为一个参考，这些使用方法也是自己随意摸索的，见笑了。

下面是一些示例：



<a style="float:left;"> <img class="1" src="viewerjstutorial\image1.png" alt="示例图片1" title="示例图片1" width = 111 border=0  />

 <img class="2" src="viewerjstutorial\image2.png" alt="示例图片2" title="示例图片2" width=111 border=0  /></a> 



## **库类准备**

通过官方的Readme的Getting Start可以知道我我们需要先安装viewerjs

在hexo所在的目录下运行这个命令

```
npm install viewerjs
```

在十几秒安装好后你的库类就已经准备好了



## 库类导入

通过阅读官方的readme可以知道我们需要导入的分别是：

```html
<link  href="/path/to/viewer.min.css" rel="stylesheet">
<script src="/path/to/viewer.min.js"></script>
```

这是官方的示例导入，但是在hexo的情况下不能这样直接导入。

我用的方法是通过嵌入网站的导入方式。

首先你需要打开npm的安装目录(\node_modules\viewerjs\dist)找到viewer.min.css， viewer.min.js这两个文件，

将这两个文件分别复制到你的主题的相应的js和css文件夹中。

比如我的主题是：[replica](https://github.com/sabrinaluo/hexo-theme-replica) 我需要分别把这两个文件放到以下两个文件夹中

`...\themes\replica\source\js`

`...\themes\replica\source\css`

我对这个插件就只有在文章页面中有需求 所以我在我的文章layout文件：\themes\replica\layout\archive.ejs

的最后添加以下代码 ：

```html
<!-- 图片查看器库类 -->
<link  href="<%= config.root %>css/viewer.min.css" rel="stylesheet">
<script src="<%= config.root %>js/viewer.min.js" type="text/javascript" charset="utf-8"></script>
```



## 配置viewerjs

官方的说明的使用方法是 :

`var viewer = new Viewer(HtmlElement, options);`

其中传入的元素可以是一个 img 元素 或者是一个 ul 元素，如果是img元素的话， 如果传入的是img元素点击传入的图片就可以打开图片查看器。如果是 ul 的话可以将ul中的所有图片作为一个图片列表进行上下的切换。

但是在markdown中编写的图片几乎是零散的图片，没法通过只传入一个元素的形式达到我们的需求

通过一些控制台输出发现我们主要需要设置的是实例viewer中的images属性和length属性

所以我们需要进行如下配置， 以下代码放在上面库类导入的代码后面：

```javascript
<!-- 图片查看器实例配置 -->
<script type="text/javascript">
  //默认设置
  Viewer.setDefaults({
      zoomRatio : [0.5],
      //设置初始缩放
      show: function () {
        this.viewer.zoomTo(0.5);
      },
    });
  //获得content中所有的图片 不同的主题图片所在的路径不同 建议自己设置
  var article = document.querySelector('.post-content');
  var imageList = article.getElementsByTagName('img');
  //将获取到的HTMLCollections转化成Array
  var imageArray = new Array();
  Array.prototype.forEach.call(imageList, element => {
    if (element.alt != "N" && element.className != "N") {
      imageArray.push(element);
    }
  });
  //设置每个图片成为图片组
  Array.prototype.forEach.call(imageArray, element => {
    var viewer1 = new Viewer(element);
    viewer1.images = imageArray;
    viewer1.length = imageArray.length;
  });
</script>
```
默认是把所有的img tag的图片都作为图片查看器的实例 可以用这样的默认方式

`![titile](image.png)`

或者是用img tag设置图片属性：

`<img src="image.png" alt="alt" title="title"/>`

如果不希望一个图片出现在图片查看器中，可以设置tag中的class属性为"N":
`<img class="N" src="image.png" alt="alt" title="title"/>`
或者是在输入图片的时候设置alt为"N":
`![N](image.png)`

我个人也推荐采用这个方式插图这样可以利用一些标签的属性对图片的大小显示效果进行控制。

不同的主题格式的网页结构不用，元素的获得方式也有一些不用，具体和自己主题的适配建议自己在网页中调试一下，看看文章图片都在哪个标签下面。



## 后记

由于在此之前我对html标签和js的语法可以说是完全不了解，也没有相应的开发经验所以这个教程最多作为参考而有不明智的处理也请见谅，有错误的地方也可以私信我邮箱。

<!---->

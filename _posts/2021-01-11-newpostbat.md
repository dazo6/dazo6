---
title: 给无环境的Hexo博客做一个新建文章的脚本
date: 2021-01-11 20:43:36
categories: [] 
tags: []
---
<h2 hidden style="display: none;">
````
这是注释不会显示出来的
---------
图片需要使用相对路径进行显示
---------
# 这是一级标题
## 这是二级标题
### 这是三级标题
#### 这是四级标题
##### 这是五级标题
###### 这是六级标题
**加粗**
*斜体*
***斜体加粗***
~删除线~
 引用可以嵌套引用
---分割线
![图片alt](图片地址 "图片title")
[超链接名](超链接地址 "超链接title")
- 无序列表内容
1. 有序列表内容
表头|表头|表头
---|:--:|---:
内容|内容|内容
内容|内容|内容
`单行代码`
``` 
多行代码
```
markdown使用提示结束
````
</h2>
## **前言**
因为我电脑C盘空间太小了，就删掉了nodejs环境，但是删掉了之后才想起来我的blog需要nodejs的hexo脚本新建文章，没有了nodejs之后一直懒得写了。
直到有一天，我知道了原来手动新建就可以了，再加上终于去搞定了Travis CI的自动化构建，于是乎写了一个脚本来帮助我生成空白文章。

脚本全文如下：
`````shell
echo off
chcp 65001
set /p fileName=请输入要新建的文章文件名字:
set /p postName=请输入要新建的文章名字:
:: Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
   IF "%%~L"=="" goto s_done
      Set _yyyy=%%L
      Set _mm=00%%J
      Set _dd=00%%G
      Set _hour=00%%H
      SET _minute=00%%I
      SET _second=00%%K
)
:s_done

:: Pad digits with leading zeros
      Set _mm=%_mm:~-2%
      Set _dd=%_dd:~-2%
      Set _hour=%_hour:~-2%
      Set _minute=%_minute:~-2%
      Set _second=%_second:~-2%

Set logtimestamp=%_yyyy%-%_mm%-%_dd% %_hour%:%_minute%:%_second%
cd "%~dp0source\_posts\"
md "%fileName%"
type nul>"%fileName%.md"
echo --->"%fileName%.md"
echo title: %postName%>>"%fileName%.md"
echo date: %logtimestamp%>>"%fileName%.md"
echo categories: [] >>"%fileName%.md"
echo tags: []>>"%fileName%.md"
echo --->>"%fileName%.md"

echo   ^<h2 hidden style="display: none;"^>>>"%fileName%.md"
echo   ````>>"%fileName%.md"
echo   这是注释不会显示出来的>>"%fileName%.md"
echo   --------->>"%fileName%.md"
echo   图片需要使用相对路径进行显示>>"%fileName%.md"
echo   --------->>"%fileName%.md"
echo   # 这是一级标题>>"%fileName%.md"
echo   ## 这是二级标题>>"%fileName%.md"
echo   ### 这是三级标题>>"%fileName%.md"
echo   #### 这是四级标题>>"%fileName%.md"
echo   ##### 这是五级标题>>"%fileName%.md"
echo   ###### 这是六级标题>>"%fileName%.md"
echo   **加粗**>>"%fileName%.md"
echo   *斜体*>>"%fileName%.md"
echo   ***斜体加粗***>>"%fileName%.md"
echo   ~删除线~>>"%fileName%.md"
echo   >这是引用的内容 引用可以嵌套引用>>"%fileName%.md"
echo   ---分割线>>"%fileName%.md"
echo   ![图片alt](图片地址 "图片title")>>"%fileName%.md"
echo   [超链接名](超链接地址 "超链接title")>>"%fileName%.md"
echo   - 无序列表内容>>"%fileName%.md"
echo   1. 有序列表内容>>"%fileName%.md"
echo   表头^|表头^|表头>>"%fileName%.md"
echo   ---^|:--:^|---:>>"%fileName%.md"
echo   内容^|内容^|内容>>"%fileName%.md"
echo   内容^|内容^|内容>>"%fileName%.md"
echo   `单行代码`>>"%fileName%.md"
echo   ``` >>"%fileName%.md"
echo   多行代码>>"%fileName%.md"
echo   ```>>"%fileName%.md"
echo   注释结束>>"%fileName%.md"
echo   ````>>"%fileName%.md"
echo   ^</h2^>>>"%fileName%.md"
chcp 936
start /I %fileName%.md

`````
首先 先关掉echo输出。
`echo off`
再切换成`utf-8`模式，因为我是Windows 默认是`GBK`
`chcp 65001`
事后不要忘记调回`GBK`虽然我也不知道不调回来会不会影响到其他的cmd脚本。
`chcp 936`
再向用户获得希望生成的文件名字和文章标题标题之后会放在hexo的头文件中。
```
set /p fileName=请输入要新建的文章文件名字:
set /p postName=请输入要新建的文章名字:
```
在用脚本生成 `yyyy-MM-dd hh:mm:ss`格式的日期
```
:: Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
   IF "%%~L"=="" goto s_done
      Set _yyyy=%%L
      Set _mm=00%%J
      Set _dd=00%%G
      Set _hour=00%%H
      SET _minute=00%%I
      SET _second=00%%K
)
:s_done

:: Pad digits with leading zeros
      Set _mm=%_mm:~-2%
      Set _dd=%_dd:~-2%
      Set _hour=%_hour:~-2%
      Set _minute=%_minute:~-2%
      Set _second=%_second:~-2%

Set logtimestamp=%_yyyy%-%_mm%-%_dd% %_hour%:%_minute%:%_second%
```
然后就是创建文件并逐行输入需要的注释和头信息就行了
其中Windows在cmd环境下用的转义符是`^`别的系统可能要适当修改。
```
type nul>"%fileName%.md"
echo --->"%fileName%.md"
echo title: %postName%>>"%fileName%.md"
echo date: %logtimestamp%>>"%fileName%.md"
echo categories: [] >>"%fileName%.md"
echo tags: []>>"%fileName%.md"
echo --->>"%fileName%.md"

echo   ^<h2 hidden style="display: none;"^>>>"%fileName%.md"
echo   ````>>"%fileName%.md"
echo   这是注释不会显示出来的>>"%fileName%.md"
echo   --------->>"%fileName%.md"
echo   图片需要使用相对路径进行显示>>"%fileName%.md"
echo   --------->>"%fileName%.md"
echo   # 这是一级标题>>"%fileName%.md"
echo   ## 这是二级标题>>"%fileName%.md"
echo   ### 这是三级标题>>"%fileName%.md"
echo   #### 这是四级标题>>"%fileName%.md"
echo   ##### 这是五级标题>>"%fileName%.md"
echo   ###### 这是六级标题>>"%fileName%.md"
echo   **加粗**>>"%fileName%.md"
echo   *斜体*>>"%fileName%.md"
echo   ***斜体加粗***>>"%fileName%.md"
echo   ~删除线~>>"%fileName%.md"
echo   >这是引用的内容 引用可以嵌套引用>>"%fileName%.md"
echo   ---分割线>>"%fileName%.md"
echo   ![图片alt](图片地址 "图片title")>>"%fileName%.md"
echo   [超链接名](超链接地址 "超链接title")>>"%fileName%.md"
echo   - 无序列表内容>>"%fileName%.md"
echo   1. 有序列表内容>>"%fileName%.md"
echo   表头^|表头^|表头>>"%fileName%.md"
echo   ---^|:--:^|---:>>"%fileName%.md"
echo   内容^|内容^|内容>>"%fileName%.md"
echo   内容^|内容^|内容>>"%fileName%.md"
echo   `单行代码`>>"%fileName%.md"
echo   ``` >>"%fileName%.md"
echo   多行代码>>"%fileName%.md"
echo   ```>>"%fileName%.md"
echo   注释结束>>"%fileName%.md"
echo   ````>>"%fileName%.md"
echo   ^</h2^>>>"%fileName%.md"
```

还有一个需要注意的就是有些博客在首页有博客内容浏览的功能，记得改模板，用查找的方式跳过注释输出内容。
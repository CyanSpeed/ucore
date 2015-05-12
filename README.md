# ucore lab

uCore OS Labs 原本是用于清华大学计算机系本科操作系统课程的教学试验内容。

我们学校的《操作系统基础》课程借用了这套实验。

#实验内容

实验题目

1.lab0 ：熟悉实验环境

2.lab1 ：启动操作系统

3.lab2 ：物理内存管理

4.lab3 ：虚拟内存管理

5.lab4 ：内核线程

6.lab5 ：用户进程

7.lab6 ：处理器调度

8.lab7 ：同步互斥

9.lab8 ：文件系统

#实验环境
ucore OS实验主要在Linux环境下开发，也可以在Windows上通过虚拟机上开发。


#实验中的练习步骤
以VirtualBox为例，进入VirtualBox中运行的ubuntu，点击左侧的gnome-terminal软件图标，可启动gnome-terminal 软件。在此软件中，执行如下命令：

1) 目前环境中已经有ucore lab源码，可进一步取得最新ucore lab源码
  $cd  moocos/ucore_lab  #到ucore lab所在目录
  $git pull   #取得最新的ucore lab源代码
  $cd


2) 学习源码
  $cd labX  #X为 1--8


3) 阅读，修改源码，可以用eclipse-cdt, understand, gedit或vim软件
  $eclipse
OR
  $understand


4) 修改完毕后，编译实验代码
  $make


5) 如果编译无误，则可以运行测试一下
  $make qemu


6) 如果需要调试，

a. 可基于cgdb的字符方式(以lab1_ans为例)
  $cd labcodes_answer/lab1_ans
  $make debug


可以看到弹出两个窗口，一个是qemu,一个是cgdb 可以看到在bootloader的bootmain函数处停了下来。 然后我们就可以进一步在cgdb中用gdb的命令进行调试了
 (gdb)file bin/kernel   #加载ucore kernel的符号信息
 (gdb)break kern_init   #在函数kern_init处（即 0x100000地址处）设置断点
 (gdb)continue          #继续执行


这时就可以看到在kern_init处停了下来，可进一步调试。

b. 基于eclipse-CDT的debug view进行调试，如果安装了zylin debug插件，则完成初步配置后， 也可很方便地进行调试。

7) 可以运行如下命令，看看自己的得分
  $make grade

#UCORERS (代码贡献者)
茅俊杰、陈宇恒、刘聪、杨扬、渠准、任胜伟、朱文雷、 曹正、沈彤、陈旭、蓝昶、方宇剑、韩文涛、张凯成、 S郭晓林、薛天凡、胡刚、刘超、粟裕、袁昕颢... 欢迎加入我们的OS兴趣小组，共同进步！


#版权信息
ucore OS起源于MIT CSAIL PDOS课题组开发的xv6&jos、哈佛大学开发的 OS161教学操作系统、以及Linux-2.4内核。

ucore OS中包含的xv6&jos代码版权属于Frans Kaashoek, Robert Morris, and Russ Cox，使用MIT License。ucore OS中包含的OS/161代码版权属于 David A. Holland。包含的ostep练习的版权属于Remzi H. Arpaci-Dusseau and Andrea C. Arpaci-Dusseau。其他内部开发的ucore OS和相关练习的代码版权属于 陈渝、王乃铮、向勇，并采用GPL License. ucore OS相关的文档版权属于 陈渝、向勇，并采用 Creative Commons Attribution/Share-Alike (CC-BY-SA) License. 

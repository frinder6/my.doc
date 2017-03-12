## 第四章 虚拟机性能监控与故障处理工具 ##

JDK命令行工具
-

jps
-

	JVM Process Status Tool，显示指定系统内所有的HotSpot虚拟机进程

- `-q`
	- 只输出LVMID，省略主类名
- `-m`
	- 输出虚拟机进程启动时传递给主类main()函数的参数
- `-l`
	- 输出主类的全名，如果进程执行的是Jar包，输出Jar的路径
- `-v`
	- 输出虚拟机进程启动时JVM的参数


jstat
-

	JVM Statistics Monitoring Tool，用于收集HotSpot虚拟机各方面的运行数据

![](http://i.imgur.com/gaOQJVX.jpg)


>jinfo

	Configuration Info for Java，显示虚拟机配置信息

>jmap

	Memory Map for Java，生成虚拟机的内存转储快照（heapdump文件）

>jhat

	JVM Heap Dump Browser，用于分析heapdump文件，它会建立一个HTTP/HTML服务器，让用户在浏览器中查看分析结果

>jstack

	Stack Trace for Java，显示虚拟机的线程快照



图形界面工具：
1. jconsole
2. jvisualvm
	1. 基于插件的工具
	2. 插件下载地址：[https://visualvm.java.net/pluginscenters.html](https://visualvm.java.net/pluginscenters.html)


## 第五章 调优案例分析与实践 ##

高性能硬件上部署程序的两种方式：
-
1. 通过64位JDK来使用大内存
2. 使用若干个32位虚拟机建立逻辑集群来利用硬件资源
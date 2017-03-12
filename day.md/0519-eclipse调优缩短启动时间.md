初始配置：
-
	-startup
	plugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar
	--launcher.library
	plugins/org.eclipse.equinox.launcher.win32.win32.x86_64_1.1.200.v20150204-1316
	-product
	org.eclipse.epp.package.jee.product
	-showsplash
	org.eclipse.platform
	-vmargs
	-Dosgi.requiredJavaVersion=1.6
	-Xms40m
	-Xmx512m


优化之前通过Java VisualVM监控的启动参数，主要：
-

- 发生了4次 FullGC
- 发生了14次 MinorGC

>这是我们优化的重点，主要是将 FullGC降到0，减少 MinorGC的次数


第一步：
-
在 eclipse.ini中添加如下参数，将 GC日志输出到文件：

	-XX:+PrintGCTimeStamps
	-XX:+PrintGCDetails
	-Xloggc:gc.log


gc.log中的内容：

	0.681: [GC (Allocation Failure) [PSYoungGen: 10240K->1528K(11776K)] 10240K->2429K(39424K), 0.0083283 secs] [Times: user=0.00 sys=0.00, real=0.01 secs] 
	0.987: [GC (Allocation Failure) [PSYoungGen: 11768K->1528K(22016K)] 12669K->5986K(49664K), 0.0109152 secs] [Times: user=0.06 sys=0.00, real=0.01 secs] 
	1.204: [GC (Allocation Failure) [PSYoungGen: 22008K->1528K(22016K)] 26466K->14565K(49664K), 0.0291480 secs] [Times: user=0.09 sys=0.02, real=0.03 secs] 
	1.313: [GC (Allocation Failure) [PSYoungGen: 22008K->1504K(42496K)] 35045K->23357K(70144K), 0.0263866 secs] [Times: user=0.13 sys=0.00, real=0.03 secs] 

	1.339: [Full GC (Ergonomics) [PSYoungGen: 1504K->0K(42496K)] [ParOldGen: 21853K->21409K(49664K)] 23357K->21409K(92160K), [Metaspace: 6760K->6760K(1056768K)], 0.1901100 secs] [Times: user=0.64 sys=0.00, real=0.19 secs] 
	2.702: [GC (Allocation Failure) [PSYoungGen: 40960K->1509K(42496K)] 62369K->28244K(92160K), 0.0098152 secs] [Times: user=0.05 sys=0.01, real=0.01 secs] 
	3.485: [GC (Metadata GC Threshold) [PSYoungGen: 21650K->9716K(67584K)] 48385K->36459K(117248K), 0.0162970 secs] [Times: user=0.06 sys=0.00, real=0.02 secs] 

	3.502: [Full GC (Metadata GC Threshold) [PSYoungGen: 9716K->0K(67584K)] [ParOldGen: 26742K->31170K(68608K)] 36459K->31170K(136192K), [Metaspace: 19718K->19718K(1069056K)], 0.1742468 secs] [Times: user=0.48 sys=0.00, real=0.17 secs] 
	6.650: [GC (Allocation Failure) [PSYoungGen: 55296K->13299K(68608K)] 86466K->48886K(137216K), 0.0309857 secs] [Times: user=0.08 sys=0.01, real=0.03 secs] 
	6.990: [GC (Metadata GC Threshold) [PSYoungGen: 33294K->12934K(91136K)] 68881K->48529K(159744K), 0.0413872 secs] [Times: user=0.09 sys=0.01, real=0.04 secs] 

	7.032: [Full GC (Metadata GC Threshold) [PSYoungGen: 12934K->0K(91136K)] [ParOldGen: 35595K->40112K(87040K)] 48529K->40112K(178176K), [Metaspace: 32473K->32473K(1079296K)], 0.4352191 secs] [Times: user=1.25 sys=0.16, real=0.44 secs] 
	9.942: [GC (Allocation Failure) [PSYoungGen: 73216K->18418K(91648K)] 113328K->59604K(178688K), 0.0228894 secs] [Times: user=0.08 sys=0.00, real=0.02 secs] 
	12.391: [GC (Metadata GC Threshold) [PSYoungGen: 88358K->21486K(103424K)] 129544K->71185K(190464K), 0.0337033 secs] [Times: user=0.09 sys=0.03, real=0.03 secs] 

	12.425: [Full GC (Metadata GC Threshold) [PSYoungGen: 21486K->0K(103424K)] [ParOldGen: 49698K->68256K(131584K)] 71185K->68256K(235008K), [Metaspace: 52853K->52844K(1099776K)], 0.2803747 secs] [Times: user=0.83 sys=0.00, real=0.28 secs] 
	15.204: [GC (Allocation Failure) [PSYoungGen: 81920K->13244K(109568K)] 150176K->81508K(241152K), 0.0245405 secs] [Times: user=0.09 sys=0.00, real=0.02 secs] 


- 注意：4个 FullGC的 ParOldGen部分：
	
		[ParOldGen: 21853K->21409K(49664K)]
		[ParOldGen: 26742K->31170K(68608K)]
		[ParOldGen: 35595K->40112K(87040K)]
		[ParOldGen: 49698K->68256K(131584K)]


- 结论：**FullGC发生的节点都是老年代容量不足扩展导致的！**

> 而 eclipse.ini中的 Heap配置如下：

		-Xms40m
		-Xmx512m


第二步：
-

> 修改配置，扩大老年代容量（PC内存8G），如下：

		-Xms1024m
		-Xmx1024m
		-Xmn256m
		-XX:PermSize=256m
		-XX:MaxPermSize=256m


- 将年轻代固定为 128m，即 -Xmn128m；则老年代也固定下来了
- 将永久代固定为 96m（<java8）
- java8 不再有 Perm的概念，则需要配置 `-XX:MetaspaceSize=256m`


> 重启 eclipse，日志如下：

	4.416: [GC (Allocation Failure) [PSYoungGen: 196608K->32758K(229376K)] 196608K->47446K(1015808K), 0.0670608 secs] [Times: user=0.14 sys=0.09, real=0.07 secs] 
	10.804: [GC (Allocation Failure) [PSYoungGen: 229366K->32751K(229376K)] 244054K->89691K(1015808K), 0.0876533 secs] [Times: user=0.27 sys=0.03, real=0.09 secs] 

- 已经没有 FullGC啦！ MinorGC也只有2次了！



第三步：
-

> GC收集器优化：

- 从日志中看得出来默认使用的是 PS-GC（Parallel Scavenge + Parallel Old）器，别名：‘吞吐量优先’收集器，此收集器适合的场景是：后台运算而不需要太多前台交互的任务，显然做为 eclipse的收集器并不合适！


> 于是，考虑更换下 GC收集器，而CMS（Concurrent-Mark-Sweep）是一种以获取最短回收停顿时间为目标的收集器，考虑到工作时与 eclipse的频繁交互，显然此处使用 CMS更适合！

- 启用CMS

		-XX:+UseConcMarkSweepGC
		-XX:+UseParNewGC
		-XX:CMSInitiatingOccupancyFraction=85


> 下面是本次测试最终的配置：

		-startup
		plugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar
		--launcher.library
		plugins/org.eclipse.equinox.launcher.win32.win32.x86_64_1.1.200.v20150204-1316
		-product
		org.eclipse.epp.package.jee.product
		-showsplash
		org.eclipse.platform
		-vmargs
		-Dosgi.requiredJavaVersion=1.6
		-Xverify:none
		-Xms1024m
		-Xmx1024m
		-Xmn256m
		-XX:MetaspaceSize=256m
		-XX:+UseConcMarkSweepGC
		-XX:+UseParNewGC
		-XX:+DisableExplicitGC
		-Xnoclassgc
		-XX:CMSInitiatingOccupancyFraction=85
		-- java8中已经没有Perm了
		-- -XX:PermSize=256m
		-- -XX:MaxPermSize=256m
		-XX:+PrintGCTimeStamps
		-XX:+PrintGCDetails
		-Xloggc:gc.log


> 本次学习是基于《深入理解java虚拟机.第二版.第五章.调优案例分析与实践》进行的，感谢作者深厚的内功，更多详细内容请参考原著！学习是必须滴！
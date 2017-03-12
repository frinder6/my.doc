## 第一部分 用java7做开发 ##

第一章 初始java7
-
>java7中的新特性

- switch支持String
- 支持`100_000_000`数值表示法
- 新的异常处理
	- | 连接多个异常
	- final Exception 抛出实际异常
- try-with-resources(TWR)语法
- 钻石语法
- 简化变参方法调用

第二章 新I/O
-
>这个部分需要‘写写看’才能更深刻的理解

- Paths工具类使用
- Files工具类实现文件在CRUD等操作
- 通过Files.newDirectoryStream(path, "*.html")查找指定path下所有以.html结尾的文件
- 通过继承SimpleFileVisitor<Path>实现更复杂的功能，如：目录及子目录下所有.html文件的查找等（这个功能很强大，可以实现很多之前必须用‘递归’才能搞定的问题！）
- 使用FileSystems.getDefault().newWatchService()监听文件的CRUD等操作
- FileChannel的使用
- 异步IO



## 第二部分 ##

第三章 依赖注入

>这章主要讲‘依赖注入’的编程思想

	IOC（Inversion of Control）包含DI（Dependency Injection）
>DI优势

- 松耦合
- 高内聚
- 易测试
- 高重用
- 代码简洁


第四章 现代并发
-

>java.util.concurrent设计原则：

- 安全性（并发类型安全性）
- 活跃度
- 性能
- 重用性

>并发系统开销：

- 锁与监测
- 环境切换次数
- 线程的个数
- 调度
- 内在的局部性
- 算法设计

>关键字

- volatile

>原子类

- java.util.concurrent.atomic

>线程锁

- java.util.concurrent.locks

	ReentrantLock的使用
	ReentrantReadWriteLock 读多写少时使用，性能更好


>并发集合

- ConcurrentHashMap
- CopyOnWriteArrayList
 

>Queue

- BlickingQueue
	- WorkUnit，使用工作单元，如：`Queue<TaskWorkUnit<Mytask>>`
		
			public class TaskWorkUnit<T> {
			    private final T task;
			
			    public T getTask() {
			        return task;
			    }
			
			    public TaskWorkUnit(T task) {
			        this.task = task;
			    }
			}
- TransferQueue 的使用

>任务建模

- Callable
- Future
- FutureTask

>分支/合并框架

- ForkJoinPool
- ForkJoinTask
	- RecursiveAction 无结果返回
	- RecursiveTask 返回结果

>java内在模型（JMM）

- 之前发生（Happens-Before）与 同步约束（Synchronous-With）
	- Has-A 与 Is-A
- 传递性：a>b,b>c,则a>c


第五章 类文件与字节码
-

>类加载

- 加载
	- 读取.class文件
- 连接
	- 验证
	- 准备
	- 解析
- 初始化

>类加载器

- 根（引导）类加载器
- 扩展类加载器
- 应用（系统）类加载器
- 定制类加载器

>方法句柄

- MethodHandle

>javap命令

>操作码
- 加载与存储操作码
- 数据运算操作码
- 执行控制操作码
- 调用操作码
- 平台操作操作码 


第6章 理解性能调优
-
>性能术语

	等待时间（Latency）
	吞吐量（Throughput）
	利用率（Utilization）
	效率（Efficiency）
	容量（Capacity）
	扩展性（Scalability）
	退化（Degradation）

>调优困难的平台特性主要是

	线程调度
	垃圾收集（GC）
	即时（JIT）编译

>硬件时钟

- RTC
- 8254
- TSC 应用最广泛
- HPET 最新
- nanoTime()与currentTimeMillis()

>缓存未命中

>内存区域

- 伊甸园（Eden Space）
- 幸存者乐园（Survivor Space）
- 终身颐养园（Old Generation）
- PermGen

		栈保存原始型局部变量和引用，堆中保存对象


>年轻代收集 与 完全收集

>安全点


>GC 相关

	-Xms<几MB>m		--堆初始化值（默认2MB）
	-Xmx<几MB>m		--堆最大值（默认64MB）
	-Xmn<几MB>m		--堆中年轻代大小
	-XX:-DisableExplicitGC		--系统内调用System.gc()不产生任何作用


>读懂GC 日志

	-XX:+PrintGCDetails
	-XX:+PrintGCDateStamps	--gc操作时间戳
	-XX:+PrintGCApplicationConcurrentTime		--应用线程运行情况下用在GC上的时间
	

>GC 方法

	并发标记清除（CMS：Concurrent Mark-sweep）
		-XX:+UseConcMarkSweepGC		--打开cms收集器
		-XX:+CMSIncrementalMode		--增量模式（一般都需要）
		-XX:+CMSIncrementalPacing	--配合增量模式使用，自动调整每次执行垃圾回收的幅度（一般都需要）
		-XX:+UseParNewGC				--并发收集年轻代
		-XX:+ParallelGCThreads=<N>	--GC使用的线程数

	G1垃圾收集器
		-XX:+UseG1GC							--打开G1收集
		-XX:MaxGCPauseMillis	=50				--G1一次收集中暂停时间在50ms内
		-XX:GCPauseIntervalMillis=200ms		--2次收集的时间间隔在200ms以上

	
	输出编译日志
		-XX:+PrintCompilation		--输出编译日志
		
		注：
		s --方法是同步的
		! --方法有异常处理
		% --当前栈替换（OSR）


>HotSpot 编译

- 客户端编译器：编译决定更保守，编译效率慢
- 服务端编译器：编译决定更大胆，效率高
- 实时java

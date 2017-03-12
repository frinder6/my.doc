## Spring技术内幕 ##


- Spring 设计目标
	- 为开发者提供一个一站式的轻量级应用开发平台



- 对象解耦
	- 将 `对象-对象` 关系转化为 `对象-IOC容器-对象` 关系



- IOC 容器
	- BeanFactory
		- XmlBeanFactory
		- SimpleJndiBeanFactory
		- StaticListableBeanFactory
	- ApplicationContext
		- FileSystemXmlApplicationContext
		- ClassPathXmlApplicationContext


- AOP 实现
	- AspectJ
	- ProxyFactory


- 代理工厂实现
	- JVM动态代理Proxy实现
	- CGLib实现



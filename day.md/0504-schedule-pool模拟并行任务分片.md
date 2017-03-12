## 模拟并行任务分片 ##

代码部分：
-

    package com.pool;

	import com.alibaba.fastjson.JSON;
	import java.io.BufferedReader;
	import java.io.IOException;
	import java.io.InputStreamReader;
	import java.io.Reader;
	import java.util.ArrayList;
	import java.util.List;
	import java.util.concurrent.Executors;
	import java.util.concurrent.ScheduledThreadPoolExecutor;
	import java.util.concurrent.TimeUnit;
	import java.util.concurrent.atomic.AtomicInteger;
	
	/**
	 * Created on 2016/5/4.
	 */
	public class ScheduledPoolTest {
	
	    public static void main(String[] args) {
	        int len = 3;
	
	        // 定时任务线程池，长度为3
	        ScheduledThreadPoolExecutor executor = (ScheduledThreadPoolExecutor) Executors.newScheduledThreadPool(len);
	
	        // 添加3个任务，每5秒执行一次，并行处理
	        for (int i = 0; i < 3; i++) {
	            executor.scheduleAtFixedRate(new TaskThread(len, i), 0L, 5L, TimeUnit.SECONDS);
	        }
	
	        /**
	         * 手动关闭pool，没什么太大的用
	         */
	        try (
	                Reader reader = new InputStreamReader(System.in);
	                BufferedReader in = new BufferedReader(reader)
	        ) {
	            while (true) {
	                String line = in.readLine();
	                if (line.equalsIgnoreCase("no")) {
	                    executor.shutdown();
	                    break;
	                }
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	
	    }
	
	
	}
	
	/**
	 * 模拟切片任务
	 */
	class TaskThread implements Runnable {
	
	    private int increase = 0;
	    private List<Integer> list;
	
	    // 切片总数
	    private int len;
	    // 切片余数
	    private int mod;
	    private int size = 10000;
	
	    public TaskThread(int len, int mod) {
	        this.len = len;
	        this.mod = mod;
	    }
	
	
	    @Override
	    public void run() {
	        list = new ArrayList<>();
	        for (int i = increase * size; i < (increase + 1) * size; i++) {
	            // 根据 mod 分片
	            if (i % len == mod) {
	                list.add(i);
	            }
	        }
			increase++;
	        System.out.println("**********************************************************");
	        System.out.println(Thread.currentThread().getName() + " : " + JSON.toJSONString(list));
	        System.out.println("**********************************************************");
	    }
	
	}


运行效果：
-
	**********************************************************
	**********************************************************
	**********************************************************
	pool-1-thread-2 : [1,4,7,10,13,16,19,22,25,28,31,34,37,40,43,46,49,52,55,58,61,64,67,70,73,76,79,82,85,88,91,94,97]
	**********************************************************
	pool-1-thread-3 : [2,5,8,11,14,17,20,23,26,29,32,35,38,41,44,47,50,53,56,59,62,65,68,71,74,77,80,83,86,89,92,95,98]
	**********************************************************
	pool-1-thread-1 : [0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,63,66,69,72,75,78,81,84,87,90,93,96,99]
	**********************************************************
	**********************************************************
	pool-1-thread-1 : [102,105,108,111,114,117,120,123,126,129,132,135,138,141,144,147,150,153,156,159,162,165,168,171,174,177,180,183,186,189,192,195,198]
	**********************************************************
	**********************************************************
	pool-1-thread-1 : [100,103,106,109,112,115,118,121,124,127,130,133,136,139,142,145,148,151,154,157,160,163,166,169,172,175,178,181,184,187,190,193,196,199]
	**********************************************************
	**********************************************************
	pool-1-thread-1 : [101,104,107,110,113,116,119,122,125,128,131,134,137,140,143,146,149,152,155,158,161,164,167,170,173,176,179,182,185,188,191,194,197]
	**********************************************************
	no
	close the pool
	
	Process finished with exit code 0



>只是模拟下在线程池中分片，用的是定时pool

	1. 所有属性都是对象的，避免共享
	2. 使用分片，确保数据不被多次处理（多个线程处理）
	3. 使用多线程处理，提高效率


>今天没看其它东东，昨天刚好想到这个，就写了个小demo，只是测试使用，ScheduledThreadPoolExecutor用的不多，一般定时机制都会选择quartz，更灵活与强大！
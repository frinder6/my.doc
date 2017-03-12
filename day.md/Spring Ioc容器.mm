<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1465183414757" ID="ID_430001058" MODIFIED="1465183444196" TEXT="Spring Ioc&#x5bb9;&#x5668;">
<node CREATED="1465183445132" ID="ID_1836474158" MODIFIED="1465183510307" POSITION="right" TEXT="BeanFactory&#x63a5;&#x53e3;&#x7b80;&#x5355;&#x5bb9;&#x5668;&#x7cfb;&#x5217;&#xff0c;&#x5b9e;&#x73b0;&#x4e86;&#x5bb9;&#x5668;&#x7684;&#x6700;&#x57fa;&#x672c;&#x529f;&#x80fd;"/>
<node CREATED="1465183453695" ID="ID_524930707" MODIFIED="1465183537762" POSITION="right" TEXT="ApplicationContext&#x5e94;&#x7528;&#x4e0a;&#x4e0b;&#x6587;&#xff0c;&#x5bb9;&#x5668;&#x9ad8;&#x7ea7;&#x5f62;&#x6001;">
<node CREATED="1466414943312" ID="ID_1202526619" MODIFIED="1466415401207" TEXT="FileSystemXmlApplicationContext.getResourceByPath">
<node CREATED="1466414976975" ID="ID_1599396381" MODIFIED="1466415006272" TEXT="DefaultResourceLoader.getResource">
<node CREATED="1466415007479" ID="ID_884149044" MODIFIED="1466415036778" TEXT="AbstractBeanDefinitionReader.loadBeanDefinitions">
<node CREATED="1466415063583" ID="ID_139078771" MODIFIED="1466415074562" TEXT="AbstractBeanDefinitionReader.loadBeanDefinitions">
<node CREATED="1466415093535" ID="ID_193398665" MODIFIED="1466415288385" TEXT="AbstractXmlApplicationContext.loadBeanDefinitions">
<node CREATED="1466415174695" ID="ID_1621543128" MODIFIED="1466415276452" TEXT="AbstractRefreshableApplicationContext.refreshBeanFactory">
<node CREATED="1466415228759" ID="ID_441008000" MODIFIED="1466415240847" TEXT="AbstractApplicationContext.obtainFreshBeanFactory">
<node CREATED="1466415369983" ID="ID_1133749291" MODIFIED="1466415388412" TEXT="AbstractApplicationContext.refresh">
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1133749291" ENDARROW="Default" ENDINCLINATION="2135;0;" ID="Arrow_ID_1834980419" SOURCE="ID_1858657867" STARTARROW="None" STARTINCLINATION="2135;0;"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1466415295158" ID="ID_1858657867" MODIFIED="1466415388412" TEXT="FileSystemXmlApplicationContext.refresh">
<arrowlink COLOR="#b0b0b0" DESTINATION="ID_1133749291" ENDARROW="Default" ENDINCLINATION="2135;0;" ID="Arrow_ID_1834980419" STARTARROW="None" STARTINCLINATION="2135;0;"/>
<node CREATED="1466663628191" ID="ID_1796783862" MODIFIED="1466663664562" TEXT="AbstractApplicationContext.refresh">
<node CREATED="1466663666782" ID="ID_1982186956" MODIFIED="1466663880560" TEXT="AbstractApplicationContext.obtainFreshBeanFactory">
<node CREATED="1466663910469" ID="ID_1706654440" MODIFIED="1466663930441" TEXT="AbstractRefreshableApplicationContext.refreshBeanFactory">
<node CREATED="1466663962325" ID="ID_750087520" MODIFIED="1466664012601" TEXT="AbstractBeanDefinitionReader.loadBeanDefinitions"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1466390836521" ID="ID_254024138" MODIFIED="1466390845293" POSITION="right" TEXT="BeanDefinition">
<node CREATED="1466566821018" ID="ID_453743275" MODIFIED="1466566839423" TEXT="&#x5bf9;&#x5e94;xml&#x4e2d;&#x7684;&#x4e00;&#x4e2a;bean&#x5143;&#x7d20;"/>
</node>
<node CREATED="1466416238453" ID="ID_748247124" MODIFIED="1466416254985" POSITION="right" TEXT="Ioc&#x5bb9;&#x5668;&#x521d;&#x59cb;&#x5316;">
<node CREATED="1466416255693" ID="ID_1493533055" MODIFIED="1466416360170" TEXT="&#x5b9a;&#x4f4d;Resource"/>
<node CREATED="1466416300229" ID="ID_623087147" MODIFIED="1466585112270" TEXT="&#x89e3;&#x6790;&#x4e0e;&#x8f7d;&#x5165;BeanDefinition"/>
<node CREATED="1466416325604" ID="ID_832990406" MODIFIED="1466416346547" TEXT="&#x5411;Ioc&#x5bb9;&#x5668;&#x6ce8;&#x518c;&#x8fd9;&#x4e9b;BeanDefinition">
<node CREATED="1466563396992" ID="ID_1799065585" MODIFIED="1466563421326" TEXT="&#x901a;&#x8fc7;&#x7c7b;BeanDefinitionParserDelegate&#x89e3;&#x6790;xml&#xff0c;&#x88c5;&#x8f7d;bean"/>
</node>
</node>
<node CREATED="1466584861313" ID="ID_925668757" MODIFIED="1466584872768" POSITION="right" TEXT="Bean&#x521d;&#x59cb;&#x5316;&#x5b8c;&#x6210;&#x540e;&#x6267;&#x884c;&#x7684;&#x65b9;&#x6cd5;">
<node CREATED="1466584888360" ID="ID_1978951297" MODIFIED="1466584923973" TEXT="&#x6784;&#x9020;&#x65b9;&#x6cd5;&#xff08;Bean&#x521d;&#x59cb;&#x5316;&#x65f6;&#x6267;&#x884c;&#xff09;"/>
<node CREATED="1466584880921" ID="ID_192287186" MODIFIED="1466584887284" TEXT="@PostConstruct"/>
<node CREATED="1466584927920" ID="ID_869950268" MODIFIED="1466585023132" TEXT="InitializingBean.afterPropertiesSet"/>
<node CREATED="1466584872769" ID="ID_793870723" MODIFIED="1466584880364" TEXT="init-method"/>
</node>
<node CREATED="1466584951481" ID="ID_1705897100" MODIFIED="1466584963005" POSITION="right" TEXT="Bean&#x9500;&#x6bc1;&#x6267;&#x884c;&#x7684;&#x65b9;&#x6cd5;">
<node CREATED="1466584981576" ID="ID_690425426" MODIFIED="1466584997567" TEXT="@PreDestroy"/>
<node CREATED="1466584998136" ID="ID_1064841248" MODIFIED="1466585016093" TEXT="DisposableBean.destroy"/>
<node CREATED="1466585025146" ID="ID_30340465" MODIFIED="1466585031797" TEXT="destory-method"/>
</node>
<node CREATED="1466588554600" ID="ID_1921048309" MODIFIED="1466588556505" POSITION="right" TEXT="BeanPostProcessor">
<node CREATED="1466588556506" ID="ID_89336036" MODIFIED="1466588590485" TEXT="&#x5bb9;&#x5668;&#x7ea7;&#xff0c;&#x56f4;&#x7ed5;init-method&#x65b9;&#x6cd5;&#x8c03;&#x7528;&#xff0c;&#x6240;&#x6709;&#x7c7b;&#x521d;&#x59cb;&#x5316;&#x65f6;&#x90fd;&#x4f1a;&#x8c03;&#x7528;"/>
</node>
<node CREATED="1466646573711" ID="ID_1001905522" MODIFIED="1466646589786" POSITION="right" TEXT="Bean&#x5bf9;Ioc&#x5bb9;&#x5668;&#x7684;&#x611f;&#x77e5;">
<node CREATED="1466646590677" ID="ID_64958597" MODIFIED="1466646598715" TEXT="BeanNameAware">
<node CREATED="1466646599982" ID="ID_1435380350" MODIFIED="1466646632762" TEXT="&#x53ef;&#x4ee5;&#x5728;Bean&#x4e2d;&#x5f97;&#x5230;&#x5b83;&#x5728;Ioc&#x5bb9;&#x5668;&#x4e2d;&#x7684;Bean&#x5b9e;&#x4f8b;&#x540d;&#x79f0;"/>
</node>
<node CREATED="1466646634773" ID="ID_1008074353" MODIFIED="1466646660769" TEXT="BeanFactoryAware">
<node CREATED="1466646662052" ID="ID_129688123" MODIFIED="1466646694522" TEXT="&#x53ef;&#x4ee5;&#x5728;Bean&#x4e2d;&#x5f97;&#x5230;Bean&#x6240;&#x5728;&#x7684;Ioc&#x5bb9;&#x5668;&#xff0c;&#x4ece;&#x800c;&#x76f4;&#x63a5;&#x5728;Bean&#x4e2d;&#x4f7f;&#x7528;Ioc&#x5bb9;&#x5668;&#x7684;&#x670d;&#x52a1;"/>
</node>
<node CREATED="1466646695733" ID="ID_518672829" MODIFIED="1466646706646" TEXT="ApplicationContextAware">
<node CREATED="1466646706646" ID="ID_1943876698" MODIFIED="1466646750529" TEXT="&#x53ef;&#x4ee5;&#x5728;Bean&#x4e2d;&#x5f97;&#x5230;Bean&#x6240;&#x5728;&#x7684;&#x5e94;&#x7528;&#x4e0a;&#x4e0b;&#x6587;&#xff0c;&#x4ece;&#x800c;&#x76f4;&#x63a5;&#x5728;Bean&#x4e2d;&#x4f7f;&#x7528;&#x5e94;&#x7528;&#x4e0a;&#x4e0b;&#x6587;&#x7684;&#x670d;&#x52a1;"/>
</node>
<node CREATED="1466646752222" ID="ID_170385103" MODIFIED="1466646762965" TEXT="MessageSourceAware">
<node CREATED="1466646762966" ID="ID_160675589" MODIFIED="1466646775617" TEXT="&#x5728;Bean&#x4e2d;&#x53ef;&#x4ee5;&#x5f97;&#x5230;&#x6d88;&#x606f;&#x6e90;"/>
</node>
<node CREATED="1466646776749" ID="ID_648862349" MODIFIED="1466646795005" TEXT="ApplicationEventPublisherAware">
<node CREATED="1466646795006" ID="ID_1334868140" MODIFIED="1466646823146" TEXT="&#x5728;Bean&#x4e2d;&#x53ef;&#x4ee5;&#x5f97;&#x5230;&#x5e94;&#x7528;&#x4e0a;&#x4e0b;&#x6587;&#x7684;&#x4e8b;&#x4ef6;&#x53d1;&#x5e03;&#x5668;&#xff0c;&#x4ece;&#x800c;&#x53ef;&#x4ee5;&#x5728;Bean&#x4e2d;&#x53d1;&#x5e03;&#x5e94;&#x7528;&#x4e0a;&#x4e0b;&#x6587;&#x4ef6;&#x7684;&#x4e8b;&#x4ef6;"/>
</node>
<node CREATED="1466646824286" ID="ID_1765926063" MODIFIED="1466646842156" TEXT="ResourceLoaderAware">
<node CREATED="1466646842157" ID="ID_272392031" MODIFIED="1466646885571" TEXT="&#x5728;Bean&#x4e2d;&#x53ef;&#x4ee5;&#x5f97;&#x5230;ResourceLoader&#xff0c;&#x4ece;&#x800c;&#x5728;Bean&#x4e2d;&#x4f7f;&#x7528;ResourceLoader&#x52a0;&#x8f7d;&#x5916;&#x90e8;&#x5bf9;&#x5e94;&#x7684;Resource&#x8d44;&#x6e90;"/>
</node>
</node>
</node>
</map>

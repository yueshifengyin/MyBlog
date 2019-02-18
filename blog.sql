-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blogtype`
--

DROP TABLE IF EXISTS `blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='博客类型 - 个人博客,公开博客,其他博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogtype`
--

LOCK TABLES `blogtype` WRITE;
/*!40000 ALTER TABLE `blogtype` DISABLE KEYS */;
INSERT INTO `blogtype` VALUES (1,'个人博客'),(2,'公开博客'),(3,'其他博客');
/*!40000 ALTER TABLE `blogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Python'),(2,'Python Web'),(3,'爬虫'),(4,'人工智能');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `reply_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reply_User` (`user_id`),
  KEY `FK_Reply_Topic` (`topic_id`),
  CONSTRAINT `FK_Reply_Topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  CONSTRAINT `FK_Reply_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客回复';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,1,1,'你说的对啊','2018-02-11 00:00:00'),(2,2,2,'python最厉害','2018-02-11 00:00:00'),(3,3,3,'3','2018-02-11 00:00:00'),(4,2,1,'很喜欢','2018-02-11 00:00:00'),(5,2,2,'对对对','2018-02-11 00:00:00'),(6,2,2,'111','2018-02-11 00:00:00');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `pub_date` datetime NOT NULL,
  `read_num` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `images` text,
  `blogtype_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Topic_User` (`user_id`),
  KEY `FK_Topic_Blogtype` (`blogtype_id`),
  KEY `FK_Topic_Category` (`category_id`),
  CONSTRAINT `FK_Topic_Blogtype` FOREIGN KEY (`blogtype_id`) REFERENCES `blogtype` (`id`),
  CONSTRAINT `FK_Topic_Category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_Topic_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='博客文章';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'简单而直接的Python Web框架','2018-08-08 20:37:20',141,'From：https://www.oschina.net/question/5189_4306\r\n\r\nFrom：https://www.oschina.net/question/5189_4306\r\n\r\n\r\n\r\nWeb.py Cookbook 简体中文版：http://webpy.org/cookbook/index.zh-cn\r\n\r\nweb.py 0.3 新手指南：http://webpy.org/docs/0.3/tutorial.zh-cn\r\n\r\n\r\n\r\nwebpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\r\n\r\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\r\n\r\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \r\n\r\n\r\n\r\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：','images/banner01.jpg',1,2,1),(2,'Python-win10下使用定时任务执行程序','2018-10-01 00:00:00',2316,'webpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\r\n\r\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\r\n\r\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \r\n\r\n\r\n\r\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：\r\nwebpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\r\n\r\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\r\n\r\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \r\n\r\n\r\n\r\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：\r\nwebpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\r\n\r\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\r\n\r\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \r\n\r\n\r\n\r\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：\r\nFrom：https://www.oschina.net/question/5189_4306\r\n\r\nFrom：https://www.oschina.net/question/5189_4306\r\n\r\n\r\n\r\nWeb.py Cookbook 简体中文版：http://webpy.org/cookbook/index.zh-cn\r\n\r\nweb.py 0.3 新手指南：http://webpy.org/docs/0.3/tutorial.zh-cn\r\n\r\n\r\n\r\nwebpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\r\n\r\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\r\n\r\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \r\n\r\n\r\n\r\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：','images/banner02.jpg',1,2,1),(3,'爬虫微课5小时 python学习路线','2017-10-01 00:00:00',399,'Python 安装配置及基本语法篇 Python 语言速成 Python 基本知识 Python 常用表达式 Python 基础语法 Python 语法篇：菜鸟的Python笔记 Python精要参考：快速入门 《Python标... ','images/banner03.jpg',1,2,1),(4,'linux升级Pip3,安装pip svn','2018-04-21 00:00:00',256,'这其实不是什么高深的东西，但对于不常接触pip的朋友来说可能会蒙圈。通常情况下，你的电脑里如果安装了python2.x也同时安装了python3.x，那么应该就会有两个pip。一个是pip2，另一个是pip3。好吧，可能还有一个既没有2，也米有3的pip，一般情况下，pip==pip2。pip3 install --upgrade pip3但如果你这么做了，你会发现好像这并不是正确的姿势。pip3 install --upgrade pip  以上，仅作为我下次能够正确升级pip3的一个笔记，有需要的同学拿去用吧。不谢。','images/toppic01.jpg',1,2,1),(5,'精通python变成大佬','2017-12-04 00:00:00',1006,'Python-闭包详解在函数编程中经常用到闭包。闭包是什么，它是怎么产生的及用来解决什么问题呢。给出字面的定义先：闭包是由函数及其相关的引用环境组合而成的实体(即：闭包=函数+引用环境)(想想Erlang的外层函数传入一个参数a, 内层函数依旧传入一个参数b, 内层函数使用a和b, 最后返回内层函数)。这个从字面上很难理解，特别对于一直使用命令式语言进行编程的程序员们。本文将结合实例代码进行解释。引用环境','images/zd01.jpg',1,2,1),(6,'Nginx项目的部署','2018-08-26 00:00:00',205,'1、概念\r\n  1、Django项目（web服务）\r\n	2、web服务\r\n	  1、Nginx：高并发处理的好\r\n		2、Apache：稳定\r\n		  LAMP：linux、Apache、mysql、Python/php/perl\r\n			LNMP：linux、Nginx、mysql、Python/php/perl\r\n	3、uwsgi\r\n	  是web服务器与web框架之间一种简单而通用的接口\r\n2、项目部署（Nginx+uwsgi+django）\r\n  1、确保Django项目能够运行\r\n	2、安装nginx\r\n	  1、安装：sudo apt-get install Nginx\r\n		2、启动：sudo /etc/init.d/nginx restart\r\n		3、验证：打开浏览器，输入127.0.0.0:80\r\n		   welcome to nginx\r\n	3、安装uwsgi（用pip3 安装）\r\n	  1、安装：sudo pip3 uwsgi\r\n     2、验证\r\n      uwsgi --http :9998 --chdir /home/tarena/myproject/friutday_1/ --module friutday.wsgi\r\n	4、部署\r\n	 1、配置uwsgi(配置文件)\r\n	   1、mkdir uwsgi\r\n		 2、cd uwsgi\r\n     3、vi fruitday_uwsgi.ini\r\n[uwsgi]\r\n#指定和nginx通信的端口\r\nsocket=127.0.0.1:8001\r\n#项目路径\r\nchdir=/home/tarena/myproject/friutday_1\r\n#wsgi.py路径\r\nwsgi-file=friutday/wsgi.py\r\n#进程数\r\nprocesses=4\r\n#线程数\r\nthread=2\r\n#本项目占用uwsgi的端口\r\nstats=127.0.0.1:8081\r\n\r\n   2、配置nginx(配置文件)\r\n      1、sudo -i\r\n      2、cd /etc/nginx/sites-enabled\r\n      3、vi project_nginx.conf\r\n\r\nserver{\r\n	        # 监听本项目端口,浏览器输入的端口\r\n		listen 8201;\r\n		server_name frituday.com;  #域名\r\n		charset utf-8;\r\n		client_max_body_size 75M;\r\n		# 收集项目静态文件路径\r\n		location /static{\r\n			alias /home/tarena/myproject/friutday_1/static;\r\n		}\r\n	      # 和uwsgi通信端口和项目通信文件uwsgi_params\r\n		location /{\r\n			include uwsgi_params;\r\n			uwsgi_pass 127.0.0.1:8001;\r\n		}\r\n	}\r\n\r\n	    4、重启nginx服务\r\n        sudo /etc/init.d/nginx restart\r\n      5、拷贝uwsgi_params文件到项目目录\r\n       sudo cp /etc/nginx/uwsgi_params \r\n			     /home/tarena/myproject/friutday_1/\r\n	 3、收集静态文件\r\n      1、在settings.py文件中添加路径(STATIC_ROOT)\r\n        STATIC_ROOT = \'/home/tarena/myproject/friutday_1/static/\'\r\n      2、收集静态文件\r\n        python3 manage.py collectstatic\r\n	 4、uwsgi启动项目\r\n      cd /home/tarena/uwsgi\r\n      uwsgi --ini fruitday_uwsgi.ini\r\n\r\n\r\n3、多项目部署\r\n  1、uwsgi\r\n    每个项目需要单独创建uwsgi配置文件,选用不同端口\r\n  2、nginx\r\n    配置文件,1个就可以,添加server{}\r\n  3、部署个人博客项目\r\n    1、浏览器访问端口 ：8202\r\n      vi  /etc/nginx/sites-enabled/project_nginx.conf\r\n      server{\r\n			  listen 8202\r\n				....\r\n			}\r\n      # listen 8202\r\n\r\n    2、uwsgi和nginx通信端口 ：8002\r\n      cd uwsgi\r\n      vi blog_uwsgi.ini\r\n      # socket=127.0.0.1:8002\r\n    3、uwsgi启动个人博客项目占用端口 ：8082\r\n      vi blog_uwsgi.ini\r\n      stats=127.0.0.1:8082\r\n\r\n','upload/20181226193539280850.jpg',2,2,1),(7,'爬虫有道翻译','2018-09-14 00:00:00',652,'import requests\r\nimport json\r\n\r\n\r\n# 接收用户输入,对 data 进行转码(字节流)\r\nkey = input(\"请输入要翻译的内容:\")\r\ndata = {\r\n        \"i\":key,\r\n        \"from\":\"AUTO\",\r\n        \"to\":\"AUTO\",\r\n        \"smartresult\":\"dict\",\r\n        \"client\":\"fanyideskweb\",\r\n        \"salt\":\"1543198916297\",\r\n        \"sign\":\"21753ee815cabd98fb1c29635ba8e1d3\",\r\n        \"doctype\":\"json\",\r\n        \"version\":\"2.1\",\r\n        \"keyfrom\":\"fanyi.web\",\r\n        \"action\":\"FY_BY_REALTIME\",\r\n        \"typoResult\":\"false\"\r\n    }\r\n\r\n# 发请求,获响应\r\nurl = \"http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule\"\r\nheaders = {\"User-Agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36\"}\r\n\r\n# 用post方式去发请求,data直接为字典就可以\r\nres = requests.post(url,data=data,headers=headers)\r\nres.encoding = \"utf-8\"\r\nhtml = res.text\r\n\r\n# html为json格式的字符串\r\nr_dict = json.loads(html)\r\nprint(r_dict[\"translateResult\"][0][0][\"tgt\"])\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','upload/20181226193940909458.jpg',2,3,1),(8,'爬虫糗事百科段子','2018-03-22 00:00:00',433,'import requests\r\nimport pymongo\r\nfrom lxml import etree\r\n\r\nclass QiushiSpider:\r\n    def __init__(self):\r\n        self.headers = {\"User-Agent\":\"Mozilla/5.0\"}\r\n        # 连接对象\r\n        self.conn = pymongo.MongoClient(\"localhost\",\r\n                                         27017) \r\n        # 库对象\r\n        self.db = self.conn[\"Qiushi\"]\r\n        # 集合对象\r\n        self.myset = self.db[\"qiushiinfo\"]\r\n\r\n    # 获取页面\r\n    def getPage(self,url):\r\n        res = requests.get(url,headers=self.headers)\r\n        res.encoding = \"utf-8\"\r\n        html = res.text\r\n        self.parsePage(html)\r\n\r\n    # 解析并存入数据库\r\n    def parsePage(self,html):\r\n        # 创建解析对象\r\n        parseHtml = etree.HTML(html)\r\n        # 获取每个段子的节点对象列表\r\n        base_list = parseHtml.xpath(\'//div[contains(@id,\"qiushi_tag_\")]\') \r\n        for base in base_list:\r\n            # 节点对象可调用xpath\r\n            # 用户昵称\r\n            username = base.xpath(\'./div/a/h2\')\r\n            if len(username) == 0:\r\n                username = \"匿名用户\"\r\n            else:\r\n                username = base.xpath(\'./div/a/h2\')[0].text.strip()\r\n\r\n            # 段子内容\r\n            content = base.xpath(\'.//div[@class=\"content\"]/span\')\r\n            # 好笑数量\r\n            laughNum = base.xpath(\'.//i\')[0] \r\n            # 评论数量\r\n            pingNum = base.xpath(\'.//i\')[1]\r\n\r\n            d = {\r\n                \"username\":username,\r\n                \"content\":content[0].text.strip(),\r\n                \"laughNum\":laughNum.text,\r\n                \"pingNum\":pingNum.text\r\n                }\r\n            self.myset.insert(d)\r\n            print(\"成功\")\r\n\r\n\r\nif __name__ == \"__main__\":\r\n    spider = QiushiSpider()\r\n    spider.getPage(\"https://www.qiushibaike.com/8hr/page/1/\")\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','upload/20181226194324289530.jpg',2,3,1),(9,'运维基础学习','2018-07-01 00:00:00',564,'1、运维概述\r\n  1、什么是运维\r\n    服务器的运行维护\r\n  2、名词\r\n    1、IDC(互联网数据中心)\r\n      服务器租用、机柜租用\r\n    2、监控软件\r\n      zabbix、nagios、cactti\r\n    3、常用Linux操作系统\r\n      1、CentOS\r\n      2、RedHat\r\n      3、Ubuntu\r\n    4、虚拟化\r\n    5、Web正向代理(客户端知道自己使用的代理IP)\r\n      1、用途\r\n        1、访问原来无法访问的资源(google)\r\n	2、对Web服务器隐藏用户信息\r\n    6、nginx反向代理(客户端没有感觉)\r\n      1、流程\r\n        客户端 -> 反向代理服务器 -> 把请求转发给内部网络的服务器\r\n      2、作用\r\n        1、保证内网安全,可以使用方向代理提供WAF功能,阻止WEB攻击\r\n	2、负载均衡,优化网站的负载\r\n    7、负载均衡规则(nginx反向代理)\r\n      1、轮询 ：逐一循环调度\r\n      2、权重(weight) ：指定轮询几率,权重值和访问比例成正比\r\n      3、ip_hash ：根据客户端IP分配固定的后端服务器\r\n    8、负载均衡实现(修改nginx配置文件)\r\n      upstream servers{#定义集群\r\n          server 10.10.10.11;\r\n	  server 10.10.10.12 weight=2;\r\n	  server 10.10.10.13;\r\n	  server 10.10.10.14 backup;\r\n        }\r\n      server{\r\n          listen 80;\r\n	  ... ...\r\n      }\r\n2、Linux常用命令\r\n  1、ifconfig : 查看IP地址和MAC地址\r\n    ## windows中为ipconfig\r\n  2、ping ：测试网络连通性\r\n    ping IP地址/域名 -c 2\r\n  3、nslookup ：解析域名对应的IP地址\r\n    nslookup www.baidu.com\r\n  4、top ：Linux下的任务管理器,动态显示当前所有进程CPU以及内存的使用率,q退出\r\n  5、ps -aux : 显示系统进程(PID号)\r\n     ps -aux | grep \"mysql\"\r\n  6、kill ：杀死1个进程\r\n    sudo kill PID号\r\n  7、df -h : 查看磁盘使用情况\r\n  8、ls -lh : l表示长格式,h提供易读单位\r\n    ls -lh 文件名\r\n  9、chmod ：修改文件权限\r\n    chmod +x 文件名 \r\n    chmod 644 文件名 \r\n        rw-r--r--\r\n    r : 4\r\n    w : 2\r\n    x : 1\r\n  10、wc -l ：统计文件的行数\r\n    wc -l /etc/passwd :统计Linux系统有多少个用户\r\n  11、sort ：对文件中的内容进行排序\r\n    sort ip.txt\r\n  12、uniq -c\r\n    1、作用 ：去除重复行,并统计每行出现的次数(相邻行)\r\n    2、用法 ：sort 文件名 | uniq -c\r\n  13、find命令 ：根据指定条件查找文件/目录\r\n    1、-name ：文件名查找\r\n       -iname ：不区分大小写\r\n      find 路径 -name \"文件名\"\r\n      1、查找 ~/spider目录中的所有的 py 文件\r\n        find ~/spider -name \"*.py\"\r\n    2、-type ：根据类型查找(文件 | 目录)\r\n      1、常用选项\r\n        -f ：文件\r\n	-d ：目录\r\n	-l ：链接(link快捷方式)\r\n      2、查找主目录下以mysql开头的文件\r\n        find ~ -name \"mysql*\" -type f\r\n    3、-size ：按大小查找\r\n      1、+ ：大于...的文件/目录\r\n      2、- ：小于...的文件/目录\r\n      3、查找/home/treana/software大于20M的文件\r\n        find ~/sofware -size +20M -type f\r\n    4、-ctime ：根据时间查找\r\n      1、-ctime +1 ：1天以前的文件/目录\r\n      2、-cmin -5  ：5分钟以内的文件/目录\r\n      3、查找~/spider下1天以内的文件\r\n        find ~/spider -ctime -1 -type f\r\n    5、处理动作\r\n      find .... -exec Linux命令 {} \\;\r\n      1、查找1天以内的以.doc结尾的文件,然后删除\r\n        find . -name \"*.doc\" -ctime -1 -type f -exec rm -rf {} \\;\r\n  14、ssh ：远程连接到服务器\r\n    1、格式 ：ssh 用户名@IP地址\r\n    2、示例 ：ssh tarena@X.X.X.X\r\n  15、scp \r\n    1、远程复制文件/目录\r\n    2、scp 文件名 用户名@IP地址:绝对路径\r\n       scp A.tar.gz tarena@X.X.X.X:/home/tarena\r\n  16、du -sh ：显示当前目录大小\r\n    du -sh 目录名\r\n3、运维工具\r\n  1、xshell(软件,安装在windows)\r\n    安全终端模拟软件\r\n  2、xshell使用方法\r\n    文件 - 新建 - 输入服务器IP地址 - 用户名 - 密码 - 确认连接\r\n  3、Windows <--> Linux\r\n    1、安装lszrz\r\n      sudo apt-get install lrzsz\r\n    2、Windows文件 -> Linux\r\n      xshell终端 ：$ rz\r\n    3、Linux文件 -> Windows\r\n      xshell终端 ：$ sz 文件名\r\n4、周期性计划任务\r\n  1、进入周期性计划任务\r\n    $ crontab -e\r\n      按 3\r\n  2、设置周期性计划任务\r\n    * * * * * python3 /home/tarena/backup.py\r\n    分 时 日 月 周\r\n    分 ：0-59\r\n    时 ：0-23\r\n    日 ：1-31\r\n    月 ：1-12\r\n    周 ：0-6\r\n\r\n    * ：代表所有可能值\r\n    , ：指定多个时间点\r\n        每月的1号和5号的00:00执行1个py文件\r\n	0 0 1,5 * * python3 /home/tarena/backup.py\r\n    / ：指定时间间隔的频率\r\n        每隔10分钟执行1个py文件\r\n	*/10 * * * * python3 /home/tarena/backup.py\r\n    - ：指定一个时间段\r\n        0点-6点之间,每小时执行1个py文件\r\n	0 0-6/1 * * * python3 /home/tarena/backup.py\r\n    练习\r\n      1、每分钟执行1次backup.py\r\n        */1 * * * * python3 /home/tarena/backup.py\r\n      2、每小时的第3分钟和第15分钟执行backup.py\r\n        3,15 * * * * python3 /home/tarena/backup.py\r\n      3、每周六和周日的0点执行backup.py\r\n        0 0 * * 6,0 python3 /home/tarena/backup.py\r\n      4、每天的18点-23点之间,每小时执行1次backup.py\r\n        0 18-23/1 * * * python3 /home/tarena/backup.py\r\n5、awk的使用(1行1行的处理)\r\n  1、语法格式 ：awk 选项 \'动作\' 文件\r\n  2、用法 ：    Linux命令 | awk 选项 \'动作\'\r\n  3、使用示例\r\n    1、awk \'{print \"hello\"}\' ip.txt\r\n    2、df -h | awk \'{print $1}\'\r\n      作用 ：显示df -h结果第一列的内容(默认以空白分隔不同的列)\r\n    3、awk -F \"分隔符\" \'{动作}\' ...\r\n      ## 默认以空白分隔,-F可手动指定分隔符\r\n    4、显示本机的IP地址\r\n      ifconfig | head -2 | tail -1 | awk \'{print $2}\' | awk -F \":\" \'{print $2}\'\r\n    5、nginx的访问日志目录：/var/log/nginx/access.log\r\n      1、把访问过自己的IP地址输出\r\n        awk \'{print $1}\' access.log | sort | uniq\r\n      2、统计一共有多少个IP访问过我\r\n        awk \'{print $1}\' access.log | sort | uniq | wc -l\r\n      3、把访问我最多的10个IP的IP地址和访问次数输出来\r\n        awk \'{print $1}\' access.log | sort | uniq -c | sort -rnk 1 | head -10\r\n      4、sort的参数\r\n        sort -k 1 ：按照第1列进行排序\r\n	sort -n   ：以数字的方式比较排序\r\n	sort -r   ：倒序排列\r\n\r\n	sort -rnk 1 ：把第1列以数字的方式进行倒序排列\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','upload/20181227001126440469.jpg',2,1,1),(10,'爬虫爬取豆瓣电影top100','2018-04-23 00:00:00',812,'import requests\r\nimport pymysql\r\nimport json\r\n\r\nclass DoubanSpider:\r\n    def __init__(self):\r\n        self.headers = {\"User-Agent\":\"Mozilla/5.0\"}\r\n        self.url = \"https://movie.douban.com/j/chart/top_list?\"\r\n        self.db = pymysql.connect(\"localhost\",\r\n                  \"root\",\"123456\",\"DouBan\",charset=\"utf8\") \r\n        self.cursor = self.db.cursor()\r\n\r\n    # 获取页面\r\n    def getPage(self,params):\r\n        res = requests.get(self.url,params=params,\r\n                             headers=self.headers)\r\n        res.encoding = \"utf-8\"\r\n        html = res.text\r\n        self.parsePage(html)\r\n\r\n    # 解析页面\r\n    def parsePage(self,html):\r\n        # html为json格式的字符串\r\n        info = json.loads(html)\r\n        # for循环遍历列表中的元素[{1个电影信息},{}]\r\n        for film in info:\r\n            name = film[\"title\"]\r\n            score = float(film[\"score\"].strip())\r\n            # 定义列表,为了存入mysql使用\r\n            exe_list = [name,score]\r\n            # print(exe_list)\r\n            self.writePage(exe_list)\r\n        print(\"成功存入数据库Douban.Film\")\r\n\r\n    # 写入\r\n    def writePage(self,exe_list):\r\n        ins = \'insert into Film(name,score) \\\r\n               values(%s,%s)\'\r\n        self.cursor.execute(ins,exe_list)\r\n        self.db.commit()\r\n\r\n    # 主函数\r\n    def workOn(self):\r\n        kinds = [\"剧情\",\"喜剧\",\"爱情\"]\r\n        tpLlist = {\r\n                \"剧情\":\"11\",\r\n                \"喜剧\":\"24\",\r\n                \"爱情\":\"13\"\r\n            }\r\n        print(\"**************\")\r\n        print(\"|剧情|喜剧|爱情|\")\r\n        print(\"**************\")\r\n\r\n        kind = input(\"请输入电影类型:\")\r\n        if kind in kinds:\r\n            number = input(\"请输入要爬取的数量:\")\r\n            filmType = tpLlist[kind]\r\n\r\n            params = {\r\n                    \"type\":filmType,\r\n                    \"interval_id\":\"100:90\",\r\n                    \"action\":\"\",\r\n                    \"start\":\"0\",\r\n                    \"limit\":number\r\n                }\r\n            self.getPage(params)\r\n            # 断开数据库连接\r\n            self.cursor.close()\r\n            self.db.close()\r\n        else:\r\n            print(\"您输入的电影类型不存在\")\r\n\r\nif __name__ == \"__main__\":\r\n    spider = DoubanSpider()\r\n    spider.workOn()\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','upload/20181227001809479622.jpg',2,3,1);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(50) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `upwd` varchar(30) NOT NULL,
  `is_author` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'damao','大毛','damao@163.com',NULL,'guaiguai521',1),(2,'jiancai','建材','jiancai@qq.com',NULL,'123456',0),(3,'lvye','吕爷','lvye@163.com',NULL,'123456',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voke`
--

DROP TABLE IF EXISTS `voke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `voke` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Voke_User` (`user_id`),
  KEY `FK_Voke_Topic` (`topic_id`),
  CONSTRAINT `FK_Voke_Topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  CONSTRAINT `FK_Voke_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点赞';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voke`
--

LOCK TABLES `voke` WRITE;
/*!40000 ALTER TABLE `voke` DISABLE KEYS */;
INSERT INTO `voke` VALUES (1,1,2),(2,1,1),(3,2,1),(4,1,2),(5,2,3),(6,3,4);
/*!40000 ALTER TABLE `voke` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-27  0:26:46

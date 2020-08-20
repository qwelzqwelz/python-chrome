<!--
 * @Author: qwelz
 * @Date: 2020-07-24 20:30:58
 * @LastEditors: qwelz
 * @LastEditTime: 2020-08-20 20:37:14
--> 

# quick start

### 基础使用
* chrome 运行，需要设置比较大的 --shm-size
```shell
docker run -it --shm-size=1G qwelz/python-chrome:latest
```

### 作为开发环境，保持后台运行
* 按照 `docker` 的设计，一个容器应该集成应用和环境，而不是将容器作为独立的环境运行
* 但是，此镜像主要用于 `python` 远程开发，可以违背一下该原则，使用如下命令启动，可以保持容器后台运行
```shell
docker run -d --shm-size=1G qwelz/python-chrome:latest tail -f /dev/null
```


# Introduction

### python-chrome:latest
* `master` 分支，用于日常爬虫开发使用，本人自用
* 基于 `python:3.8` 官方镜像（该镜像基于 `debain10`）
* 时区改为 `GMT+8`，优化了 `shell` 的头部输出样式，添加了 `pypi` 的 `aliyun` 镜像
* 安装中文字体 : fonts-wqy-microhei fonts-wqy-zenhei xfonts-wqy

### python-chrome:ubuntu-python36
* 此分支已放弃维护
* `ubuntu-python36` 分支，这是此前使用的版本，版本不够新
* 基于 `junyuuuu/python-selenium-chrome:1.0.3` 构建

# 集成环境

### chrome 相关
google-chrome, chromedriver

### 常用工具
* git, vim
* tree 
* p7zip-full unzip rar
* axel
* wkhtmltopdf
* xvfb
* crontab rsyslog
* rclone

### 中文字体
* fonts-wqy-microhei fonts-wqy-zenhei xfonts-wqy

### python package
* cffi python-dateutil brotlipy
* selenium requests aiohttp bs4 pyvirtualdisplay
* redis pymysql
* opencv-python imageio apng pillow
* pdfkit pyyaml pyyaml-include
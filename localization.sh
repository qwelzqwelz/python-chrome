#!/bin/bash

###
# @Author: qwelz
# @Date: 2020-07-20 12:07:22
 # @LastEditors: qwelz
 # @LastEditTime: 2020-08-20 10:50:16
###

# set debian mirrors
mv /etc/apt/sources.list /etc/apt/sources.list.origin
cat >/etc/apt/sources.list <<EOF
deb http://mirrors.aliyun.com/debian/ buster main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib
deb http://mirrors.aliyun.com/debian-security buster/updates main
deb-src http://mirrors.aliyun.com/debian-security buster/updates main
deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib
EOF
apt-get update

# change time zone : Aisa -> China -> Beijing Time -> Yes
echo -e "4\n9\n1\n1" | tzselect &&
    echo "TZ='Asia/Shanghai'; export TZ" >>/root/.profile &&
    echo "TZ='Asia/Shanghai'; export TZ" >>/root/.bashrc
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo 'Asia/Shanghai' >/etc/timezone

# change bash header
cat >>/root/.bashrc <<EOF
PS1="[\[\033[01;31m\]\u\[\033[00m\]@\[\033[01;32m\]\h\[\033[00m\]][\[\033[01;33m\]\t\[\033[00m\]]:\[\033[01;34m\]\w\[\033[00m\]\n# "
EOF

# pip mirror
if [ ! -d "~/.pip" ]; then
    mkdir /root/.pip
fi
cat >/root/.pip/pip.conf <<EOF
[global] 
index-url=http://mirrors.aliyun.com/pypi/simple 
[install] 
trusted-host=mirrors.aliyun.com
EOF

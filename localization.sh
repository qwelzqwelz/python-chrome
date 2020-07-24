#!/bin/bash

###
# @Author: qwelz
# @Date: 2020-07-20 12:07:22
 # @LastEditors: qwelz
 # @LastEditTime: 2020-07-24 19:07:59
###

# change time zone : Aisa -> China -> Beijing Time -> Yes
echo -e "4\n9\n1\n1" | tzselect &&
    echo "TZ='Asia/Shanghai'; export TZ" >>/root/.profile &&
    echo "TZ='Asia/Shanghai'; export TZ" >>/root/.bashrc

# change bash header
cat >>/root/.bashrc <<EOF
PS1="[\[\033[01;31m\]\u\[\033[00m\]@\[\033[01;32m\]\h\[\033[00m\]][\[\033[01;33m\]\t\[\033[00m\]]:\[\033[01;34m\]\w\[\033[00m\]\n# "
EOF

# pip mirror
if [ ! -d "~/.pip" ]; then
    mkdir /root/.pip
fi &&
    cat >/root/.pip/pip.conf <<EOF
[global] 
index-url=http://mirrors.aliyun.com/pypi/simple 
[install] 
trusted-host=mirrors.aliyun.com
EOF

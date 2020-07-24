FROM junyuuuu/python-selenium-chrome:1.0.3

RUN apt-get update; apt-get upgrade; exit 0

RUN apt-get install -y git tree p7zip-full unzip tzdata axel rar

# upgrade pip && install packages
RUN pip install --upgrade pip \
    && pip install selenium requests aiohttp bs4 redis pymysql pyyaml 

# mirrors and change time zone to GMT+8
COPY localization.sh .
RUN chmod +x ./localization.sh && sh ./localization.sh && rm -f ./localization.sh

CMD ["/sbin/my_init"]
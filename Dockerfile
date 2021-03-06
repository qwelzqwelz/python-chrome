FROM python:3.8

# add chrome to apt
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

RUN apt-get update && apt-get upgrade -y

# apt install chrome and others
RUN apt-get install -y google-chrome-stable \
    git vim tree p7zip-full unzip tzdata axel \
    fonts-wqy-microhei fonts-wqy-zenhei xfonts-wqy \
    wkhtmltopdf xvfb \
    cron rsyslog

# install rar
RUN wget 'https://www.rarlab.com/rar/rarlinux-x64-5.9.1.tar.gz' \
    && tar -zxvf rarlinux-x64-5.9.1.tar.gz \
    && cd rar \
    && make \
    && cd .. \
    && rm -rf rar rarlinux-x64-5.9.1.tar.gz

# install rclone
RUN curl https://rclone.org/install.sh | bash \
    && rm -f install.sh

# install chromedriver
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip \
    && unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/ \
    && rm -f /tmp/chromedriver.zip

# upgrade pip && install packages
RUN pip install --upgrade pip \
    && pip install \
    cffi python-dateutil \
    selenium requests aiohttp bs4 pyvirtualdisplay \
    redis pymysql pyyaml-include \
    opencv-python imageio apng pillow \
    pdfkit pyyaml \
    && pip install brotlipy \
    && pip install hyper mitmproxy m3u8 pycrypto 

# mirrors and change time zone to GMT+8
COPY localization.sh .
RUN chmod +x ./localization.sh && sh ./localization.sh && rm -f ./localization.sh

ENV TZ=Asia/Shanghai
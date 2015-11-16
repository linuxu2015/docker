FROM centos:6.6
MAINTAINER linuxu2015@gmail.com
RUN rm -rf /etc/yum.repos.d/*
COPY yum.repo /etc/yum.repos.d/
#配置apt源
#RUN echo "deb http://yum-server.aioute.com/ubuntu/mirror/mirrors.aliyun.com/ubuntu trusty main universe  multiverse restricted" > /etc/apt/sources.list
#RUN echo "deb http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list
#RUN apt-get update
#RUN apt-get upgrade -y
##安装软件
#RUN apt-get install nginx vim lrzsz php5 php5-fpm    php5-gd supervisor  php5-redis   php5-mysql  php5-cli  --force-yes -y
COPY mkmqtt.sh /usr/local/
RUN bash /usr/local/mkmqtt.sh
RUN mkdir -p /var/log/supervisor
RUN echo "30 * * * * /usr/sbin/ntpdate 202.120.2.101" >> /var/spool/cron/root
RUN service crond restart
RUN rm -rf /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
RUN rm -rf /etc/supervisord.conf
COPY supervisord.conf /etc/supervisord.conf
##创建数据卷
#VOLUME ['/var/log/mysql']
#VOLUME ['/var/lib/mysql']
#VOLUME ["/VAR/LOG/NGINX/"]
##开放端口
#EXPOSE  80
CMD ["/usr/bin/supervisord"]


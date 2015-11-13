FROM centos_php_p
MAINTAINER linuxu2015@gmail.com
RUN rm -rf /etc/yum.repos.d/*
COPY yum.repo /etc/yum.repos.d/
#RUN yum install supervisor crontabs cronie -y 
#RUN echo "192.168.17.101	yum-server.aioute.com" >> /etc/hosts
RUN yum install nginx supervisor vim lrzsz  crontabs cronie -y
RUN mkdir -p /var/log/supervisor
RUN echo "30 * * * * /usr/sbin/ntpdate 202.120.2.101" >> /var/spool/cron/root
RUN service crond restart
RUN rm -rf /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
RUN rm -rf /etc/supervisord.conf
RUN rm -rf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY startxiaole /usr/bin/
##创建数据卷
VOLUME ["/server"]
#VOLUME ["/var/log/nginx/"]
##开放端口
#EXPOSE  80
CMD ["/usr/bin/supervisord"]

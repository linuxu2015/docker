#基于centos6.6的lnmp
创建镜像 docker build -t image_name .
创建容器：docker run -d --net=none -v /data/web/lnmp_demo:/web -v /data/database/lnmp_demo:/var/lib/mysql --name container_name image_name
其中/data/web/lnmp_demo为网站的根目录,/data/database/lnmp_demo为该网站数据库存放在本地的位置

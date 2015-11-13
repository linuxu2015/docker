#!/bin/bash
docker run -d --net=none -v /data/web/haiyang:/web --name=haiyang lnmp_centos
pipework vlan121 haiyang 10.121.0.15/24@10.121.0.254
docker exec haiyang ping -w 3 10.121.0.254

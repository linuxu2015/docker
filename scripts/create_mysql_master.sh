#!/bin/bash
docker run -d --restart=on-failure:20 --net=none --name=tech_mysql01 -v /data/tech_mysql/mysql:/var/lib/mysql -v /data/tech_mysql/log:/var/log/mysql tech/mysql_master
pipework vlan121 tech_mysql01 10.121.0.1/24@10.121.0.254
docker exec tech_mysql01 ping -w 3 10.121.0.254

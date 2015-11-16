#!/bin/bash
docker run -d --net=none --name=tech_mysql02 -v /data/tech_mysql02/mysql:/var/lib/mysql -v /data/tech_mysql02/log:/var/log/mysql tech/mysql_slave
pipework vlan121 tech_mysql02 10.121.0.2/24@10.121.0.254
docker exec tech_mysql02 ping -w 3 10.121.0.254

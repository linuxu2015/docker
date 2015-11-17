#!/bin/bash
docker run -d --net=none --name=tech_redis_slave -m 2048m --cpuset=4 -v /data/tech_redis:/var/redis tech/redis_slave
pipework vlan121 tech_redis_slave 10.121.0.7/24@10.121.0.254
docker exec tech_redis_slave ping -w 1 10.121.0.254

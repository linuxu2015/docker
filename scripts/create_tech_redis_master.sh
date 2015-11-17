#!/bin/bash
docker run -d --net=none --name=tech_redis_master -m 2048m --cpuset=4 -v /data/tech_redis:/var/redis tech/redis_master
pipework vlan121 tech_redis_master 10.121.0.6/24@10.121.0.254
docker exec tech_redis_master ping -w 1 10.121.0.254

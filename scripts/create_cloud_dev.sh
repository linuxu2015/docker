#!/bin/bash
docker run -d --net=none -v /data/web/cloud_dev:/web --name=cloud_dev cloud_dev
pipework vlan121 cloud_dev 10.121.0.13/24@10.121.0.254
docker exec cloud_dev ping -w 3 10.121.0.254

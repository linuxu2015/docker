#!/bin/bash
docker run -d --net=none -v /data/web/cloud_dev_openapi:/web --name=cloud_dev_openapi cloud_dev_openapi
pipework vlan121 cloud_dev_openapi 10.121.0.12/24@10.121.0.254
docker exec cloud_dev_openapi ping -w 3 10.121.0.254

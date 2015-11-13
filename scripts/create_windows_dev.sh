#!/bin/bash
docker run -d --net=none -v /data/web/windows_dev:/web --name=windows_dev cloud_dev
pipework vlan121 windows_dev 10.121.0.11/24@10.121.0.254
docker exec windows_dev ping -w 3 10.121.0.254

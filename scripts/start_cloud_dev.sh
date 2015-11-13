#!/bin/bash
docker start cloud_dev
pipework vlan121 cloud_dev 10.121.0.13/24@10.121.0.254
docker exec cloud_dev ping -w 3 10.121.0.254


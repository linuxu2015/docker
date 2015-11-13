#!/bin/bash
docker start windows_dev
pipework vlan121 windows_dev 10.121.0.11/24@10.121.0.254
docker exec windows_dev ping -w 3 10.121.0.254

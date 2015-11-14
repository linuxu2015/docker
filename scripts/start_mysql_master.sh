#!/bin/bash
docker start tech_mysql01
pipework vlan121 tech_mysql01 10.121.0.1/24@10.121.0.254
docker exec tech_mysql01 ping -w 3 10.121.0.254

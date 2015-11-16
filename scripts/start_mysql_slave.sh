#!/bin/bash
docker start tech_mysql02
pipework vlan121 tech_mysql02 10.121.0.2/24@10.121.0.254
docker exec tech_mysql02 ping -w 3 10.121.0.254

#!/bin/bash
docker start xiaole_server
pipework vlan121 xiaole_server 10.121.0.14/24@10.121.0.254
docker exec xiaole_server ping -w 3 10.121.0.254

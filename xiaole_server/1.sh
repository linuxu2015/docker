a=`ping -w 1 www.idu| grep 'time=' | wc -l`
while true;do
if [ $a = 1 ];then
#echo 'ok'
cd /server/wwwroot && /usr/local/php/bin/php ./cli.php Index/start
cd /server/wwwroot && /usr/local/php/bin/php ./cli.php HeartbeatTest/start
break
fi
sleep 5
done

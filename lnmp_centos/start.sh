#!/bin/bash
if [ ! -f /var/lib/mysql/ibdata1 ]; then
    mysql_install_db

    /usr/bin/mysqld_safe &
    sleep 10s

    echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'ht@2014' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
    echo "GRANT REPLICATION SLAVE ON *.* to 'sync'@'10.121.0.2' identified by '1qaz2wsx';FLUSH PRIVILEGES" | mysql
    echo "grant all privileges on *.* to 'root'@'localhost' identified by 'ht@2014';FLUSH PRIVILEGES" | mysql
    killall mysqld
    sleep 10s
fi
/usr/bin/mysqld_safe
#service mysqld restart
#service nginx restart
#service php-fpm restart

#/usr/sbin/nginx -c /etc/nginx/nginx.conf
#/usr/sbin/php-fpm --daemonize --fpm-config /etc/php-fpm.conf
#/bin/bash

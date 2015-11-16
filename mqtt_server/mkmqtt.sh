#!/bin/bash
conf_file=/etc/mosquitto/mosquitto.conf
log_dir=/var/log/mosquitto
useradd mosquitto
yum install c-ares-devel    supervisor crontabs cronie tar wget libuuid-devel gcc gcc-c++ openssl openssl-devel mysql-devel git  -y
if [ ! -e $log_dir ];then
mkdir $log_dir
chown mosquitto.mosquitto $log_dir
fi
if [ ! -e mosquitto-1.4.2.tar.gz ];then
wget http://mosquitto.org/files/source/mosquitto-1.4.2.tar.gz
fi
tar xf mosquitto-1.4.2.tar.gz
cd  mosquitto-1.4.2
make
make install
ln -s /usr/local/lib/libmosquitto.so.1 /usr/lib/libmosquitto.so.1
ldconfig
cp -a /etc/mosquitto/mosquitto.conf.example $conf_file
#mkdir $log_dir
#sed -i "s@#log_dest stderr@log_dest file /var/log/mosquitto/mosquitto.log@g" $conf_file
#sed -i "s@#log_type error@log_type error@g" $conf_file
#sed -i "s@#log_type warning@log_type warning@g" $conf_file
#sed -i "s@#log_type notice@log_type notice@g" $conf_file
#sed -i "s@#log_type information@log_type information@g" $conf_file
cat >> $conf_file << EOF
#######################监听端口######################
bind_address 0.0.0.0
port 7701
##############日志##################################
log_dest file /var/log/mosquitto/mosquitto.log
log_type all
log_timestamp true
connection_messages true
##########################数据库认证###################
auth_plugin /etc/mosquitto/auth-plug.so
auth_opt_backends mysql
auth_opt_host 192.168.101.229
auth_opt_port 3306
auth_opt_dbname smart_dev_db
auth_opt_user root
auth_opt_pass root
auth_opt_userquery SELECT pw FROM st_auth_user WHERE username = '%s'
auth_opt_superquery SELECT COUNT(*) FROM st_auth_user WHERE username = '%s' AND super = 1
auth_opt_aclquery SELECT topic FROM st_acls WHERE (username = '%s') AND (rw >= %d)
auth_opt_anonusername AnonymouS
EOF
###########################安装认证插件，使mosquitt支持数据库##################
git clone https://github.com/jpmens/mosquitto-auth-plug.git
cd mosquitto-auth-plug
cp config.mk.in config.mk
make
cp -a auth-plug.so /etc/mosquitto/

#!/bin/sh

SRC_NAME=tomcat-connectors-1.2.42-src
APXS=`command -v apxs`

sudo tar xfz /opt/mod_jk_rpm/$SRC_NAME.tar.gz -C /tmp
cd /tmp/$SRC_NAME/native
./configure --with-apxs=$APXS
make
cp apache-2.0/mod_jk.so /opt/mod_jk_rpm/mod_jk.so

/sbin/service httpd restart

#ausearch -m avc -ts recent | audit2allow -m local > local.te
##cat /var/log/audit/audit.log | audit2allow -m local > local.te
#checkmodule -M -m -o local.mod local.te
#semodule_package -o local.pp -m local.mod
#semodule -i local.pp
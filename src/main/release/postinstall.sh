#!/bin/sh

SRC_NAME=tomcat-connectors-1.2.42-src
BASE_DIR=/opt/mod_jk_rpm
BUILD_DIR=$BASE_DIR/$SRC_NAME
APXS=`command -v apxs`

# Unpack tar
tar xfz /opt/mod_jk_rpm/$SRC_NAME.tar.gz -C $BASE_DIR

# Build
cd $BUILD_DIR/native
./configure --with-apxs=$APXS
make

# Install
make install

# Activate
apxs -i -a -n jk apache-2.0/mod_jk.so

# Cleanup
cd $BASE_DIR
rm -fR $BUILD_DIR

#/sbin/service httpd restart

#ausearch -m avc -ts recent | audit2allow -m local > local.te
##cat /var/log/audit/audit.log | audit2allow -m local > local.te
#checkmodule -M -m -o local.mod local.te
#semodule_package -o local.pp -m local.mod
#semodule -i local.pp
#!/bin/sh

SRC_NAME=tomcat-connectors-1.2.42-src
BASE_DIR=/opt/mod_jk_rpm
BUILD_DIR=$BASE_DIR/$SRC_NAME
APXS=`command -v apxs`

# Deactivate
rm -fR $BUILD_DIR
apxs -e -A -n jk mod_jk.so

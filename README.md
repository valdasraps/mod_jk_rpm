# mod_jk_rpm

RPM installation of mod_jk by using Mave.

## Building RPM

```
git clone git@github.com:valdasraps/mod_jk_rpm.git
cd mod_jk_rpm
mvn clean package
```

This should create RPM i.e. `target/rpm/mod_jk_rpm/RPMS/noarch/mod_jk_rpm-0.0.1-1.noarch.rpm`.

## Installing RPM

```
sudo rpm -i mod_jk_rpm-0.0.1-1.noarch.rpm
```
This compiles mod_jk and creates assets:
```
/opt/mod_jk_rpm/
/opt/mod_jk_rpm/mod_jk.so
/opt/mod_jk_rpm/tomcat-connectors-1.2.42-src.tar.gz
/etc/httpd/modules/mod_jk.so -> /opt/mod_jk_rpm/mod_jk.so
```

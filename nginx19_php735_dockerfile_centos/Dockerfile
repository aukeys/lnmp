#FROM centos:7.6
FROM centos:latest
MAINTAINER rui.chen@163.com
RUN useradd -M -s /sbin/nologin www
ADD  php735.tar.gz /data/server
RUN chown -R www.www /data/server/php735
RUN yum -y install libxslt.x86_64 libX11.x86_64 libXpm.x86_64 libjpeg.x86_64 libicu.x86_64 libpng.x86_64 libjpeg-turbo.x86_64 freetype.x86_64
#RUN yum -y install cmake make
RUN yum -y install make gcc-c++ zlib zlib-devel

RUN yum -y install bzip2 openssl postgresql-devel 
ADD cmake-3.10.2-Linux-x86_64.tar.gz /

ADD libzip-1.5.1.tar.gz /
WORKDIR /libzip-1.5.1
RUN mkdir build 
WORKDIR  /libzip-1.5.1/build
#RUN /cmake-3.10.2-Linux-x86_64/bin/cmake .. 
#RUN cmake ..
#RUN /cmake-3.10.2-Linux-x86_64/bin/cmake -version
RUN export CMAKE_HOME=/cmake-3.10.2-Linux-x86_64 && export PATH=$PATH:$CMAKE_HOME/bin &&cmake ..
RUN export CMAKE_HOME=/cmake-3.10.2-Linux-x86_64 && export PATH=$PATH:$CMAKE_HOME/bin &&make
RUN export CMAKE_HOME=/cmake-3.10.2-Linux-x86_64 && export PATH=$PATH:$CMAKE_HOME/bin &&make install
#ADD www.conf /data/server/php735/etc/php-fpm.d/www.conf
#ADD php-fpm.conf /data/server/php735/etc/php-fpm.conf
#ADD php.ini /data/server/php735/etc/php.ini
RUN echo "/usr/local/lib64" >>/etc/ld.so.conf && ldconfig -v 
#RUN rpm -e gcc && rpm -e gcc-c++ 
#RUN rpm -e cpp 

#RUN useradd -M -s /sbin/nologin www
ADD  nginx199.tar.gz /data/server
RUN mkdir -p /data/logs/nginx/access
RUN chown -R www.www /data/logs/nginx
RUN chown -R www.www /data/server/nginx
RUN mkdir /data/wwwroot

RUN echo "<?php phpinfo(); ?>" >/data/wwwroot/iphp.php
RUN echo "OK" >/data/wwwroot/ihtml.html

RUN chown -R www.www /data/wwwroot
#ADD nginx.conf /data/server/nginx/conf/nginx.conf
#ADD www.conf /data/server/nginx/conf/webconfig/www.conf

WORKDIR /data/server

RUN yum remove make -y
#RUN rpm -e make
RUN rm -rf /libzip-1.5.1/build 
RUN rm -rf /cmake-3.10.2-Linux-x86_64
RUN yum clean all

#EXPOSE 9006 80 443
#test 81 1443
#preview 82 2443
#production 83 3443
EXPOSE 9006 81 82 83 1443 2443 3443

ENTRYPOINT /data/server/nginx/sbin/nginx && /data/server/php735/sbin/php-fpm && tail -f /data/logs/nginx/access/default_access.log

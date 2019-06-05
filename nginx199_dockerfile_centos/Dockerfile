#FROM centos:7.6
FROM centos:latest
MAINTAINER rui.chen@163.com
RUN useradd -M -s /sbin/nologin www
ADD  nginx199.tar.gz /data/server
RUN mkdir -p /data/logs/nginx/access
RUN chown -R www.www /data/logs/nginx
RUN chown -R www.www /data/server/nginx
#ADD nginx.conf /data/server/nginx/conf/nginx.conf
#ADD www.conf /data/server/nginx/conf/webconfig/www.conf
EXPOSE 80 443
#ENTRYPOINT ["/start.sh"]

ENTRYPOINT /data/server/nginx/sbin/nginx && tail -f /data/logs/nginx/access/default_access.log
#ENTRYPOINT ["/bin/bash","/data/server/nginx/sbin/nginx","-c","/data/server/nginx/conf/nginx.conf"]
#ENTRYPOINT /data/server/nginx/sbin/nginx

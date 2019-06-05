cat >/usr/lib/systemd/system/php-fpm7218.service <<EOF
# It's not recommended to modify this file in-place, because it
# will be overwritten during upgrades.  If you want to customize,
# the best way is to use the "systemctl edit" command.

[Unit]
Description=The PHP FastCGI Process Manager
After=network.target

[Service]
Type=simple
PIDFile=/data/server/php7218/var/run/php-fpm.pid
ExecStart=/data/server/php7218/sbin/php-fpm --nodaemonize --fpm-config /data/server/php7218/etc/php-fpm.conf
ExecReload=/bin/kill -USR2 $MAINPID
ExecStop=/bin/kill -SIGINT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF
systemctl enable /usr/lib/systemd/system/php-fpm7218.service

systemctl start php-fpm728.service

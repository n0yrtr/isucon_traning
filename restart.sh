#!/bin/bash

LOG=/var/log

cd /home/isucon/cco/webapp/go
git pull
make
sudo service nginx stop
sudo mv $LOG/nginx/access.log $LOG/nginx/access.log.bak_$(date +%Y%m%d%H%M%S)
sudo mv $LOG/nginx/error.log $LOG/nginx/error.log.bak_$(date +%Y%m%d%H%M%S)
sudo service nginx start

sudo service isu_app stop
sudo mv $LOG/isu_app.log $LOG/isu_backup/isu_app.log.bak_$(date +%Y%m%d%H%M%S)
sudo mv $LOG/isu_app_err.log $LOG/isu_backup/isu_app_err.log.bak_$(date +%Y%m%d%H%M%S)
sudo service isu_app start

sudo service mysql stop
sudo mv $LOG/mysql/slow_query.log $LOG/mysql/slow_query.log.bak_$(date +%Y%m%d%H%M%S)
sudo mv $LOG/mysql/error.log $LOG/mysql/error.log.bak_$(date +%Y%m%d%H%M%S)
sudo service mysql start

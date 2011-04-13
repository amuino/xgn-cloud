# Run with the following line in the user-data parameter when launching an instance
# #!/bin/bash 
# curl https://github.com/amuino/xgn-cloud/raw/master/setup.sh | bash > /home/ubuntu/setup.out 2> /home/ubuntu/setup.err ; chown ubuntu:ubuntu /home/ubuntu/setup.*

export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get upgrade -y

# RVM
curl -s https://rvm.beginrescueend.com/install/rvm | /bin/bash

adduser ubuntu rvm

sudo apt-get -y install build-essential bison openssl libreadline5 libreadline5-dev curl git-core zlib1g zlib1g-dev libssl-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev libmysqlclient-dev

source /usr/local/lib/rvm

rvm install 1.9.2
rvm use 1.9.2 --default

# MySQL

apt-get -y install mysql-client mysql-server

# Phusion Pasenger
apt-get -y install libcurl4-openssl-dev apache2-mpm-prefork apache2-prefork-dev libapr1-dev libaprutil1-dev

gem install passenger

passenger-install-apache2-module

echo "Worked" > /root/startup_script
# Run with the following line in the user-data parameter when launching an instance
# #!/bin/bash 
# curl https://github.com/amuino/xgn-cloud/raw/master/setup.sh | bash > /home/ubuntu/out 2> /home/ubuntu/err ; chown ubuntu:ubuntu /home/ubuntu/setup.*

set -x # log every command
set -e # exit on first error

export DEBIAN_FRONTEND=noninteractive

apt-get update

# not needed for a demo
# apt-get upgrade -y

# RVM
echo ==
echo == instalando RVM
echo ==
apt-get -y install git-core
curl -s https://rvm.beginrescueend.com/install/rvm | /bin/bash

adduser ubuntu rvm

echo ==
echo == instalando Ruby 1.9.2
echo ==

apt-get -y install build-essential bison openssl libreadline5 libreadline5-dev curl zlib1g zlib1g-dev libssl-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev libmysqlclient-dev

rvm install 1.9.2-p180
rvm use 1.9.2-p180 --default

gem install bundler --no-ri --no-rdoc

# MySQL
echo ==
echo == instalando MySQL
echo ==

apt-get -y install mysql-client mysql-server

# Phusion Pasenger
echo ==
echo == instalando Phusion Passenger
echo ==

apt-get -y install libcurl4-openssl-dev apache2-mpm-prefork apache2-prefork-dev libapr1-dev libaprutil1-dev
gem install passenger -v 3.0.3 --no-ri --no-rdoc
/usr/local/rvm/gems/ruby-1.9.2-p180/gems/passenger-3.0.3/bin/passenger-install-apache2-module -a

sh -c 'echo "LoadModule passenger_module /usr/local/rvm/gems/ruby-1.9.2-p180/gems/passenger-3.0.3/ext/apache2/mod_passenger.so" > /etc/apache2/mods-available/passenger.load'
sh -c 'echo "<IfModule mod_passenger.c>\n  PassengerRoot /usr/local/rvm/gems/ruby-1.9.2-p180/gems/passenger-3.0.3\n  PassengerRuby /usr/local/rvm/wrappers/ruby-1.9.2-p180/ruby\n</IfModule>" > /etc/apache2/mods-available/passenger.conf'

sudo a2enmod passenger

curl -s https://github.com/amuino/xgn-cloud/raw/master/prepare-site.sh | /bin/bash

/etc/init.d/apache2 restart

echo "Worked" > /root/startup_script
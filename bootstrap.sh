#!/bin/bash
# Install PHP 7
sudo apt-get update
sudo add-apt-repository ppa:ondrej/php
sudo apt-get install php7.0 -y
sudo apt-get update
sudo apt-get install -y php7.0-mysql libapache2-mod-php7.0 php7.0-fpm php7.0-json php7.0-xmlrpc php7.0-cgi php7.0-opcache php7.0-zip php7.0-imap php7.0-curl php7.0-xml php7.0-gd php7.0-mbstring

sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php7.0-fpm

sudo a2dismod php5
sudo a2enmod php7.0
sudo apachectl restart
sudo service apache2 reload
############################################################
# Dockerfile to build Catchall HTTP container images
# Based on php:7.2
############################################################

# Set the base image to php:7.2
FROM php:7.2-apache

# File Author / Maintainer
MAINTAINER Probably Rational Ltd.

# Enviromental vars
ENV GIT_NAME "Probably Rational Ltd"
ENV GIT_EMAIL "git@probablyrational.com"

#Set the work directory
WORKDIR /var/www

# Installl a sweet ass profile
RUN curl -o ~/.bashrc https://gist.githubusercontent.com/hcaz/1f98157bd8ae8c647ffb3ab243d69fc8/raw/.bashrc
COPY motd /etc/motd
RUN chmod 600 /etc/motd

# Update the repository sources list
RUN apt update

# Install essentials
RUN apt install -y git curl wget zip unzip htop nano ncdu screen sshfs sl cowsay python-minimal openssh-server xfonts-base xfonts-75dpi fontconfig xvfb libjpeg62 libxrender1 zlib1g-dev cron libmcrypt-dev libreadline-dev libssl-dev libcurl4-openssl-dev pkg-config libxml2-dev libfreetype6-dev libmcrypt-dev libjpeg-dev libpng-dev monit supervisor gnupg

# Configure PHP
COPY php.ini-production /usr/local/etc/php/php.ini
RUN docker-php-ext-configure gd --enable-gd-native-ttf --with-freetype-dir=/usr/include/freetype2 --with-png-dir=/usr/include --with-jpeg-dir=/usr/include
RUN docker-php-ext-install bcmath calendar ctype curl dba dom exif fileinfo mbstring mysqli pdo_mysql ftp gd sockets hash iconv json zip simplexml

# Install Composer
RUN mkdir -p ~/.composer/vendor/bin
RUN curl -o installer.php https://getcomposer.org/installer && php installer.php --install-dir ~/.composer/vendor/bin && rm installer.php

# Install laravel
RUN php ~/.composer/vendor/bin/composer.phar global require "laravel/installer"

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt install -y nodejs

# Install APIdoc
RUN npm install apidoc -g

# Clean up
RUN rm -rf /var/www/*

# Gen SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-pr.key -out /etc/ssl/certs/ssl-cert-pr.pem -subj "/C=GB/ST=Lincoln/L=Lincoln/O=Security/OU=Internal/CN=hls.me"

# Configure apache
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod status rewrite ssl

# Copy in required files
COPY app/ /var/www/public/

# Add a crontab
RUN touch crontab.tmp && echo '*/5 * * * * curl -fsS --retry 3 https://hchk.io/$healthcheck > /dev/null' > crontab.tmp && crontab crontab.tmp && rm -rf crontab.tmp

# Make composer work globally ;)
RUN mv ~/.composer/vendor/bin/composer.phar ~/.composer/vendor/bin/composer

# Setup Monit
COPY monitrc /etc/monit/monitrc
RUN chmod 600 /etc/monit/monitrc

# Configure supervisor
COPY laravel-worker.conf /etc/supervisor/conf.d/laravel-worker.conf

# Expose ports
EXPOSE 80
EXPOSE 443
EXPOSE 2812

# Expose folders
VOLUME /var/www /root/.ssh /var/log/apache2 /etc/monit

# Run
COPY entry.sh /root/entry.sh
ENTRYPOINT sh /root/entry.sh && /bin/bash

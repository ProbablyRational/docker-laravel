#!/bin/bash
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
service ssh start
service apache2 start
monit
if [ "$GIT_PULL" != "" ]; then
	if [ ! -f /var/www/.git/config ]; then
		rm -rf ..?* .[!.]* *
		git clone $GIT_PULL .
		/root/.composer/vendor/bin/composer install
		chmod 777 /var/www -R
		php artisan config:cache
	else
		git reset --hard HEAD
		git clean -f -d
		git pull;
		/root/.composer/vendor/bin/composer install
		chmod 777 /var/www -R
		php artisan config:cache
	fi
fi

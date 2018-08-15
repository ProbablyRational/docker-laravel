git config --global user.name "$GIT_NAME" &&
git config --global user.email "$GIT_EMAIL" &&
service ssh start &&
service apache2 start &&
monit &&
[ "${GIT_PULL}" ] && rm -rf ..?* .[!.]* * && git clone $GIT_PULL . && /root/.composer/vendor/bin/composer install && chmod 777 /var/www -R && php artisan config:cache || clear &&
clear
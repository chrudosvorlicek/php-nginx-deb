#!/bin/sh

mkdir -p \
    /usr/local/etc/php \
    /usr/local/etc/php/php-fpm.d

cp /opt/preset/conf/fpm/php-fpm.conf \
    /opt/preset/conf/fpm/php.ini \
    /usr/local/etc/php

cp /opt/preset/conf/fpm/www.conf \
    /usr/local/etc/php/php-fpm.d

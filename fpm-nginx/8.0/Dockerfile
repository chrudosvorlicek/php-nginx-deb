FROM php:8.0-fpm-buster

COPY ./fpm-nginx/8.0/init.d /opt/preset/init.d
RUN chmod +x /opt/preset/init.d/*

COPY ./fpm-nginx/8.0/conf /opt/preset/conf
COPY ./fpm-nginx/8.0/preset.sh /usr/local/bin/preset
COPY ./fpm-nginx/8.0/docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x \
    /usr/local/bin/preset \
    /usr/local/bin/docker-entrypoint

RUN  preset install basic \
    && preset install nginx \
    && preset install fpm \
    && preset install supervisor \
    && preset install composer \
    && preset install xdebug \
    && preset config laravel

WORKDIR /var/www/

ENTRYPOINT [ "docker-entrypoint"]

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]

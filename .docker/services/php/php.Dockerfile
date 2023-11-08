FROM php:8.2-fpm-alpine AS dev

ENV APP_ENV=dev

USER root

COPY --chown=app:app . /opt/app

WORKDIR /opt/app

RUN curl -sS https://getcomposer.org/installer | php \
        && mv composer.phar /usr/local/bin/ \
        && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

RUN composer install -o

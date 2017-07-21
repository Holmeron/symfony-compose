FROM php:7.0-fpm

ARG project

RUN echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list \
&& curl https://www.dotdeb.org/dotdeb.gpg | apt-key add -

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y \
    php7.0-fpm \
    php7.0-cli \
    php7.0-intl \
    php7.0-xml \
    php7.0-mysql \
    php7.0-sqlite3 \
    php7.0-zip \
    git

RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


ADD php-fpm/$project.ini /etc/php/7.0/fpm/php.ini
ADD php-fpm/$project.conf /etc/php/7.0/fpm/pool.d/

RUN usermod -u 1000 www-data

WORKDIR /var/www/$project

CMD ["php-fpm", "-F"]

VOLUME "/var/www/$project"

EXPOSE 9000

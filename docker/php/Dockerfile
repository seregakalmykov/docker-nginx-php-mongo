FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
        git \
        zip \
        unzip \
        libmcrypt-dev \
        libcurl4-openssl-dev \
        libssl-dev \
        librsvg2-bin \
        librsvg2-2 \
        librsvg2-dev \
        libmagickwand-dev \
        libmagickcore-dev \
        libboost-all-dev \
        gperf \
        libevent-dev \
        uuid-dev \
        libgearman-dev \
        libgeoip-dev \
        libzip-dev \
        openssl

RUN docker-php-ext-install gd \
    && pecl install mcrypt-1.0.3 \
    && echo "extension=mcrypt.so" >> /usr/local/etc/php/conf.d/mcrypt.ini \
    && docker-php-ext-enable mcrypt

RUN docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-enable intl

# mongodb
RUN pecl install mongodb \
		&& echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

RUN docker-php-ext-install mysqli

# composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./php.ini /usr/local/etc/php/conf.d/php.ini
COPY ./www.conf /usr/local/etc/php-fpm.d/www.conf

WORKDIR /var/www

EXPOSE 9000

CMD ["php-fpm"]
FROM php:8.2-fpm

RUN apt-get update \
    && apt-get install -y --no-install-recommends vim curl debconf subversion git apt-transport-https apt-utils \
    build-essential locales acl mailutils wget zip unzip libmcrypt-dev libxslt-dev zlib1g-dev \
    gnupg gnupg1 gnupg2 nodejs

RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip
  
RUN docker-php-ext-install pdo pdo_mysql

COPY php.ini /etc/php/8.2/php.ini
COPY php.ini /usr/local/etc/php/
COPY php-fpm-pool.conf /etc/php/8.2/pool.d/www.conf

RUN curl -sSk https://getcomposer.org/installer | php -- --disable-tls && \
   mv composer.phar /usr/local/bin/composer

RUN groupadd dev -g 999
RUN useradd dev -g dev -d /home/dev -m

RUN rm -rf /var/lib/apt/lists/*
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen

WORKDIR /home/wwwroot/

EXPOSE 9000
CMD ["php-fpm"]

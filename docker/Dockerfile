FROM php:7.4-fpm

USER root

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
        libpng-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        zip \
        curl \
        unzip \
        git \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-source delete

RUN pecl install redis \
    && docker-php-ext-enable redis

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs

RUN curl -fsSL https://code-server.dev/install.sh | sh
EXPOSE 8083

RUN groupadd --gid 1000 phpuser \
    && useradd --uid 1000 --gid phpuser --shell /bin/bash --create-home phpuser

RUN mkdir /var/lib/code-server
RUN chown phpuser -R /var/lib/code-server

ADD start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
USER phpuser

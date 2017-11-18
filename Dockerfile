FROM jojimail/php-nginx-ubuntu:17.04
MAINTAINER Joji Augustine "jojimail@gmail.com"

RUN apt-get update && apt-get install -y \
        php-imagick \
        libvips \
        libvips-dev \
        php-pear \
        php-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install vips
RUN echo "extension=vips.so" > /etc/php/7.0/mods-available/vips.ini
RUN phpenmod vips

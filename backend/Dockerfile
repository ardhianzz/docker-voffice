# Gunakan PHP 7.3 dengan Apache sebagai base image
FROM php:7.2-apache

# Install ekstensi PHP yang dibutuhkan
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libzip-dev \
    libonig-dev \
    unzip \
    git \
    libpq-dev \
    && docker-php-ext-install \
    mbstring \
    gd \
    zip \
    xml \
    opcache \
    pdo \
    pdo_pgsql \
    && a2enmod rewrite

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Salin semua file ke kontainer
COPY . /var/www/html/
COPY ./.env .

# Atur izin
RUN chown -R root:www-data /var/www/html

# Install dependensi dengan Composer
#RUN COMPOSER_ALLOW_SUPERUSER=1 composer install --no-interaction

# Set memory limit PHP
RUN echo "memory_limit=1280M" > /usr/local/etc/php/conf.d/memory-limit.ini

# Expose port 80
EXPOSE 80

# Jalankan Apache
CMD ["apache2-foreground"]


COPY laravel.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
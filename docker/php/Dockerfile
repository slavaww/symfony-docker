FROM php:8.4-fpm

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y \
    unzip \
    libzip-dev \
    libpq-dev \
    libicu-dev \
    libxml2-dev \
    libssl-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        zip \
        pdo_mysql \
        mysqli \
        intl \
        xml \
        opcache \
        gd \
        mbstring \
        bcmath \
        sockets \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Устанавливаем Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Настройки PHP
COPY docker/php/php.ini /usr/local/etc/php/conf.d/custom.ini

# Рабочая директория
WORKDIR /var/www

# Копируем только если файлы существуют (чтобы не падало при первом запуске)
COPY composer.json* composer.lock* ./

# Если composer.json существует — устанавливаем зависимости
RUN if [ -f composer.json ]; then \
      composer install --no-dev --no-scripts --no-autoloader; \
    fi

# Копируем исходники (кроме игнорируемых файлов)
COPY . .

# Если composer.json существует — оптимизируем автозагрузку
RUN if [ -f composer.json ]; then \
      composer dump-autoload --optimize; \
    fi
# Добавляем entrypoint
COPY docker/php/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["php-fpm"]

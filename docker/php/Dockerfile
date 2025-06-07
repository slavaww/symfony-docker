FROM php:8.4-fpm

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libpq-dev \
    && docker-php-ext-install zip pdo_mysql \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

# Устанавливаем Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

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
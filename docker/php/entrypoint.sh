#!/bin/bash

set -e

cd /var/www

# Если composer.json отсутствует — создаём новый проект Symfony
if [ ! -f composer.json ]; then
    composer create-project symfony/skeleton:"7.3.*" .
    composer require webapp
fi

# Запуск PHP-FPM
exec "$@"
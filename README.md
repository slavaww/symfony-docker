# Sceleton Symfony 7.3 in docker

## Overview

This is a Docker-based development environment for Symfony projects. The repository provides a ready-to-use setup with Docker containers configured for Symfony application development.

##  Project Structure
```
symfony-docker/
├── .docker/             - Docker service configurations
│   ├── nginx/           - Nginx web server configuration
│        ├── default.conf
│   ├── php/             - PHP-FPM configuration
│        ├── Dockerfile
│        ├── entrupoint.sh
│        ├── php.ini
├── .env                 - Environment variables
├── docker-compose.yml   - Main Docker compose file
└── README.md            - Project documentation
```

## Key Components
- *Web Server*: Nginx configured for Symfony
- *Application Server: PHP-FPM 8.4 with essential extensions
- *Database*: MySQL 8
- *DB Manager*: Adminer
- *Environment Management*: Dotenv configuration

## Features
* Preconfigured for Symfony development
* Separate containers for each service
* Environment variables management
* Ready-to-use Symfony commands
* Optimized PHP configuration for development
* Nginx with proper Symfony rewrite rules

## Usage
1. Clone the repository
2. Edit .env and adjust values
3. Run `docker compose up --build -d` (or `docker-compose up --build -d`) to build containers

Access the application at http://localhost


__Русский__

## Обзор

Это Docker-окружение для разработки Symfony проектов. Репозиторий предоставляет готовую к использованию конфигурацию с Docker-контейнерами, настроенными для разработки Symfony приложений.

## Структура проекта
```
symfony-docker/
├── .docker/             - Docker service configurations
│   ├── nginx/           - Nginx web server configuration
│        ├── default.conf
│   ├── php/             - PHP-FPM configuration
│        ├── Dockerfile
│        ├── entrupoint.sh
│        ├── php.ini
├── .env                 - Environment variables
├── docker-compose.yml   - Main Docker compose file
└── README.md            - Project documentation
```

## Основные компоненты
* Веб-сервер: Nginx, настроенный для Symfony
* Сервер приложений: PHP-FPM 8.2 с необходимыми расширениями
* База данных: MySQL 8
* Менеджер базы данных: Adminer
* Управление окружением: Конфигурация Dotenv

## Особенности
* Предварительная настройка для разработки на Symfony
* Отдельные контейнеры для каждого сервиса
* Управление переменными окружения
* Готовые к использованию команды в Symfony
* Оптимизированная конфигурация PHP для разработки
* Nginx с правильными правилами rewrite для Symfony

## Использование
1. Клонируйте репозиторий
2. Скопируйте .env.dist в .env и настройте значения
3. Выполните `docker compose up --build -d` (or `docker-compose up --build -d`) для сборки контейнеров

Приложение будет доступно по адресу http://localhost

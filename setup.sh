#!/bin/bash

set -e  # Прерывать выполнение при ошибках

echo "Начало установки Django проекта..."

echo "Создание директорий..."
mkdir -p certbot/conf
mkdir -p certbot/www

echo "Настройка прав доступа..."
chmod -R 755 certbot

echo "Сборка Docker образов и запуск контейнеров..."
docker compose -f docker-compose.prod.yml up -d --build

echo "Ожидание запуска PostgreSQL..."
sleep 15

echo "Применение миграций..."
docker compose -f docker-compose.prod.yml exec web python manage.py migrate --noinput

echo "Сборка статических файлов..."
docker compose -f docker-compose.prod.yml exec web python manage.py collectstatic --noinput

#!/bin/bash

set -e  # Прерывать выполнение при ошибках

echo "Начало установки Django проекта..."

echo "Сборка Docker образов и запуск контейнеров..."
docker compose -f docker-compose.prod.yml up -d --build

echo "Ожидание запуска PostgreSQL..."
sleep 15

echo "Применение миграций..."
docker compose -f docker-compose.prod.yml exec web python manage.py migrate --noinput

echo "Сборка статических файлов..."
docker compose -f docker-compose.prod.yml exec web python manage.py collectstatic --noinput

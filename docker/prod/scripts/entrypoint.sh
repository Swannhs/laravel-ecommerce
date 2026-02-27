#!/usr/bin/env sh
set -e

cd /var/www/html

mkdir -p storage/framework/cache/data storage/framework/sessions storage/framework/views bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache || true

if [ ! -L public/storage ]; then
  php artisan storage:link --no-interaction || true
fi

php artisan package:discover --ansi --no-interaction || true

if [ "${RUN_MIGRATIONS:-false}" = "true" ]; then
  php artisan migrate --force --no-interaction || true
fi

php artisan config:cache --no-interaction || true
php artisan view:cache --no-interaction || true

exec "$@"

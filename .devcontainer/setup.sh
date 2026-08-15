#!/usr/bin/env bash
set -euo pipefail

echo "=== [1/6] Update apt & install base utilities ==="
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  ca-certificates gnupg lsb-release software-properties-common \
  curl wget git unzip zip vim nano acl

echo "=== [2/6] Add PHP (ondrej) repository ==="
# Default Ubuntu 22.04 PHP is 8.1; we pull 8.2 which Laravel 10/11 fully support.
add-apt-repository -y ppa:ondrej/php
apt-get update -y

echo "=== [3/6] Install PHP 8.2 + common extensions ==="
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  php8.2 php8.2-cli php8.2-fpm \
  php8.2-common php8.2-curl php8.2-mbstring php8.2-xml php8.2-zip \
  php8.2-bcmath php8.2-intl php8.2-gd php8.2-mysql php8.2-sqlite3 \
  php8.2-dom php8.2-tokenizer php8.2-fileinfo php8.2-exif php8.2-soap \
  php8.2-opcache

echo "=== [4/6] Install Composer ==="
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"
composer --version

echo "=== [5/6] Install MySQL server ==="
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends mysql-server
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
service mysql start || mysqld_safe --user=mysql &
# give it a moment, then ensure running
sleep 5
service mysql status || true

echo "=== [6/6] Install Node.js (Vite/Mix asset build requirement) ==="
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends nodejs
node --version
npm --version

echo "=== Runtime requirements installation complete ==="
php --version
composer --version
node --version
mysql --version

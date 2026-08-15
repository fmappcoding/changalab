#!/usr/bin/env bash
# ChangaLab Codespace bootstrap: installs nginx + PHP-FPM + MariaDB,
# applies the bundled nginx config, prepares the DB and storage permissions.
# Run automatically by .devcontainer/devcontainer.json (postCreateCommand).
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
APP_DIR="/workspaces/changalab"
WEB_DIR="$APP_DIR/Files"

echo "==> Updating apt"
sudo apt-get update

echo "==> Installing nginx, PHP-FPM and MariaDB"
sudo apt-get install -y --no-install-recommends \
  nginx \
  php8.3-fpm php8.3-cli php8.3-mysql php8.3-mbstring php8.3-xml \
  php8.3-curl php8.3-zip php8.3-gd php8.3-bcmath \
  mariadb-server unzip git

echo "==> Installing Composer deps"
if [ -f "$WEB_DIR/core/composer.json" ] && ! [ -d "$WEB_DIR/core/vendor" ]; then
  (cd "$WEB_DIR/core" && composer install --no-interaction --prefer-dist)
fi

echo "==> Applying nginx site config"
sudo cp "$APP_DIR/changalab.nginx" /etc/nginx/sites-available/changalab
sudo ln -sf /etc/nginx/sites-available/changalab /etc/nginx/sites-enabled/changalab
sudo rm -f /etc/nginx/sites-enabled/default

echo "==> Starting services"
sudo service mysql start
sudo service php8.3-fpm start
sudo nginx -t && sudo service nginx start || sudo service nginx restart

echo "==> Creating database and user"
sudo mysql -e "CREATE DATABASE IF NOT EXISTS changalab CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
sudo mysql -e "CREATE USER IF NOT EXISTS 'changalab'@'localhost' IDENTIFIED BY 'changalab123';"
sudo mysql -e "GRANT ALL PRIVILEGES ON changalab.* TO 'changalab'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

echo "==> Fixing storage permissions (installer requires 0775)"
sudo chown -R codespace:www-data "$WEB_DIR/core/storage" "$WEB_DIR/core/bootstrap/cache" 2>/dev/null || true
mkdir -p "$WEB_DIR/core/storage/app/public"
chmod -R 0775 "$WEB_DIR/core/storage" "$WEB_DIR/core/bootstrap/cache"

echo "==> Done. Open the forwarded 8080 port and visit /install to complete setup."

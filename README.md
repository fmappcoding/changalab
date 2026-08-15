# ChangaLab

**ChangaLab** — منصة شحن الرصيد ودفع الفواتير (Recharge & Bill Payment Platform).

مشروع PHP مبني على Laravel، يحتوي على لوحة تحكم إدارية ونظام تثبيت (installer) وقوالب واجهة.

## محتويات المستودع

- `Files/` — الكود المصدري للتطبيق (نواة Laravel + الأصول + ملف التثبيت)
  - `Files/core` — نواة Laravel والتطبيق
  - `Files/assets` — أصول الواجهة (CSS/JS/صور/قوالب)
  - `Files/install` — معالج التثبيت وقاعدة البيانات
  - `Files/index.php` — نقطة الدخول
- `Documentation/` — توثيق الاستخدام ولوحة التحكم
- `changalab.nginx` — إعداد nginx المرجعي لبيئة Codespace
- `.devcontainer/` — إعداد تلقائي لـ Codespace (يُهيّئ الخدمات وقاعدة البيانات عند الإنشاء)

## المتطلبات

- PHP >= 8.1 (مُختبر على 8.3)
- Composer
- خادم ويب (Apache / Nginx)
- قاعدة بيانات MySQL / MariaDB

---

## التشغيل على GitHub Codespaces

المشروع مُهيّأ للعمل داخل Codespace خلف بروكسي `*.app.github.dev` (المنفذ 8080).
يوجد مجلد `.devcontainer/` يُثبّت nginx + PHP-FPM + MariaDB ويطبّق إعداد nginx ويهيّئ
قاعدة البيانات والصلاحيات **تلقائياً** عند إنشاء الـ Codespace. يكفي بعدها فتح المتصفح
وإكمال معالج التثبيت.

### 1. إنشاء الـ Codespace

- من صفحة المستودع اضغط **Code → Codespaces → Create codespace on main**.
- أو عبر CLI:

  ```bash
  gh codespace create --repo fmappcoding/changalab --branch main
  ```

> عند الإنشاء يُنفَّذ `.devcontainer/setup.sh` تلقائياً (تثبيت الخدمات + إعداد nginx + إنشاء
> قاعدة البيانات + صلاحيات `storage`). إن لم يُنفَّذ تلقائياً، شغّله يدوياً:
>
> ```bash
> gh codespace ssh --codespace <CODESPACE_NAME> -- "bash /workspaces/changalab/.devcontainer/setup.sh"
> ```

### 2. (يدوي فقط) تثبيت الخدمات داخل الـ Codespace

ادخل إلى الـ Codespace عبر الطرفية:

```bash
gh codespace ssh --codespace <CODESPACE_NAME>
```

ثم نفّذ (تثبيت nginx + PHP-FPM + MariaDB):

```bash
sudo apt-get update
sudo apt-get install -y nginx php8.3-fpm php8.3-mysql php8.3-mbstring php8.3-xml php8.3-curl php8.3-zip php8.3-gd mariadb-server
sudo service nginx start
sudo service php8.3-fpm start
sudo service mysql start
```

### 3. (يدوي فقط) إعداد nginx

انسخ إعداد `changalab.nginx` المرفق إلى موقع المواقع:

```bash
sudo cp changalab.nginx /etc/nginx/sites-available/changalab
sudo ln -sf /etc/nginx/sites-available/changalab /etc/nginx/sites-enabled/changalab
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t && sudo nginx -s reload
```

> **مهم:** إعداد nginx يحتوي على `server_name $host;` و `absolute_redirect off;`
> وهما ضروريان حتى لا يعيد nginx توجيهك إلى `http://localhost:8080` عند فتح `/install`.

### 4. (يدوي فقط) تجهيز قاعدة البيانات

```bash
sudo mysql -e "CREATE DATABASE changalab CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
sudo mysql -e "CREATE USER IF NOT EXISTS 'changalab'@'localhost' IDENTIFIED BY 'changalab123';"
sudo mysql -e "GRANT ALL PRIVILEGES ON changalab.* TO 'changalab'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"
```

### 5. (يدوي فقط) الصلاحيات المطلوبة

معالج التثبيت يتطلب صلاحية `0775` على هذه المجلدات، ولذلك أنشئها إذا لم تكن موجودة:

```bash
cd /workspaces/changalab/Files
sudo chown -R $(whoami):www-data core/storage core/bootstrap/cache
mkdir -p core/storage/app/public
chmod -R 0775 core/storage core/bootstrap/cache
```

### 6. التثبيت عبر المتصفح

افتح رابط الـ Codespace على المنفذ 8080، مثلاً:

```
https://<CODESPACE_NAME>-8080.app.github.dev/
```

ثم اذهب إلى `/install` وأكمل معالج التثبيت:

- **Database Host:** `127.0.0.1`
- **Database Port:** `3306`
- **Database Name:** `changalab`
- **Database User:** `changalab`
- **Database Password:** `changalab123`

> تأكد أن قاعدة البيانات **فارغة** قبل الاستيراد، وإلا سيظهر خطأ
> *"Problem Occurred When Importing Database!"*. لإفراغها:

```bash
sudo mysql changalab -e "DROP DATABASE changalab; CREATE DATABASE changalab CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
```

### 7. حل مشكلة الأصول (CSS/JS) — `localhost:8080`

خلف بروكسي Codespace يولّد Laravel عناوين الأصول كـ `http://localhost:8080/...`
وهي غير قابلة للوصول من الخارج (صفحة بلا تنسيق). هذا مُصلَح مسبقاً في المستودع:

- `Files/index.php` يقرأ ترويسات `X-Forwarded-Host` / `X-Forwarded-Proto` ويضبط المضيف قبل بدء Laravel.
- `Files/core/app/Http/Middleware/TrustProxies.php` (مسجّل في `bootstrap/app.php`) يُعلّم Laravel بثقة البروكسي.

بعد التثبيت نظّف الكاش:

```bash
cd /workspaces/changalab/Files/core && php artisan optimize:clear
sudo service php8.3-fpm restart
```

---

## التثبيت المحلي (خارج Codespace)

1. شغّل `composer install` داخل `Files/core`.
2. انسخ `Files/core/.env.example` إلى `Files/core/.env` وعدّل الإعدادات.
3. شغّل معالج التثبيت من `Files/install` عبر المتصفح.
4. وجّه نقطة الدخول (DocumentRoot) إلى `Files/` مع `index.php`.

## نصائح أمنية

- بعد نجاح التثبيت احذف مجلد `Files/install` لتعطيل معالج التثبيت:

  ```bash
  rm -rf /workspaces/changalab/Files/install
  ```

- غيّر كلمة مرور قاعدة البيانات الافتراضية (`changalab123`) في الإنتاج.

## الرخصة

حقوق ملكية ChangaLab.

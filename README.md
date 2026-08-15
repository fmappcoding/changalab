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

## المتطلبات

- PHP >= 8.1
- Composer
- خادم ويب (Apache / Nginx)
- قاعدة بيانات MySQL

## التثبيت

1. شغّل `composer install` داخل `Files/core`.
2. انسخ `.env.example` إلى `.env` وعدّل الإعدادات.
3. شغّل معالج التثبيت من `Files/install`.
4. وجّه نقطة الدخول إلى `Files/index.php`.

## الرخصة

حقوق ملكية ChangaLab.

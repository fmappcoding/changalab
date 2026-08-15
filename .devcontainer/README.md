# ChangaLab - إعداد بيئة Codespaces (تجهيز السيرفر فقط)

هذا المجلد (.devcontainer) يجهّز بيئة GitHub Codespaces لمشروع ChangaLab:
- صورة PHP 8.3 (تطابق متطلب composer.json: ^8.3)
- MySQL 8.0 (قاعدة بيانات: changalab / مستخدم: changalab / كلمة المرور: changalab)
- تثبيت إضافات PHP المطلوبة (bcmath, gd, mbstring, pdo_mysql, zip, intl, exif ...)
- تنفيذ `composer install` داخل `Files/core` تلقائيًا عند الإنشاء

## ما الذي لا يحدث (حسب الشرط)
- لا يُشغَّل خادم الويب (Apache) على الموقع
- لا يُستدعى معالج التثبيت (Files/install)
- لا يُفتح التطبيق — البيئة جاهزة فقط والمطوّر يقرر متى يشغّل

## كيف تستخدمها
1. في GitHub اضغط Code > Codespaces > Create codespace on devcontainer/setup
2. انتظر حتى ينتهي تجهيز البيئة وتثبيت الحزم
3. عند الرغبة بتشغيل التطبيق لاحقًا:
   - انسخ Files/core/.env.example إلى .env وعدّل إعدادات DB
   - شغّل معالج التثبيت من Files/install

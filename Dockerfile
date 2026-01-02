# استخدام صورة رسمية لـ PHP مع Apache
FROM php:8.2-apache

# تحديث النظام وتثبيت حزم أساسية (إن لزم)
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# تثبيت امتدادات قاعدة البيانات (الأهم!)
RUN docker-php-ext-install pdo pdo_mysql

# نسخ ملفات المشروع إلى مجلد الويب
COPY src/ /var/www/html/

# فتح المنفذ 80 (المنفذ الافتراضي لـ Apache)
EXPOSE 80

# لا حاجة لـ CMD — Apache يبدأ تلقائيًا في الصورة الرسمية
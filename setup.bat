@echo off
echo 🚀 Starting Restaurant Django Project setup...

REM 1) تأكد من وجود venv
if not exist venv (
    echo 📦 Creating virtual environment...
    py -3 -m venv venv
)

REM 2) تفعيل venv
call venv\Scripts\activate.bat

REM 3) تثبيت المكتبات
echo ⬇️ Installing requirements...
pip install -r requirements.txt

REM 4) عمل migrate
echo 🗄️ Applying migrations...
python manage.py migrate

REM 5) إنشاء superuser admin/1234 تلقائيًا لو مش موجود
echo 👤 Creating admin user (username=admin, password=1234)...
python manage.py shell -c "from django.contrib.auth import get_user_model; User=get_user_model(); import sys; \
sys.stdout.write('Creating admin...\\n') if not User.objects.filter(username='admin').exists() else sys.stdout.write('Admin already exists.\\n'); \
User.objects.create_superuser('admin','admin@example.com','1234') if not User.objects.filter(username='admin').exists() else None"

REM 6) تشغيل السيرفر
echo 🌐 Running Django server on http://127.0.0.1:8000 ...
python manage.py runserver

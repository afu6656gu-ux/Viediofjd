# استخدام نسخة بايثون خفيفة ومستقرة
FROM python:3.10-slim

# تثبيت الأدوات الأساسية (ffmpeg و aria2) المطلوبة للسكربت
RUN apt-get update && apt-get install -y ffmpeg aria2 && rm -rf /var/lib/apt/lists/*

# تحديد مسار العمل داخل الخادم
WORKDIR /app

# نسخ ملف المتطلبات وتثبيت مكتبات بايثون
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ جميع الملفات من جيت هب إلى الخادم
COPY . .

# أمر تشغيل البوت (تأكد أن اسم ملف الكود الخاص بك هو main.py)
CMD ["python", "main.py"]

# Gunakan image Python sebagai base
FROM python:3.9-slim

# Set direktori kerja di dalam container
WORKDIR /app

# Copy semua file dari direktori saat ini ke dalam container
COPY . .

# Install dependensi yang diperlukan
RUN pip install Flask

# Expose port 5000 untuk akses aplikasi
EXPOSE 5000

# Perintah untuk menjalankan aplikasi Flask
CMD ["python", "app.py"]

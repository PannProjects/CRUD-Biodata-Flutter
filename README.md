# Biodata Siswa App ✨

Selamat datang di repositori aplikasi **Biodata Siswa**. Aplikasi ini dirancang untuk mempermudah pengelolaan data siswa dengan antarmuka yang modern, responsif, dan mudah digunakan. Dibangun menggunakan kekuatan **Flutter** untuk frontend dan **PHP** untuk backend yang handal.

---

## 🚀 Fitur Utama

Aplikasi ini dilengkapi dengan fitur **CRUD** (Create, Read, Update, Delete) yang lengkap:

*   **📝 Tambah Data**: Input data siswa baru dengan formulir yang validatif.
*   **👀 Lihat Detail**: Tampilkan informasi lengkap siswa secara terperinci.
*   **✏️ Edit Data**: Perbarui informasi siswa kapan saja dengan mudah.
*   **🗑️ Hapus Data**: Hapus data yang tidak diperlukan dengan konfirmasi aman.

---

## 💻 Teknologi yang Digunakan

Kami menggunakan teknologi terkini untuk memastikan performa terbaik:

| Komponen | Teknologi | Deskripsi |
| :--- | :--- | :--- |
| **Frontend** | Flutter (Dart) | Framework UI multi-platform dari Google. |
| **Backend** | PHP Native | Bahasa server-side yang cepat dan fleksibel. |
| **Database** | MySQL (MariaDB) | Penyimpanan data relasional yang tangguh. |
| **Server** | Apache/Nginx | Web server untuk menjalankan API PHP. |

---

## 🛠️ Panduan Instalasi & Penggunaan

Ikuti langkah-langkah berikut untuk menjalankan aplikasi ini di komputer lokal Anda.

### 1. Persiapan Database & Backend

1.  Pastikan Anda telah menginstall **XAMPP** atau **Laragon**.
2.  Buka **phpMyAdmin** dan buat database baru dengan nama `sekolah`.
3.  **Import** file `sekolah.sql` (disertakan dalam repo ini) ke dalam database `sekolah`.
4.  Salin seluruh isi folder `kode php` ke dalam direktori server lokal Anda:
    *   **XAMPP**: `C:\xampp\htdocs\biodata`
    *   **Laragon**: `C:\laragon\www\biodata`
    *(Pastikan nama folder adalah `biodata` agar sesuai dengan konfigurasi bawaan).*

### 2. Konfigurasi Koneksi (Penting!) ⚠️

Aplikasi ini perlu tahu kemana harus menghubungi server. Sesuaikan file `lib/models/api.dart` berdasarkan perangkat yang Anda gunakan:

#### ➤ Menggunakan Emulator Android
Gunakan IP loopback khusus Android:
```dart
static String baseUrl = "http://10.0.2.2/biodata";
```

#### ➤ Menggunakan Browser (Chrome/Web)
Gunakan localhost standar:
```dart
static String baseUrl = "http://localhost/biodata";
```
*(Catatan: Untuk Web, pastikan `konekdb.php` sudah memiliki konfigurasi CORS).*

#### ➤ Menggunakan HP Fisik (USB/Wi-Fi)
Gunakan IP Address Laptop/PC Anda (pastikan satu jaringan):
```dart
static String baseUrl = "http://192.168.1.x/biodata"; // Cek IP dengan 'ipconfig'
```

### 3. Menjalankan Aplikasi

Buka terminal di dalam folder proyek ini, lalu jalankan perintah berikut:

```bash
# Mengunduh semua dependency
flutter pub get

# Menjalankan aplikasi
flutter run
```

---

## 📂 Struktur Proyek

*   `/lib` - Berisi seluruh kode sumber Flutter (Views, Models, Widgets).
*   `/kode php` - Berisi skrip API PHP (Create, Read, Update, Delete).
*   `sekolah.sql` - File dump database MySQL.

---

✨ *Dibuat dengan semangat belajar dan kode yang bersih.*

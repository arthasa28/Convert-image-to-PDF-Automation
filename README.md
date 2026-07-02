# 🖼️ Image to PDF Converter

Konversi file **JPG**, **JPEG**, dan **PNG** menjadi **PDF** secara otomatis menggunakan **ImageMagick** di Linux.

Script ini dibuat agar proses konversi menjadi lebih mudah, cepat, dan memiliki tampilan terminal yang modern seperti utility CLI profesional.

---

# ✨ Fitur

- ✅ Konversi JPG → PDF
- ✅ Konversi JPEG → PDF
- ✅ Konversi PNG → PDF
- ✅ Otomatis membuat folder output
- ✅ Progress loading (Spinner)
- ✅ Informasi file berhasil dan gagal
- ✅ Ringkasan hasil konversi
- ✅ Menghitung waktu proses
- ✅ Menghitung ukuran folder hasil
- ✅ Support Ubuntu, Debian, Kali Linux, Linux Mint, dan distro Linux lainnya

---

# 📂 Struktur Folder

Sebelum menjalankan script, susun folder seperti berikut.

```
Image-to-PDF/
│
├── convert-pdf.sh
├── README.md
│
├── Gambar-PDF/
│   ├── foto1.jpg
│   ├── foto2.png
│   ├── scan.jpeg
│   └── gambar.png
│
└── HASIL-PDF/
```

Keterangan:

| Folder | Fungsi |
|---------|--------|
| Gambar-PDF | Tempat menyimpan gambar yang ingin dikonversi |
| HASIL-PDF | Hasil PDF akan otomatis dibuat di sini |

> Folder **HASIL-PDF** akan dibuat otomatis jika belum ada.

---

# 📋 Persyaratan

Sebelum menggunakan script ini pastikan sudah menginstall:

- Bash
- ImageMagick

Cek apakah ImageMagick sudah terinstall

```bash
magick --version
```

Jika muncul informasi versi berarti sudah siap digunakan.

---

# 📥 Install ImageMagick

## Ubuntu / Debian

```bash
sudo apt update
sudo apt install imagemagick
```

## Arch Linux

```bash
sudo pacman -S imagemagick
```

## Fedora

```bash
sudo dnf install ImageMagick
```

---

# 🚀 Cara Menggunakan

## 1. Clone Repository

```bash
git clone https://github.com/USERNAME/Image-to-PDF.git
```

Masuk ke folder project

```bash
cd Image-to-PDF
```

---

## 2. Berikan Hak Akses

```bash
chmod +x convert-pdf.sh
```

Perintah ini membuat script dapat dijalankan.

---

## 3. Masukkan Gambar

Salin semua gambar ke folder

```
Gambar-PDF
```

Contoh

```
Gambar-PDF/
├── foto1.jpg
├── foto2.png
├── scan.jpeg
└── wallpaper.jpg
```

---

## 4. Jalankan Script

```bash
./convert-pdf.sh
```

atau

```bash
bash convert-pdf.sh
```

---

# 📤 Hasil

Semua file PDF akan tersimpan pada folder

```
HASIL-PDF
```

Contoh

```
HASIL-PDF/
├── foto1.pdf
├── foto2.pdf
├── scan.pdf
└── wallpaper.pdf
```

Nama file PDF akan mengikuti nama file gambar.

Contoh

```
foto1.jpg
```

menjadi

```
foto1.pdf
```

---

# 🖥️ Contoh Output

```
╔════════════════════════════════════════════════════╗
║             IMAGE TO PDF CONVERTER                ║
╚════════════════════════════════════════════════════╝

📂 Source : Gambar-PDF
📁 Output : HASIL-PDF
📄 Total  : 10 File

✔ foto1.jpg                          DONE
✔ foto2.png                          DONE
✔ scan.jpeg                          DONE
✖ gambar-rusak.jpg                   FAILED

════════════════════════════════════════════════════
                 CONVERSION REPORT
════════════════════════════════════════════════════

Total File      : 10
Success         : 9
Failed          : 1
Execution Time  : 3s
Output Folder   : HASIL-PDF
Output Size     : 21 MB

🎉 Semua file berhasil dikonversi!
```

---

# 📌 Cara Kerja Script

1. Membaca seluruh gambar dalam folder **Gambar-PDF**
2. Memeriksa apakah ImageMagick tersedia
3. Membuat folder **HASIL-PDF** jika belum ada
4. Mengubah setiap gambar menjadi PDF
5. Menampilkan status berhasil atau gagal
6. Menampilkan ringkasan proses

---

# 📄 Format yang Didukung

| Format | Support |
|---------|---------|
| JPG | ✅ |
| JPEG | ✅ |
| PNG | ✅ |

---

# ❓ FAQ

## Kenapa muncul "ImageMagick belum terinstall"?

Install terlebih dahulu.

Ubuntu

```bash
sudo apt install imagemagick
```

---

## Kenapa folder HASIL-PDF kosong?

Periksa apakah folder

```
Gambar-PDF
```

berisi gambar.

Script hanya membaca file

- JPG
- JPEG
- PNG

---

## Kenapa ada status FAILED?

Biasanya karena:

- File gambar rusak
- File bukan gambar asli
- Permission ditolak
- ImageMagick gagal membaca file

---

## Apakah kualitas gambar berubah?

Tidak.

Script hanya membungkus gambar ke dalam file PDF menggunakan ImageMagick.

---

## Apakah ukuran file PDF sama?

Tidak selalu.

Ukuran PDF tergantung:

- Resolusi gambar
- Format gambar
- Kompresi bawaan ImageMagick

---

# 📌 Contoh Struktur Repository

```
Image-to-PDF
│
├── convert-pdf.sh
├── README.md
├── LICENSE
│
├── Gambar-PDF
│
└── HASIL-PDF
```

---

# 🤝 Kontribusi

Kontribusi sangat diterima.

Silakan:

1. Fork Repository
2. Buat Branch baru

```
git checkout -b fitur-baru
```

3. Commit

```
git commit -m "Menambahkan fitur baru"
```

4. Push

```
git push origin fitur-baru
```

5. Buat Pull Request

---

# ⭐ Dukungan

Jika project ini membantu Anda, jangan lupa berikan ⭐ pada repository GitHub.

---

# 📜 Lisensi

Project ini menggunakan lisensi **MIT License**.

Silakan digunakan, dimodifikasi, maupun dikembangkan secara bebas.

---

## 👨‍💻 Author

**Artha Syarif Athaya**

GitHub:

https://github.com/USERNAME

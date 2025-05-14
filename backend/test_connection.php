<?php
$host = 'localhost';     // Host, biasanya localhost
$db = 'flutter_auth';    // Nama database yang digunakan
$user = 'root';          // Username untuk database (root pada XAMPP)
$pass = '';              // Password, biasanya kosong jika menggunakan XAMPP default

// Membuat koneksi ke database
$conn = new mysqli($host, $user, $pass, $db);

// Mengecek apakah koneksi berhasil
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
} else {
    echo "Koneksi ke database berhasil!";
}

// Menutup koneksi
$conn->close();
?>

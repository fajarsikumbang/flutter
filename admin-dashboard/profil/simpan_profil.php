<?php
include '../../backend/db.php'; // koneksi ke database

$visi = $_POST['visi'];
$misi = $_POST['misi'];

$cek = mysqli_query($conn, "SELECT * FROM profil_sekolah");
if (mysqli_num_rows($cek) > 0) {
    mysqli_query($conn, "UPDATE profil_sekolah SET visi='$visi', misi='$misi'");
} else {
    mysqli_query($conn, "INSERT INTO profil_sekolah (visi, misi) VALUES ('$visi', '$misi')");
}

header("Location: profil_sekolah_admin.php");

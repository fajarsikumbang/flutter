<?php
include '../backend/db.php';
include 'includes/header.php';
include 'includes/navbar.php';
include 'includes/sidebar.php';

if (isset($_GET['id'])) {
  $id = $_GET['id'];

  // Hapus data dari tabel orangtua terlebih dahulu karena ada foreign key
  mysqli_query($conn, "DELETE FROM ppdb_ortu WHERE ppdb_siswa_id = '$id'");

  // Hapus data dari tabel siswa
  mysqli_query($conn, "DELETE FROM ppdb_siswa WHERE id = '$id'");

  // Redirect kembali ke daftar pendaftar
  header("Location: daftar_pendaftar.php");
  exit();
} else {
  echo "ID tidak ditemukan.";
}
?>

<?php
include '../../backend/db.php';
include '../includes/header.php';
include '../includes/navbar.php';
include '../includes/sidebar.php';

$id = $_GET['id'] ?? '';
$nama = '';
$jabatan = '';

if ($id) {
    $q = mysqli_query($conn, "SELECT * FROM guru WHERE id=$id");
    $d = mysqli_fetch_assoc($q);
    $nama = $d['nama'];
    $jabatan = $d['jabatan'];
}
?>

<!DOCTYPE html>
<html>
<head>
  <title><?= $id ? 'Edit Guru' : 'Tambah Guru' ?></title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
</head>
<body>
<div class="content-wrapper">
  <div class="container mt-4">
    <h2><?= $id ? 'Edit Data Guru' : 'Tambah Data Guru' ?></h2>
    <form method="post" action="proses_guru.php">
      <input type="hidden" name="id" value="<?= $id ?>">

      <div class="mb-3">
        <label class="form-label">Nama</label>
        <input type="text" name="nama" class="form-control" value="<?= $nama ?>" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Jabatan</label>
        <input type="text" name="jabatan" class="form-control" value="<?= $jabatan ?>" required>
      </div>

      <button type="submit" class="btn btn-success">Simpan</button>
      <a href="daftar_guru.php" class="btn btn-secondary">Kembali</a>
    </form>
  </div>
</div>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
</body>
</html>

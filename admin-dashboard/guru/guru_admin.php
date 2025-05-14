<?php
include '../../backend/db.php';
include '../includes/header.php';
include '../includes/navbar.php';
include '../includes/sidebar.php';//  // jika tidak digunakan, bisa dibiarkan

$query = mysqli_query($conn, "SELECT * FROM guru");
?>

<!DOCTYPE html>
<html>
<head>
  <title>Daftar Guru</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="content-wrapper">
  <div class="container mt-4">
    <h2>Daftar Guru</h2>
    <a href="tambah_guru.php" class="btn btn-primary mb-3">+ Tambah Guru</a>
    <table class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>Nama</th>
          <th>Jabatan</th>
          <th>Aksi</th>
        </tr>
      </thead>
      <tbody>
        <?php while ($row = mysqli_fetch_assoc($query)): ?>
        <tr>
          <td><?= $row['nama'] ?></td>
          <td><?= $row['jabatan'] ?></td>
          <td>
            <a href="tambah_guru.php?id=<?= $row['id'] ?>" class="btn btn-warning btn-sm">Edit</a>
            <a href="proses_guru.php?hapus=<?= $row['id'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('Hapus data ini?')">Hapus</a>
          </td>
        </tr>
        <?php endwhile; ?>
      </tbody>
    </table>
  </div>
</div>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
</body>
</html>

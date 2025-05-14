<?php
include '../../backend/db.php';
include '../includes/header.php';
include '../includes/navbar.php';
include '../includes/sidebar.php';

$query = mysqli_query($conn, "SELECT * FROM galeri");
?>

<!DOCTYPE html>
<html>
<head>
  <title>Galeri Foto</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
</head>
<body>
<div class="content-wrapper">
  <div class="container mt-4">
    <h2>Galeri Foto</h2>
    <a href="tambah_galeri.php" class="btn btn-primary mb-3">+ Tambah Foto</a>

    <table class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>Foto</th>
          <th>Keterangan</th>
          <th>Aksi</th>
        </tr>
      </thead>
      <tbody>
        <?php while ($row = mysqli_fetch_assoc($query)): ?>
        <tr>
          <td>
            <!-- Menampilkan foto dengan base URL yang benar -->
            <img src="../uploads/<?= $row['foto'] ?>" width="100" class="img-thumbnail">
          </td>
          <td><?= $row['keterangan'] ?></td>
          <td>
            <a href="tambah_galeri.php?id=<?= $row['id'] ?>" class="btn btn-warning btn-sm">Edit</a>
            <a href="proses_galeri.php?hapus=<?= $row['id'] ?>" onclick="return confirm('Hapus foto ini?')" class="btn btn-danger btn-sm">Hapus</a>
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

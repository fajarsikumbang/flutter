<?php
include '../../backend/db.php';
include '../includes/header.php';
include '../includes/navbar.php';
include '../includes/sidebar.php';

$id = $_GET['id'] ?? '';
$foto = '';
$keterangan = '';

if ($id) {
    $q = mysqli_query($conn, "SELECT * FROM galeri WHERE id=$id");
    $d = mysqli_fetch_assoc($q);
    $foto = $d['foto'];
    $keterangan = $d['keterangan'];
}
?>

<!DOCTYPE html>
<html>
<head>
  <title><?= $id ? 'Edit Foto Galeri' : 'Tambah Foto Galeri' ?></title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
</head>
<body>
<div class="content-wrapper">
  <div class="container mt-4">
    <h2><?= $id ? 'Edit Foto Galeri' : 'Tambah Foto Galeri' ?></h2>

    <form method="post" action="proses_galeri.php" enctype="multipart/form-data">
      <input type="hidden" name="id" value="<?= $id ?>">

      <?php if ($id && $foto): ?>
        <div class="mb-3">
          <label class="form-label">Foto Saat Ini:</label><br>
          <img src="../uploads/<?= $foto ?>" width="200" class="img-thumbnail">
        </div>
      <?php endif; ?>

      <div class="mb-3">
        <label class="form-label">Upload Foto <?= $id ? 'Baru (Opsional)' : '' ?></label>
        <input type="file" name="foto" class="form-control" <?= $id ? '' : 'required' ?>>
      </div>

      <div class="mb-3">
        <label class="form-label">Keterangan</label>
        <textarea name="keterangan" class="form-control" required><?= $keterangan ?></textarea>
      </div>

      <button type="submit" class="btn btn-success">Simpan</button>
      <a href="galeri.php" class="btn btn-secondary">Kembali</a>
    </form>
  </div>
</div>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
</body>
</html>

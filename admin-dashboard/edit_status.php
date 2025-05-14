<?php
include '../backend/db.php';
include 'includes/header.php';
include 'includes/navbar.php';
include 'includes/sidebar.php';

$id = $_GET['id'];

// Tangani jika form disubmit
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $status = $_POST['status'];
  $komentar = mysqli_real_escape_string($conn, $_POST['komentar']);
  $query = "UPDATE ppdb_siswa SET status = '$status', komentar = '$komentar' WHERE id = $id";
  mysqli_query($conn, $query);
  header("Location: daftar_pendaftar.php");
  exit;
}

// Ambil data siswa
$query = "SELECT nama_lengkap, status, komentar FROM ppdb_siswa WHERE id = $id";
$result = mysqli_query($conn, $query);
$data = mysqli_fetch_assoc($result);
?>

<!DOCTYPE html>
<html>
<head>
  <title>Ubah Status</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
  <style>
    /* Mengatur konten agar tidak tertutup sidebar */
    .content-wrapper {
      margin-left: 240px; /* Ukuran sidebar */
      padding: 20px;
    }
    /* Menambahkan jarak agar konten lebih leluasa */
    .container {
      max-width: 900px;
    }
  </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  <!-- Sidebar -->
  <?php include 'includes/sidebar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <div class="container mt-4">
      <h3>Ubah Status Pendaftaran</h3>
      <p><strong>Nama:</strong> <?= $data['nama_lengkap'] ?></p>
      <form method="post">
        <div class="form-group">
          <label>Status</label>
          <select name="status" class="form-control" required>
            <option value="Menunggu" <?= $data['status'] == 'Menunggu' ? 'selected' : '' ?>>Menunggu</option>
            <option value="Diterima" <?= $data['status'] == 'Diterima' ? 'selected' : '' ?>>Diterima</option>
            <option value="Ditolak" <?= $data['status'] == 'Ditolak' ? 'selected' : '' ?>>Ditolak</option>
          </select>
        </div>
        <div class="form-group mt-3">
          <label>Catatan/Komentar (opsional)</label>
          <textarea name="komentar" class="form-control" rows="4"><?= htmlspecialchars($data['komentar'] ?? '') ?></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Simpan</button>
        <a href="daftar_pendaftar.php" class="btn btn-secondary">Batal</a>
      </form>
    </div>
  </div>
  <!-- /.content-wrapper -->
</div>
<!-- ./wrapper -->
</body>
</html>

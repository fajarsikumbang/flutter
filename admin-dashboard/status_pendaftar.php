<?php
include '../backend/db.php';

$id = $_GET['id'];

// Tangani jika form disubmit
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $status = $_POST['status'];
  $query = "UPDATE ppdb_siswa SET status = '$status' WHERE id = $id";
  mysqli_query($conn, $query);
  header("Location: daftar_pendaftar_admin.php");
  exit;
}

// Ambil data siswa
$query = "SELECT nama_lengkap, status FROM ppdb_siswa WHERE id = $id";
$result = mysqli_query($conn, $query);
$data = mysqli_fetch_assoc($result);
?>

<!DOCTYPE html>
<html>
<head>
  <title>Ubah Status</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
</head>
<body>
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
    <button type="submit" class="btn btn-primary">Simpan</button>
    <a href="daftar_pendaftar_admin.php" class="btn btn-secondary">Batal</a>
  </form>
</div>
</body>
</html>

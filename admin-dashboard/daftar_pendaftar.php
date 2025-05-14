<?php
include '../backend/db.php';
include 'includes/header.php';
include 'includes/navbar.php';
include 'includes/sidebar.php'; // Pastikan koneksi sudah betul

$query = "SELECT * FROM ppdb_siswa";
$result = mysqli_query($conn, $query);
?>

<!DOCTYPE html>
<html>
<head>
  <title>Daftar Pendaftar</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Sidebar -->
  <?php include 'includes/sidebar.php'; ?>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <div class="container mt-4">
      <h2>Daftar Pendaftar</h2>
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>No</th>
            <th>Nama Lengkap</th>
            <th>Jenis Kelamin</th>
            <th>Tanggal Lahir</th>
            <th>Status</th>
            <th>Komentar</th>
            <th>Aksi</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $no = 1;
          while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>$no</td>";
            echo "<td>{$row['nama_lengkap']}</td>";
            echo "<td>{$row['jenis_kelamin']}</td>";
            echo "<td>{$row['tanggal_lahir']}</td>";
            echo "<td><span class='badge badge-";
            echo ($row['status'] == 'Diterima') ? 'success' :
                 (($row['status'] == 'Ditolak') ? 'danger' : 'secondary');
            echo "'>{$row['status']}</span></td>";
            echo "<td>";
            echo (!empty($row['komentar'])) ? nl2br(htmlspecialchars($row['komentar'])) : '-';
            echo "</td>";
            echo "<td>
                    <a href='detail_pendaftar.php?id={$row['id']}' class='btn btn-info btn-sm'>Detail</a>
                    <a href='edit_status.php?id={$row['id']}' class='btn btn-warning btn-sm'>Ubah Status</a>
                    <a href='hapus_pendaftar.php?id={$row['id']}' class='btn btn-danger btn-sm' onclick='return confirm(\"Yakin ingin menghapus?\")'>Hapus</a>
                  </td>";
            echo "</tr>";
            $no++;
          }
          ?>
        </tbody>
      </table>
    </div>
  </div>
  <!-- /.content-wrapper -->
</div>
<!-- /.wrapper -->

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
</body>
</html>

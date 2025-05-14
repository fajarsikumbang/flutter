<?php
session_start();
if (!isset($_SESSION['admin_id'])) {
  header("Location: login_admin.html");
  exit();
}

include '../backend/db.php';

// Ambil data statistik
$total = mysqli_num_rows(mysqli_query($conn, "SELECT id FROM ppdb_siswa"));
$menunggu = mysqli_num_rows(mysqli_query($conn, "SELECT id FROM ppdb_siswa WHERE status = 'Menunggu'"));
$diterima = mysqli_num_rows(mysqli_query($conn, "SELECT id FROM ppdb_siswa WHERE status = 'Diterima'"));
$ditolak = mysqli_num_rows(mysqli_query($conn, "SELECT id FROM ppdb_siswa WHERE status = 'Ditolak'"));
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Dashboard Admin</title>
  <!-- AdminLTE CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="../backend/logout_admin.php"><i class="fas fa-sign-out-alt"></i> Logout</a>
      </li>
    </ul>
  </nav>

  <!-- Sidebar -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="#" class="brand-link">
      <span class="brand-text font-weight-light">PPDB Admin</span>
    </a>

    <div class="sidebar">
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column">
          <li class="nav-item">
            <a href="index.php" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="daftar_pendaftar.php" class="nav-link">
              <i class="nav-icon fas fa-users"></i>
              <p>Data Pendaftar</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="profil/profil_sekolah_admin.php" class="nav-link">
              <i class="nav-icon fas fa-school"></i>
              <p>Profil Sekolah</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="guru/guru_admin.php" class="nav-link">
              <i class="nav-icon fas fa-user-tie"></i>
              <p>Guru</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="kegiatan/kegiatan.php" class="nav-link">
              <i class="nav-icon fas fa-calendar-alt"></i>
              <p>Kegiatan</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="galeri/galeri.php" class="nav-link">
              <i class="nav-icon fas fa-images"></i>
              <p>Galeri</p>
            </a>
          </li>

        </ul>
      </nav>
    </div>
  </aside>


  <div class="content-wrapper">
    <div class="content-header">
      <div class="container-fluid">
        <h1 class="m-0">Selamat datang, Admin!</h1>
      </div>
    </div>

    <section class="content">
      <div class="container-fluid">
        <div class="row">

          <div class="col-lg-3 col-6">
            <div class="small-box bg-info">
              <div class="inner">
                <h3><?= $total ?></h3>
                <p>Total Pendaftar</p>
              </div>
              <div class="icon"><i class="fas fa-users"></i></div>
            </div>
          </div>

          <div class="col-lg-3 col-6">
            <div class="small-box bg-warning">
              <div class="inner">
                <h3><?= $menunggu ?></h3>
                <p>Menunggu</p>
              </div>
              <div class="icon"><i class="fas fa-hourglass-half"></i></div>
            </div>
          </div>

          <div class="col-lg-3 col-6">
            <div class="small-box bg-success">
              <div class="inner">
                <h3><?= $diterima ?></h3>
                <p>Diterima</p>
              </div>
              <div class="icon"><i class="fas fa-check-circle"></i></div>
            </div>
          </div>

          <div class="col-lg-3 col-6">
            <div class="small-box bg-danger">
              <div class="inner">
                <h3><?= $ditolak ?></h3>
                <p>Ditolak</p>
              </div>
              <div class="icon"><i class="fas fa-times-circle"></i></div>
            </div>
          </div>

        </div>
      </div>
    </section>
  </div>

</div>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
</body>
</html>

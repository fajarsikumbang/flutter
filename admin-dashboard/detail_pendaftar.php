<?php
include '../backend/db.php';
include 'includes/header.php';
include 'includes/navbar.php';
include 'includes/sidebar.php';

if (!isset($_GET['id'])) {
  echo "ID tidak ditemukan!";
  exit;
}

$id = $_GET['id'];

// Ambil data siswa
$siswaQuery = "SELECT * FROM ppdb_siswa WHERE id = $id";
$siswaResult = mysqli_query($conn, $siswaQuery);
$siswa = mysqli_fetch_assoc($siswaResult);

// Ambil data orang tua
$ortuQuery = "SELECT * FROM ppdb_ortu WHERE ppdb_siswa_id = $id";
$ortuResult = mysqli_query($conn, $ortuQuery);
$ortu = mysqli_fetch_assoc($ortuResult);
?>

<!DOCTYPE html>
<html>
<head>
  <title>Detail Pendaftar</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Sidebar -->
  <?php include 'includes/sidebar.php'; ?>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <div class="container mt-4">
      <p><strong>Status:</strong> 
      <span class="badge badge-<?= 
      $siswa['status'] == 'Diterima' ? 'success' : 
      ($siswa['status'] == 'Ditolak' ? 'danger' : 'secondary') ?>">
      <?= $siswa['status'] ?>
      </span></p>

      <h2>Detail Pendaftar</h2>
      <a href="daftar_pendaftar.php" class="btn btn-secondary mb-3">← Kembali</a>

      <div class="card">
        <div class="card-header bg-primary text-white">
          <h5 class="card-title">Data Siswa</h5>
        </div>
        <div class="card-body">
          <?php
          function tampilData($label, $value) {
            echo "<p><strong>$label:</strong> $value</p>";
          }

          tampilData('Nama Lengkap', $siswa['nama_lengkap']);
          tampilData('Nama Panggilan', $siswa['nama_panggilan']);
          tampilData('NIK', $siswa['nik']);
          tampilData('Tempat Lahir', $siswa['tempat_lahir']);
          tampilData('Tanggal Lahir', $siswa['tanggal_lahir']);
          tampilData('Agama', $siswa['agama']);
          tampilData('Kewarganegaraan', $siswa['kewarganegaraan']);
          tampilData('Jenis Kelamin', $siswa['jenis_kelamin']);
          tampilData('Alamat', $siswa['alamat']);
          tampilData('Kabupaten', $siswa['kabupaten']);
          tampilData('Anak Keberapa', $siswa['anak_keberapa']);
          tampilData('Jumlah Saudara Kandung', $siswa['jumlah_saudara_kandung']);
          tampilData('Jumlah Saudara Tiri', $siswa['jumlah_saudara_tiri']);
          tampilData('Jumlah Saudara Angkat', $siswa['jumlah_saudara_angkat']);
          tampilData('Status Anak', $siswa['status_anak']);
          tampilData('Bahasa Sehari-hari', $siswa['bahasa_sehari_hari']);
          tampilData('Berat Badan', $siswa['berat_badan']);
          tampilData('Tinggi Badan', $siswa['tinggi_badan']);
          tampilData('Golongan Darah', $siswa['golongan_darah']);
          tampilData('Penyakit Pernah Diderita', $siswa['penyakit_pernah_diderita']);
          tampilData('Imunisasi Pernah Diterima', $siswa['imunisasi_pernah_diterima']);
          tampilData('Ciri Khusus', $siswa['ciri_khusus']);
          tampilData('Tempat Tinggal', $siswa['tempat_tinggal']);
          tampilData('Asal Mula Anak', $siswa['asal_mula']);
          if ($siswa['asal_mula'] == 'Pindahan') {
            tampilData('Pindahan Dari', $siswa['pindahan_dari']);
          }
          ?>
        </div>
      </div>

      <div class="card mt-4">
        <div class="card-header bg-success text-white">
          <h5 class="card-title">Data Orang Tua</h5>
        </div>
        <div class="card-body">
          <?php
          tampilData('Nama Ayah', $ortu['nama_ayah']);
          tampilData('Tempat Lahir Ayah', $ortu['tempat_lahir_ayah']);
          tampilData('Tanggal Lahir Ayah', $ortu['tanggal_lahir_ayah']);
          tampilData('Agama Ayah', $ortu['agama_ayah']);
          tampilData('Kewarganegaraan Ayah', $ortu['kewarganegaraan_ayah']);
          tampilData('Pendidikan Ayah', $ortu['pendidikan_ayah']);
          tampilData('Pekerjaan Ayah', $ortu['pekerjaan_ayah']);
          tampilData('Nomor HP Ayah', $ortu['no_hp_ayah']);

          echo "<hr>";

          tampilData('Nama Ibu', $ortu['nama_ibu']);
          tampilData('Tempat Lahir Ibu', $ortu['tempat_lahir_ibu']);
          tampilData('Tanggal Lahir Ibu', $ortu['tanggal_lahir_ibu']);
          tampilData('Agama Ibu', $ortu['agama_ibu']);
          tampilData('Kewarganegaraan Ibu', $ortu['kewarganegaraan_ibu']);
          tampilData('Pendidikan Ibu', $ortu['pendidikan_ibu']);
          tampilData('Pekerjaan Ibu', $ortu['pekerjaan_ibu']);
          tampilData('Nomor HP Ibu', $ortu['no_hp_ibu']);
          ?>
        </div>
      </div>
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

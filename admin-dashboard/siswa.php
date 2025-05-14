<?php
session_start();
if (!isset($_SESSION['admin'])) {
  header("Location: login_admin.html");
  exit();
}
?>

<!DOCTYPE html>
<html>
<head>
  <title>Data Siswa</title>
  <link rel="stylesheet" href="assets/adminlte.min.css">
  <script src="assets/jquery.min.js"></script>
</head>
<body>
  <div class="content-wrapper p-3">
    <h2>Data Siswa</h2>
    <table class="table table-bordered" id="tabel-siswa">
      <thead>
        <tr>
          <th>Nama</th>
          <th>Alamat</th>
          <th>Tanggal Lahir</th>
        </tr>
      </thead>
      <tbody></tbody>
    </table>
  </div>

  <script>
    $(document).ready(function() {
      $.get("../backend/get_siswa.php", function(data) {
        let siswa = JSON.parse(data);
        siswa.forEach(function(item) {
          $("#tabel-siswa tbody").append(`
            <tr>
              <td>${item.nama}</td>
              <td>${item.alamat}</td>
              <td>${item.tanggal_lahir}</td>
            </tr>
          `);
        });
      });
    });
  </script>
</body>
</html>

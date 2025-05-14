<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");
include 'db.php';

$user_id = $_GET['user_id']; // dikirim dari Flutter

$result = mysqli_query($conn, "
  SELECT u.username, u.email,
         IFNULL(p.status, 'Belum Mendaftar') AS status,
         p.nama_lengkap, p.nama_panggilan, p.komentar
  FROM users u
  LEFT JOIN ppdb_siswa p ON u.id = p.user_id
  WHERE u.id = '$user_id'
");

$data = mysqli_fetch_assoc($result);
echo json_encode($data);
?>

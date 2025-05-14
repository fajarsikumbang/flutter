<?php
include '../backend/db.php';

$id = $_POST['id'];
$status = $_POST['status'];
$komentar = mysqli_real_escape_string($conn, $_POST['komentar']);

$query = "UPDATE ppdb_siswa SET status = '$status', komentar = '$komentar' WHERE id = $id";
mysqli_query($conn, $query);

header("Location: daftar_pendaftar.php");
?>

<?php
include '../../backend/db.php'; // Koneksi ke database

if (isset($_GET['hapus'])) {
    $id = $_GET['hapus'];

    // Hapus data kegiatan berdasarkan ID
    $query = mysqli_query($conn, "DELETE FROM jadwal_kegiatan WHERE id = '$id'");

    if ($query) {
        echo "<script>alert('Kegiatan berhasil dihapus'); window.location.href='kegiatan.php';</script>";
    } else {
        echo "<script>alert('Gagal menghapus kegiatan'); window.location.href='kegiatan.php';</script>";
    }
}
?>

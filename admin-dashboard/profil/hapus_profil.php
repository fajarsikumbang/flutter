<?php
include '../db.php'; // Menyesuaikan dengan path menuju db.php

$sql = "DELETE FROM profil_sekolah WHERE id = 1"; // Menghapus data profil sekolah yang sudah ada
if ($conn->query($sql) === TRUE) {
    echo "Profil sekolah berhasil dihapus.";
} else {
    echo "Error deleting record: " . $conn->error;
}

$conn->close();
?>

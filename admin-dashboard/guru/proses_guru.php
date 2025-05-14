<?php
include '../../backend/db.php';// koneksi ke database

if (isset($_POST['nama'])) {
    $id = $_POST['id'];
    $nama = $_POST['nama'];
    $jabatan = $_POST['jabatan'];

    if ($id) {
        mysqli_query($conn, "UPDATE guru SET nama='$nama', jabatan='$jabatan' WHERE id=$id");
    } else {
        mysqli_query($conn, "INSERT INTO guru (nama, jabatan) VALUES ('$nama', '$jabatan')");
    }
    header('Location: guru_admin.php');
}

if (isset($_GET['hapus'])) {
    $id = $_GET['hapus'];
    mysqli_query($conn, "DELETE FROM guru WHERE id=$id");
    header('Location: guru_admin.php');
}

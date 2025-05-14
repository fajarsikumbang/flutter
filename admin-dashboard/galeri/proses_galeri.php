<?php
include '../../backend/db.php'; // koneksi ke database

$upload_dir = "../uploads/";
if (!is_dir($upload_dir)) mkdir($upload_dir);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $keterangan = $_POST['keterangan'];
    $foto = '';

    if ($_FILES['foto']['name']) {
        $filename = time() . "_" . basename($_FILES['foto']['name']); // Menambahkan time agar tidak ada overwrite
        $target_file = $upload_dir . $filename;
        move_uploaded_file($_FILES['foto']['tmp_name'], $target_file);
        $foto = $filename; // simpan hanya nama file
    }

    if ($id) {
        if ($foto) {
            mysqli_query($conn, "UPDATE galeri SET foto='$foto', keterangan='$keterangan' WHERE id=$id");
        } else {
            mysqli_query($conn, "UPDATE galeri SET keterangan='$keterangan' WHERE id=$id");
        }
    } else {
        mysqli_query($conn, "INSERT INTO galeri (foto, keterangan) VALUES ('$foto', '$keterangan')");
    }

    header('Location: galeri.php');
}

if (isset($_GET['hapus'])) {
    $id = $_GET['hapus'];
    mysqli_query($conn, "DELETE FROM galeri WHERE id=$id");
    header('Location: galeri.php');
}
?>

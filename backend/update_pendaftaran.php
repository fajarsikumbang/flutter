<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

// Koneksi ke database
include 'db.php';

// Ambil data dari POST
$id = $_POST['id'];
$namaLengkap = $_POST['namaLengkap'];
$namaPanggilan = $_POST['namaPanggilan'];

// Validasi sederhana
if (empty($id) || empty($namaLengkap) || empty($namaPanggilan)) {
    echo json_encode(['success' => false, 'message' => 'Data tidak lengkap']);
    exit;
}

// Update data di tabel ppdb_siswa
$query = "UPDATE ppdb_siswa 
          SET nama_lengkap = ?, nama_panggilan = ?
          WHERE id = ?";

$stmt = $conn->prepare($query);
$stmt->bind_param("ssi", $namaLengkap, $namaPanggilan, $id);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Data berhasil diperbarui']);
} else {
    echo json_encode(['success' => false, 'message' => 'Gagal memperbarui data']);
}

$stmt->close();
$conn->close();
?>

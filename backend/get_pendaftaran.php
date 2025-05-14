<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");
include 'db.php';

$response = ['success' => false, 'message' => 'Data tidak ditemukan'];

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $user_id = $_GET['user_id'] ?? '';

    if (empty($user_id)) {
        echo json_encode($response);
        exit;
    }

    // Ambil data berdasarkan user_id
    $query = "SELECT * FROM ppdb_siswa WHERE user_id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $data = $result->fetch_assoc();
        // Mengambil data siswa
        $queryOrtu = "SELECT * FROM ppdb_ortu WHERE ppdb_siswa_id = ?";
        $stmtOrtu = $conn->prepare($queryOrtu);
        $stmtOrtu->bind_param("i", $data['id']);
        $stmtOrtu->execute();
        $resultOrtu = $stmtOrtu->get_result();
        $ortuData = $resultOrtu->fetch_assoc();

        // Menggabungkan data siswa dan orang tua
        $response['success'] = true;
        $response['data'] = array_merge($data, $ortuData); // Gabungkan data siswa dan orang tua
    }

    $stmt->close();
    $stmtOrtu->close();
} else {
    $response['message'] = 'Metode tidak diizinkan';
}

echo json_encode($response);
?>

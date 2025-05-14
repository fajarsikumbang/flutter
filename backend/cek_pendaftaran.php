<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");
include 'db.php';
$user_id = $_POST['user_id'] ?? null;

$response = ['sudah_daftar' => false];

if ($user_id) {
    $query = "SELECT id FROM ppdb_siswa WHERE user_id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $response['sudah_daftar'] = true;
    }
}

echo json_encode($response);
?>

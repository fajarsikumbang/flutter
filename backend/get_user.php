<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

include 'db.php';

if (isset($_GET['id'])) {
    $userId = $conn->real_escape_string($_GET['id']);
    
    $query = "SELECT id, username, email, role FROM users WHERE id = '$userId'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        echo json_encode([
            "status" => "success",
            "user" => $user
        ]);
    } else {
        echo json_encode([
            "status" => "error",
            "message" => "User not found"
        ]);
    }
} else {
    echo json_encode([
        "status" => "error",
        "message" => "User ID is required"
    ]);
}
?>
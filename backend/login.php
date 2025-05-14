<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

include 'db.php';

$data = json_decode(file_get_contents("php://input"));

if (isset($data->username) && isset($data->password)) {
    $username = $conn->real_escape_string($data->username);
    $password = $data->password;

    // Allow login with either username or email
    $query = "SELECT * FROM users WHERE username = '$username' OR email = '$username'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        if (password_verify($password, $user['password'])) {
            // Remove password from response
            unset($user['password']);
            echo json_encode([
                "status" => "success",
                "message" => "Login successful.",
                "user" => [
                    "id" => (int)$user['id'],
                    "username" => $user['username'],
                    "email" => $user['email'],
                    "role" => $user['role']
                ]
            ]);
        } else {
            echo json_encode(["status" => "error", "message" => "Invalid password."]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "User not found."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid input."]);
}
?>
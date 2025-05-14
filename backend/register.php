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

if (isset($data->username) && isset($data->password) && isset($data->email)) {
    $username = $conn->real_escape_string($data->username);
    $email = $conn->real_escape_string($data->email);
    $password = password_hash($data->password, PASSWORD_BCRYPT);
    $role = isset($data->role) ? $conn->real_escape_string($data->role) : 'user';

    // Check if email already exists
    $checkEmail = "SELECT * FROM users WHERE email = '$email'";
    $emailResult = $conn->query($checkEmail);

    if ($emailResult->num_rows > 0) {
        echo json_encode(["status" => "error", "message" => "Email already exists."]);
        exit();
    }

    // Check if username already exists
    $checkUsername = "SELECT * FROM users WHERE username = '$username'";
    $usernameResult = $conn->query($checkUsername);

    if ($usernameResult->num_rows > 0) {
        echo json_encode(["status" => "error", "message" => "Username already exists."]);
        exit();
    }

    $query = "INSERT INTO users (username, email, password, role) VALUES ('$username', '$email', '$password', '$role')";

    if ($conn->query($query) === TRUE) {
        echo json_encode(["status" => "success", "message" => "User registered successfully."]);
    } else {
        echo json_encode(["status" => "error", "message" => "Registration failed: " . $conn->error]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid input. Username, email, and password are required."]);
}
?>









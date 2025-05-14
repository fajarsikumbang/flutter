<?php
session_start();
include 'db.php';

$username = $_POST['username'];
$password = $_POST['password'];

$username = $conn->real_escape_string($username);

$query = "SELECT * FROM users WHERE username = '$username' OR email = '$username'";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();

    if (password_verify($password, $user['password'])) {
        if ($user['role'] === 'admin') {
            $_SESSION['admin_id'] = $user['id'];
            $_SESSION['admin_username'] = $user['username'];
            header("Location: ../admin-dashboard/index.php");
            exit();
        } else {
            echo "<script>alert('Akses ditolak. Bukan admin.'); window.location.href='../admin-dashboard/login_admin.html';</script>";
        }
    } else {
        echo "<script>alert('Password salah.'); window.location.href='../admin-dashboard/login_admin.html';</script>";
    }
} else {
    echo "<script>alert('User tidak ditemukan.'); window.location.href='../admin-dashboard/login_admin.html';</script>";
}
?>

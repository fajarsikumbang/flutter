<?php
session_start();
session_destroy(); // Hapus semua data session
header("Location: ../admin-dashboard/login_admin.html"); // Kembali ke halaman login
exit();

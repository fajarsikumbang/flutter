<?php
include '../../backend/db.php';
include '../includes/header.php';
include '../includes/navbar.php';
include '../includes/sidebar.php';
 // Menyesuaikan dengan path menuju db.php

$sql = "SELECT * FROM profil_sekolah_pisah ORDER BY id DESC LIMIT 1";
$result = $conn->query($sql);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil Sekolah</title>
    <!-- AdminLTE CSS -->
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <!-- Content Wrapper -->
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Profil Sekolah</h1>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <?php
                        if ($result->num_rows > 0) {
                            $row = $result->fetch_assoc();
                            echo "<div class='card'>
                                    <div class='card-body'>
                                        <h4>Visi</h4>
                                        <p>" . $row['visi'] . "</p>
                                        <h4>Misi</h4>
                                        <p>" . $row['misi'] . "</p>
                                        <h4>Tujuan</h4>
                                        <p>" . $row['tujuan'] . "</p>
                                        <h4>Sistem Pembelajaran</h4>
                                        <p>" . $row['sistem_pembelajaran'] . "</p>
                                    </div>
                                  </div>";
                        } else {
                            echo "<p>Data profil sekolah tidak ditemukan.</p>";
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.content-wrapper -->

    <!-- Footer -->
</div>
<!-- ./wrapper -->

<!-- AdminLTE JS -->
<script src="../dist/js/adminlte.min.js"></script>
</body>
</html>

<?php
$conn->close();
?>

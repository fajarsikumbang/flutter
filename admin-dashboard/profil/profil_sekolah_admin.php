<?php
include '../../backend/db.php';
include '../includes/header.php'; // Pastikan ini membuka <div class="wrapper"> dan content-wrapper
include '../includes/navbar.php';
include '../includes/sidebar.php';

$query = mysqli_query($conn, "SELECT * FROM profil_sekolah_pisah LIMIT 1");
$data = mysqli_fetch_assoc($query);
?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header -->
    <div class="content-header">
        <div class="container-fluid">
            <h1 class="m-0">Profil Sekolah</h1>
        </div>
    </div>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">

            <a href="tambah_update_profil.php" class="btn btn-primary mb-3">
                <?= $data ? 'Edit Profil' : 'Tambah Profil' ?>
            </a>

            <?php if ($data): ?>
                <div class="card">
                    <div class="card-body table-responsive">
                        <table class="table table-bordered">
                            <tr>
                                <th style="width: 20%;">Visi</th>
                                <td><?= nl2br(htmlspecialchars($data['visi'])) ?></td>
                            </tr>
                            <tr>
                                <th>Misi</th>
                                <td><?= nl2br(htmlspecialchars($data['misi'])) ?></td>
                            </tr>
                            <tr>
                                <th>Tujuan</th>
                                <td><?= nl2br(htmlspecialchars($data['tujuan'])) ?></td>
                            </tr>
                            <tr>
                                <th>Sistem Pembelajaran</th>
                                <td><?= nl2br(htmlspecialchars($data['sistem_pembelajaran'])) ?></td>
                            </tr>
                        </table>
                    </div>
                </div>
            <?php else: ?>
                <div class="alert alert-warning" role="alert">
                    Belum ada data profil sekolah.
                </div>
            <?php endif; ?>

        </div>
    </section>
</div>

<?php include '../includes/footer.php'; ?>

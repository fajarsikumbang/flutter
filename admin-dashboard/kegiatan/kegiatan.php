<?php
include '../../backend/db.php';
include '../includes/header.php';
include '../includes/navbar.php';
include '../includes/sidebar.php';

$query = mysqli_query($conn, "SELECT * FROM jadwal_kegiatan");
?>

<!-- Mulai konten utama -->
<div class="content-wrapper">
    <!-- Header halaman -->
    <section class="content-header">
        <div class="container-fluid">
            <h1>Daftar Kegiatan</h1>
            <a href="tambah_kegiatan.php" class="btn btn-primary mt-2">+ Tambah Kegiatan</a>
        </div>
    </section>

    <!-- Konten utama -->
    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Nama Kegiatan</th>
                                <th>Jam Mulai</th>
                                <th>Jam Selesai</th>
                                <th>Deskripsi</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while ($row = mysqli_fetch_assoc($query)): ?>
                            <tr>
                                <td><?= htmlspecialchars($row['nama_kegiatan']) ?></td>
                                <td><?= htmlspecialchars($row['jam_mulai']) ?></td>
                                <td><?= htmlspecialchars($row['jam_selesai']) ?></td>
                                <td><?= htmlspecialchars($row['deskripsi']) ?></td>
                                <td>
                                    <a href="tambah_kegiatan.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-warning">Edit</a>
                                    <a href="proses_kegiatan.php?hapus=<?= $row['id'] ?>" class="btn btn-sm btn-danger" onclick="return confirm('Hapus data ini?')">Hapus</a>
                                </td>
                            </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</div>


<?php
include '../../backend/db.php';
include '../includes/header.php';
include '../includes/navbar.php';
include '../includes/sidebar.php';

$id = isset($_GET['id']) ? $_GET['id'] : null;

if ($id) {
    // Ambil data untuk edit
    $query = mysqli_query($conn, "SELECT * FROM jadwal_kegiatan WHERE id = '$id'");
    $data = mysqli_fetch_assoc($query);
    $nama_kegiatan = $data['nama_kegiatan'];
    $jam_mulai = $data['jam_mulai'];
    $jam_selesai = $data['jam_selesai'];
    $deskripsi = $data['deskripsi'];
} else {
    // Default kosong
    $nama_kegiatan = '';
    $jam_mulai = '';
    $jam_selesai = '';
    $deskripsi = '';
}

if (isset($_POST['submit'])) {
    $nama_kegiatan = $_POST['nama_kegiatan'];
    $jam_mulai = $_POST['jam_mulai'];
    $jam_selesai = $_POST['jam_selesai'];
    $deskripsi = $_POST['deskripsi'];

    if ($id) {
        // Update
        $query = mysqli_query($conn, "UPDATE jadwal_kegiatan SET nama_kegiatan = '$nama_kegiatan', jam_mulai = '$jam_mulai', jam_selesai = '$jam_selesai', deskripsi = '$deskripsi' WHERE id = '$id'");
    } else {
        // Insert
        $query = mysqli_query($conn, "INSERT INTO jadwal_kegiatan (nama_kegiatan, jam_mulai, jam_selesai, deskripsi) VALUES ('$nama_kegiatan', '$jam_mulai', '$jam_selesai', '$deskripsi')");
    }

    if ($query) {
        echo "<script>alert('Kegiatan berhasil disimpan'); window.location.href='kegiatan.php';</script>";
    } else {
        echo "<script>alert('Gagal menyimpan kegiatan'); window.location.href='kegiatan.php';</script>";
    }
}
?>

<!-- Content Wrapper -->
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <h1><?= $id ? 'Edit Kegiatan' : 'Tambah Kegiatan' ?></h1>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="card card-primary">
                <div class="card-body">
                    <form action="" method="POST">
                        <div class="form-group">
                            <label for="nama_kegiatan">Nama Kegiatan</label>
                            <input type="text" name="nama_kegiatan" class="form-control" id="nama_kegiatan" value="<?= htmlspecialchars($nama_kegiatan) ?>" required>
                        </div>

                        <div class="form-group">
                            <label for="jam_mulai">Jam Mulai</label>
                            <input type="time" name="jam_mulai" class="form-control" id="jam_mulai" value="<?= htmlspecialchars($jam_mulai) ?>" required>
                        </div>

                        <div class="form-group">
                            <label for="jam_selesai">Jam Selesai</label>
                            <input type="time" name="jam_selesai" class="form-control" id="jam_selesai" value="<?= htmlspecialchars($jam_selesai) ?>" required>
                        </div>

                        <div class="form-group">
                            <label for="deskripsi">Deskripsi</label>
                            <textarea name="deskripsi" class="form-control" id="deskripsi" rows="3" required><?= htmlspecialchars($deskripsi) ?></textarea>
                        </div>

                        <button type="submit" name="submit" class="btn btn-success"><?= $id ? 'Update' : 'Tambah' ?> Kegiatan</button>
                        <a href="kegiatan.php" class="btn btn-secondary">Kembali</a>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>

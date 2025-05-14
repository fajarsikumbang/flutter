<?php
include '../../backend/db.php';
include '../includes/header.php';
include '../includes/navbar.php';
include '../includes/sidebar.php';

$visi = $misi = $tujuan = $sistem_pembelajaran = "";

// Ambil data jika sudah ada
$sql = "SELECT * FROM profil_sekolah_pisah LIMIT 1";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $data = $result->fetch_assoc();
    $visi = $data['visi'];
    $misi = $data['misi'];
    $tujuan = $data['tujuan'];
    $sistem_pembelajaran = $data['sistem_pembelajaran'];
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $visi = $_POST['visi'];
    $misi = $_POST['misi'];
    $tujuan = $_POST['tujuan'];
    $sistem_pembelajaran = $_POST['sistem_pembelajaran'];

    if ($result->num_rows > 0) {
        // Update data
        $update_sql = "UPDATE profil_sekolah_pisah SET visi='$visi', misi='$misi', tujuan='$tujuan', sistem_pembelajaran='$sistem_pembelajaran' WHERE id=1";
        if ($conn->query($update_sql) === TRUE) {
            header("Location: profil_sekolah_admin.php");
            exit;
        } else {
            echo "Error updating record: " . $conn->error;
        }
    } else {
        // Insert data
        $insert_sql = "INSERT INTO profil_sekolah_pisah (visi, misi, tujuan, sistem_pembelajaran) VALUES ('$visi', '$misi', '$tujuan', '$sistem_pembelajaran')";
        if ($conn->query($insert_sql) === TRUE) {
            header("Location: profil_sekolah_admin.php");
            exit;
        } else {
            echo "Error: " . $insert_sql . "<br>" . $conn->error;
        }
    }
}

$conn->close();
?>

<!-- FORM HTML -->
<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <h1 class="m-0">Tambah/Update Profil Sekolah</h1>
        </div>
    </div>

    <section class="content">
        <div class="container-fluid">
            <form method="POST">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Form Edit Profil Sekolah</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="visi">Visi</label>
                            <textarea name="visi" class="form-control" rows="4" required><?= htmlspecialchars($visi) ?></textarea>
                        </div>
                        <div class="form-group">
                            <label for="misi">Misi</label>
                            <textarea name="misi" class="form-control" rows="4" required><?= htmlspecialchars($misi) ?></textarea>
                        </div>
                        <div class="form-group">
                            <label for="tujuan">Tujuan</label>
                            <textarea name="tujuan" class="form-control" rows="4" required><?= htmlspecialchars($tujuan) ?></textarea>
                        </div>
                        <div class="form-group">
                            <label for="sistem_pembelajaran">Sistem Pembelajaran</label>
                            <textarea name="sistem_pembelajaran" class="form-control" rows="4" required><?= htmlspecialchars($sistem_pembelajaran) ?></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Simpan</button>
                        <a href="profil_sekolah_admin.php" class="btn btn-secondary ml-2">Batal</a>
                    </div>
                </div>
            </form>
        </div>
    </section>
</div>

<?php include '../includes/footer.php'; ?>

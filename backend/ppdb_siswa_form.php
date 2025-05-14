<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");
include 'db.php';

$response = ['success' => false, 'message' => 'Gagal menyimpan data'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id = $_POST['user_id'] ?? NULL;

    // 🔒 Cek apakah user_id sudah pernah mendaftar
    $cek = $conn->prepare("SELECT id FROM ppdb_siswa WHERE user_id = ?");
    $cek->bind_param("s", $user_id);
    $cek->execute();
    $cek->store_result();

    if ($cek->num_rows > 0) {
        $response['success'] = false;
        $response['message'] = 'User ini sudah pernah mendaftar.';
        echo json_encode($response);
        exit;
    }

    $cek->close();

    $foto_path = null;
    if (isset($_FILES['foto_siswa']) && $_FILES['foto_siswa']['error'] === UPLOAD_ERR_OK) {
        $ext = pathinfo($_FILES['foto_siswa']['name'], PATHINFO_EXTENSION);
        $new_filename = 'foto_' . time() . '.' . $ext;
        $upload_path = 'uploads/' . $new_filename;

        if (move_uploaded_file($_FILES['foto_siswa']['tmp_name'], $upload_path)) {
            $foto_path = $upload_path;
        } else {
            echo json_encode(['success' => false, 'message' => 'Gagal mengupload foto siswa']);
            exit;
        }
    }
    // Data siswa
    $nama_lengkap = $_POST['nama_lengkap'] ?? '';
    $nama_panggilan = $_POST['nama_panggilan'] ?? '';
    $nik = $_POST['nik'] ?? '';
    $tempat_lahir = $_POST['tempat_lahir'] ?? '';
    $tanggal_lahir = $_POST['tanggal_lahir'] ?? '';
    $agama = $_POST['agama'] ?? '';
    $kewarganegaraan = $_POST['kewarganegaraan'] ?? '';
    $jenis_kelamin = $_POST['jenis_kelamin'] ?? '';
    $alamat = $_POST['alamat'] ?? '';
    $kabupaten = $_POST['kabupaten'] ?? '';
    //tambahan
    $anak_keberapa = $_POST['anak_keberapa'] ?? '';
    $jumlah_saudara_kandung = $_POST['jumlah_saudara_kandung'] ?? NULL;
    $jumlah_saudara_tiri = $_POST['jumlah_saudara_tiri'] ?? NULL;
    $jumlah_saudara_angkat = $_POST['jumlah_saudara_angkat'] ?? NULL;
    $status_anak = $_POST['status_anak'] ?? 'Lengkap'; // default 'Lengkap'
    $bahasa_sehari_hari = $_POST['bahasa_sehari_hari'] ?? '';
    $berat_badan = $_POST['berat_badan'] ?? 0;
    $tinggi_badan = $_POST['tinggi_badan'] ?? 0;
    $golongan_darah = $_POST['golongan_darah'] ?? '-';
    $penyakit_pernah_diderita = $_POST['penyakit_pernah_diderita'] ?? '-';
    $imunisasi_pernah_diterima = $_POST['imunisasi_pernah_diterima'] ?? '-';
    $ciri_khusus = $_POST['ciri_khusus'] ?? '-';
    $tempat_tinggal = $_POST['tempat_tinggal'] ?? 'Orang Tua'; // default 'Orang Tua'
    //
    $asal_mula = $_POST['asal_mula'] ?? 'anak didik baru'; // default anak didik baru
    $pindahan_dari = $_POST['pindahan_dari'] ?? NULL; // bisa kosong kalau bukan pindahan

    // Data ayah
    $nama_ayah = $_POST['nama_ayah'] ?? '';
    $tempat_lahir_ayah = $_POST['tempat_lahir_ayah'] ?? '';
    $tanggal_lahir_ayah = $_POST['tanggal_lahir_ayah'] ?? '';
    $agama_ayah = $_POST['agama_ayah'] ?? '';
    $kewarganegaraan_ayah = $_POST['kewarganegaraan_ayah'] ?? '';
    $pendidikan_ayah = $_POST['pendidikan_ayah'] ?? '';
    $pekerjaan_ayah = $_POST['pekerjaan_ayah'] ?? '';
    $no_hp_ayah = $_POST['no_hp_ayah'] ?? '';

    // Data ibu
    $nama_ibu = $_POST['nama_ibu'] ?? '';
    $tempat_lahir_ibu = $_POST['tempat_lahir_ibu'] ?? '';
    $tanggal_lahir_ibu = $_POST['tanggal_lahir_ibu'] ?? '';
    $agama_ibu = $_POST['agama_ibu'] ?? '';
    $kewarganegaraan_ibu = $_POST['kewarganegaraan_ibu'] ?? '';
    $pendidikan_ibu = $_POST['pendidikan_ibu'] ?? '';
    $pekerjaan_ibu = $_POST['pekerjaan_ibu'] ?? '';
    $no_hp_ibu = $_POST['no_hp_ibu'] ?? '';

    // $user_id = $_POST['user_id'] ?? NULL; // Menambahkan user_id
    // Simpan data siswa
    $stmt_siswa = $conn->prepare("INSERT INTO ppdb_siswa 
        (user_id, nama_lengkap, nama_panggilan, nik, tempat_lahir, tanggal_lahir, agama, kewarganegaraan, jenis_kelamin, alamat, kabupaten, anak_keberapa, jumlah_saudara_kandung, jumlah_saudara_tiri, jumlah_saudara_angkat, status_anak, bahasa_sehari_hari, berat_badan, tinggi_badan, golongan_darah, penyakit_pernah_diderita, imunisasi_pernah_diterima, 
        ciri_khusus, tempat_tinggal, asal_mula, pindahan_dari) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    $stmt_siswa->bind_param("ssssssssssssssssssssssssss", 
        $user_id, $nama_lengkap, $nama_panggilan, $nik, $tempat_lahir, $tanggal_lahir,$agama, $kewarganegaraan, $jenis_kelamin, $alamat, $kabupaten, $anak_keberapa, $jumlah_saudara_kandung, $jumlah_saudara_tiri, $jumlah_saudara_angkat, $status_anak, $bahasa_sehari_hari, $berat_badan, $tinggi_badan, $golongan_darah, $penyakit_pernah_diderita, 
        $imunisasi_pernah_diterima, $ciri_khusus, $tempat_tinggal, $asal_mula, $pindahan_dari);


    if ($stmt_siswa->execute()) {
        $siswa_id = $stmt_siswa->insert_id;
        
        // Simpan ke tabel ppdb_foto jika foto tersedia
        if ($foto_path !== null) {
            $stmt_foto = $conn->prepare("INSERT INTO ppdb_foto (ppdb_siswa_id, jenis, file_path) VALUES (?, 'foto_siswa', ?)");
            $stmt_foto->bind_param("is", $siswa_id, $foto_path);
            $stmt_foto->execute();
            $stmt_foto->close();
        }

        // Simpan data orang tua
        $stmt_ortu = $conn->prepare("INSERT INTO ppdb_ortu (
            ppdb_siswa_id,
            nama_ayah, tempat_lahir_ayah, tanggal_lahir_ayah, agama_ayah, kewarganegaraan_ayah, pendidikan_ayah, pekerjaan_ayah, no_hp_ayah,
            nama_ibu, tempat_lahir_ibu, tanggal_lahir_ibu, agama_ibu, kewarganegaraan_ibu, pendidikan_ibu, pekerjaan_ibu, no_hp_ibu
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

        $stmt_ortu->bind_param(
            "issssssssssssssss",
            $siswa_id,
            $nama_ayah, $tempat_lahir_ayah, $tanggal_lahir_ayah, $agama_ayah, $kewarganegaraan_ayah, $pendidikan_ayah, $pekerjaan_ayah, $no_hp_ayah,
            $nama_ibu, $tempat_lahir_ibu, $tanggal_lahir_ibu, $agama_ibu, $kewarganegaraan_ibu, $pendidikan_ibu, $pekerjaan_ibu, $no_hp_ibu
        );

        if ($stmt_ortu->execute()) {
            $response['success'] = true;
            $response['message'] = 'Data berhasil disimpan';
        } else {
            $response['message'] = 'Gagal menyimpan data orang tua: ' . $stmt_ortu->error;
        }
        $stmt_ortu->close();
    } else {
        $response['message'] = 'Gagal menyimpan data siswa: ' . $stmt_siswa->error;
    }

    $stmt_siswa->close();
} else {
    $response['message'] = 'Metode tidak diizinkan';
}

echo json_encode($response);  
?>

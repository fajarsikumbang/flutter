<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type");

include '../backend/db.php';

if (!isset($_GET['user_id'])) {
    echo json_encode([
        "status" => "error",
        "message" => "Parameter user_id tidak ditemukan"
    ]);
    exit;
}

$user_id = intval($_GET['user_id']);

// Ambil data siswa
$siswaQuery = mysqli_query($conn, "SELECT * FROM ppdb_siswa WHERE user_id = $user_id LIMIT 1");
$siswaData = mysqli_fetch_assoc($siswaQuery);

if (!$siswaData) {
    echo json_encode([
        "status" => "error",
        "message" => "Data tidak ditemukan"
    ]);
    exit;
}

$siswa_id = $siswaData['id'];

// Ambil data orang tua berdasarkan siswa_id
$ortuQuery = mysqli_query($conn, "SELECT * FROM ppdb_ortu WHERE ppdb_siswa_id = $siswa_id LIMIT 1");
$ortuData = mysqli_fetch_assoc($ortuQuery);

// Gabungkan data siswa dan ortu
$response = [
    "user_id" => $siswaData['user_id'],
    "namaLengkap" => $siswaData['nama_lengkap'],
    "namaPanggilan" => $siswaData['nama_panggilan'],
    "nik" => $siswaData['nik'],
    "tempatLahir" => $siswaData['tempat_lahir'],
    "tanggalLahir" => $siswaData['tanggal_lahir'],
    "agama" => $siswaData['agama'],
    "kewarganegaraan" => $siswaData['kewarganegaraan'],
    "jenisKelamin" => $siswaData['jenis_kelamin'],
    "alamat" => $siswaData['alamat'],
    "kabupaten" => $siswaData['kabupaten'],
    "anakKeberapa" => $siswaData['anak_keberapa'],
    "jumlahSaudaraKandung" => $siswaData['jumlah_saudara_kandung'],
    "jumlahSaudaraTiri" => $siswaData['jumlah_saudara_tiri'],
    "jumlahSaudaraAngkat" => $siswaData['jumlah_saudara_angkat'],
    "statusAnak" => $siswaData['status_anak'],
    "bahasaSehariHari" => $siswaData['bahasa_seharihari'],
    "beratBadan" => $siswaData['berat_badan'],
    "tinggiBadan" => $siswaData['tinggi_badan'],
    "golonganDarah" => $siswaData['golongan_darah'],
    "penyakitPernahDiderita" => $siswaData['penyakit_pernah_diderita'],
    "imunisasiPernahDiterima" => $siswaData['imunisasi_pernah_diterima'],
    "ciriKhusus" => $siswaData['ciri_khusus'],
    "tempatTinggal" => $siswaData['tempat_tinggal'],
    "asalMula" => $siswaData['asal_mula'],
    "pindahanDari" => $siswaData['pindahan_dari'],
    "namaAyah" => $ortuData['nama_ayah'] ?? '',
    "tempatLahirAyah" => $ortuData['tempat_lahir_ayah'] ?? '',
    "tanggalLahirAyah" => $ortuData['tanggal_lahir_ayah'] ?? '',
    "agamaAyah" => $ortuData['agama_ayah'] ?? '',
    "kewarganegaraanAyah" => $ortuData['kewarganegaraan_ayah'] ?? '',
    "pendidikanAyah" => $ortuData['pendidikan_ayah'] ?? '',
    "pekerjaanAyah" => $ortuData['pekerjaan_ayah'] ?? '',
    "noHpAyah" => $ortuData['no_hp_ayah'] ?? '',
    "namaIbu" => $ortuData['nama_ibu'] ?? '',
    "tempatLahirIbu" => $ortuData['tempat_lahir_ibu'] ?? '',
    "tanggalLahirIbu" => $ortuData['tanggal_lahir_ibu'] ?? '',
    "agamaIbu" => $ortuData['agama_ibu'] ?? '',
    "kewarganegaraanIbu" => $ortuData['kewarganegaraan_ibu'] ?? '',
    "pendidikanIbu" => $ortuData['pendidikan_ibu'] ?? '',
    "pekerjaanIbu" => $ortuData['pekerjaan_ibu'] ?? '',
    "noHpIbu" => $ortuData['no_hp_ibu'] ?? ''
];

echo json_encode([
    "status" => "success",
    "data" => $response
]);
?>

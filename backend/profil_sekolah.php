<?php  
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");


include 'db.php';  // Pastikan koneksi ke database berhasil

// Tentukan base URL untuk akses gambar
$baseUrl = 'http://localhost/login_tugas/admin-dashboard/uploads/';  // Ganti dengan URL yang sesuai

$response = [];

// Ambil Visi Misi dari tabel profil_sekolah_pisah
$queryProfil = mysqli_query($conn, "SELECT * FROM profil_sekolah_pisah LIMIT 1");
if ($queryProfil) {
    if ($data = mysqli_fetch_assoc($queryProfil)) {
        $response['visi'] = $data['visi'];
        $response['misi'] = $data['misi'];
        $response['tujuan'] = $data['tujuan'];
        $response['sistem_pembelajaran'] = $data['sistem_pembelajaran'];
    } else {
        // Jika tidak ada data ditemukan
        $response['visi'] = '';
        $response['misi'] = '';
        $response['tujuan'] = '';
        $response['sistem_pembelajaran'] = '';
    }
} else {
    // Jika query gagal
    $response['error'] = 'Failed to retrieve profile data';
}

// Ambil Jadwal Kegiatan
$queryJadwalKegiatan = mysqli_query($conn, "SELECT * FROM jadwal_kegiatan");
$jadwalKegiatan = [];
if ($queryJadwalKegiatan) {
    while ($row = mysqli_fetch_assoc($queryJadwalKegiatan)) {
        $jadwalKegiatan[] = [
            'nama_kegiatan' => $row['nama_kegiatan'],
            'jam_mulai' => $row['jam_mulai'],
            'jam_selesai' => $row['jam_selesai'],
            'deskripsi' => $row['deskripsi'],
        ];
    }
} else {
    $response['error'] = 'Failed to retrieve guru data';
}
$response['jadwalKegiatan'] = $jadwalKegiatan;

// Ambil Guru
$queryGuru = mysqli_query($conn, "SELECT * FROM guru");
$guru = [];
if ($queryGuru) {
    while ($row = mysqli_fetch_assoc($queryGuru)) {
        $guru[] = [
            'nama' => $row['nama'],
            'jabatan' => $row['jabatan'],
        ];
    }
} else {
    $response['error'] = 'Failed to retrieve guru data';
}
$response['guru'] = $guru;

// Ambil Kegiatan
$queryKegiatan = mysqli_query($conn, "SELECT * FROM kegiatan");
$kegiatan = [];
if ($queryKegiatan) {
    while ($row = mysqli_fetch_assoc($queryKegiatan)) {
        $kegiatan[] = [
            'judul' => $row['judul'],
            'keterangan' => $row['keterangan'],
        ];
    }
} else {
    $response['error'] = 'Failed to retrieve kegiatan data';
}
$response['kegiatan'] = $kegiatan;

// Ambil Galeri
$queryGaleri = mysqli_query($conn, "SELECT * FROM galeri");
$galeri = [];
if ($queryGaleri) {
    while ($row = mysqli_fetch_assoc($queryGaleri)) {
        // Gabungkan baseUrl dengan nama file foto
        $fotoUrl = $baseUrl . $row['foto'];  // Pastikan 'foto' di database adalah nama file yang benar
        $galeri[] = [
            'fotoUrl' => $fotoUrl,  // URL lengkap gambar
            'keterangan' => $row['keterangan'],
        ];
    }
} else {
    $response['error'] = 'Failed to retrieve galeri data';
}
$response['galeri'] = $galeri;

// Kirimkan response JSON
echo json_encode($response);
?>

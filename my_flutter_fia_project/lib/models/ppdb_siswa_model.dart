// class PpdbSiswa {
//   final String namaLengkap;
//   final String nik;
//   final String tempatLahir;
//   final String tanggalLahir;
//   final String jenisKelamin;
//   final String alamat;
//   final String kabupaten;
//   final String namaAyah;
//   final String pekerjaanAyah;
//   final String namaIbu;
//   final String pekerjaanIbu;
//   final String noHp;

//   PpdbSiswa({
//     required this.namaLengkap,
//     required this.nik,
//     required this.tempatLahir,
//     required this.tanggalLahir,
//     required this.jenisKelamin,
//     required this.alamat,
//     required this.kabupaten,
//     required this.namaAyah,
//     required this.pekerjaanAyah,
//     required this.namaIbu,
//     required this.pekerjaanIbu,
//     required this.noHp,
//   });

//   Map<String, String> toJson() {
//     return {
//       'nama_lengkap': namaLengkap,
//       'nik': nik,
//       'tempat_lahir': tempatLahir,
//       'tanggal_lahir': tanggalLahir,
//       'jenis_kelamin': jenisKelamin,
//       'alamat': alamat,
//       'kabupaten': kabupaten,
//       'nama_ayah': namaAyah,
//       'pekerjaan_ayah': pekerjaanAyah,
//       'nama_ibu': namaIbu,
//       'pekerjaan_ibu': pekerjaanIbu,
//       'no_hp': noHp,
//     };
//   }
// }

//menambahkan data orang tua
class PpdbSiswa {
  // final String userId;
  final int? userId;
  final String namaLengkap;
  final String namaPanggilan;
  final String nik;
  final String tempatLahir;
  final String tanggalLahir;
  final String agama;
  final String kewarganegaraan;
  final String jenisKelamin;
  final String alamat;
  final String kabupaten;
  //tambahan anak
  final String anakKeberapa;
  final String jumlahSaudaraKandung;
  final String jumlahSaudaraTiri;
  final String jumlahSaudaraAngkat;
  final String statusAnak;
  final String bahasaSehariHari;
  final String beratBadan;
  final String tinggiBadan;
  final String golonganDarah;
  final String penyakitPernahDiderita;
  final String imunisasiPernahDiterima;
  final String ciriKhusus;
  final String tempatTinggal;
  // Tambahan (Asal Mula)
  final String asalMula; // anak didik baru / pindahan
  final String? pindahanDari; // null kalau bukan pindahan

  // Data Ayah
  final String namaAyah;
  final String tempatLahirAyah;
  final String tanggalLahirAyah;
  final String agamaAyah;
  final String kewarganegaraanAyah;
  final String pendidikanAyah;
  final String pekerjaanAyah;
  final String noHpAyah;

  // Data Ibu
  final String namaIbu;
  final String tempatLahirIbu;
  final String tanggalLahirIbu;
  final String agamaIbu;
  final String kewarganegaraanIbu;
  final String pendidikanIbu;
  final String pekerjaanIbu;
  final String noHpIbu;
  final String? komentar;

  PpdbSiswa({
    // required this.userId,
    required this.userId,
    required this.namaLengkap,
    required this.namaPanggilan,
    required this.nik,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.agama,
    required this.kewarganegaraan,
    required this.jenisKelamin,
    required this.alamat,
    required this.kabupaten,
    //tambahan anak
    required this.anakKeberapa,
    required this.jumlahSaudaraKandung,
    required this.jumlahSaudaraTiri,
    required this.jumlahSaudaraAngkat,
    required this.statusAnak,
    required this.bahasaSehariHari,
    required this.beratBadan,
    required this.tinggiBadan,
    required this.golonganDarah,
    required this.penyakitPernahDiderita,
    required this.imunisasiPernahDiterima,
    required this.ciriKhusus,
    required this.tempatTinggal,
    //tambahan
    required this.asalMula,
    this.pindahanDari,

    // Data Ayah
    required this.namaAyah,
    required this.tempatLahirAyah,
    required this.tanggalLahirAyah,
    required this.agamaAyah,
    required this.kewarganegaraanAyah,
    required this.pendidikanAyah,
    required this.pekerjaanAyah,
    required this.noHpAyah,

    // Data Ibu
    required this.namaIbu,
    required this.tempatLahirIbu,
    required this.tanggalLahirIbu,
    required this.agamaIbu,
    required this.kewarganegaraanIbu,
    required this.pendidikanIbu,
    required this.pekerjaanIbu,
    required this.noHpIbu,
    this.komentar,
  });

  Map<String, String> toJson() {
    return {
      // 'user_id' : userId,
      'user_id': userId?.toString() ?? '',
      'nama_lengkap': namaLengkap,
      'nama_panggilan': namaPanggilan,
      'nik': nik,
      'tempat_lahir': tempatLahir,
      'tanggal_lahir': tanggalLahir,
      'agama': agama,
      'kewarganegaraan': kewarganegaraan,
      'jenis_kelamin': jenisKelamin,
      'alamat': alamat,
      'kabupaten': kabupaten,
      // Data anak keberapa dan saudara
      'anak_keberapa': anakKeberapa,
      'jumlah_saudara_kandung': jumlahSaudaraKandung,
      'jumlah_saudara_tiri': jumlahSaudaraTiri,
      'jumlah_saudara_angkat': jumlahSaudaraAngkat,
      'status_anak': statusAnak,
      'bahasa_sehari_hari': bahasaSehariHari,
      'berat_badan': beratBadan,
      'tinggi_badan': tinggiBadan,
      'golongan_darah': golonganDarah,
      'penyakit_pernah_diderita': penyakitPernahDiderita,
      'imunisasi_pernah_diterima': imunisasiPernahDiterima,
      'ciri_khusus': ciriKhusus,
      'tempat_tinggal': tempatTinggal,
      // Asal Mula
      'asal_mula': asalMula,
      'pindahan_dari': pindahanDari ?? '',

      // Data Ayah
      'nama_ayah': namaAyah,
      'tempat_lahir_ayah': tempatLahirAyah,
      'tanggal_lahir_ayah': tanggalLahirAyah,
      'agama_ayah': agamaAyah,
      'kewarganegaraan_ayah': kewarganegaraanAyah,
      'pendidikan_ayah': pendidikanAyah,
      'pekerjaan_ayah': pekerjaanAyah,
      'no_hp_ayah': noHpAyah,

      // Data Ibu
      'nama_ibu': namaIbu,
      'tempat_lahir_ibu': tempatLahirIbu,
      'tanggal_lahir_ibu': tanggalLahirIbu,
      'agama_ibu': agamaIbu,
      'kewarganegaraan_ibu': kewarganegaraanIbu,
      'pendidikan_ibu': pendidikanIbu,
      'pekerjaan_ibu': pekerjaanIbu,
      'no_hp_ibu': noHpIbu,
      'komentar': komentar ?? '',
    };
  }

  factory PpdbSiswa.fromJson(Map<String, dynamic> json) {
    return PpdbSiswa(
      userId: int.tryParse(json['user_id']?.toString() ?? '') ?? 0,
      namaLengkap: json['nama_lengkap'] ?? '',
      namaPanggilan: json['nama_panggilan'] ?? '',
      nik: json['nik'] ?? '',
      tempatLahir: json['tempat_lahir'] ?? '',
      tanggalLahir: json['tanggal_lahir'] ?? '',
      agama: json['agama'] ?? '',
      kewarganegaraan: json['kewarganegaraan'] ?? '',
      jenisKelamin: json['jenis_kelamin'] ?? '',
      alamat: json['alamat'] ?? '',
      kabupaten: json['kabupaten'] ?? '',
      anakKeberapa: json['anak_keberapa'] ?? '',
      jumlahSaudaraKandung: json['jumlah_saudara_kandung'] ?? '',
      jumlahSaudaraTiri: json['jumlah_saudara_tiri'] ?? '',
      jumlahSaudaraAngkat: json['jumlah_saudara_angkat'] ?? '',
      statusAnak: json['status_anak'] ?? '',
      bahasaSehariHari: json['bahasa_sehari_hari'] ?? '',
      beratBadan: json['berat_badan']?.toString() ?? '',
      tinggiBadan: json['tinggi_badan']?.toString() ?? '',
      golonganDarah: json['golongan_darah'] ?? '',
      penyakitPernahDiderita: json['penyakit_pernah_diderita'] ?? '',
      imunisasiPernahDiterima: json['imunisasi_pernah_diterima'] ?? '',
      ciriKhusus: json['ciri_khusus'] ?? '',
      tempatTinggal: json['tempat_tinggal'] ?? '',
      asalMula: json['asal_mula'] ?? '',
      pindahanDari: json['pindahan_dari'] == '' ? null : json['pindahan_dari'],
      namaAyah: json['nama_ayah'] ?? '',
      tempatLahirAyah: json['tempat_lahir_ayah'] ?? '',
      tanggalLahirAyah: json['tanggal_lahir_ayah'] ?? '',
      agamaAyah: json['agama_ayah'] ?? '',
      kewarganegaraanAyah: json['kewarganegaraan_ayah'] ?? '',
      pendidikanAyah: json['pendidikan_ayah'] ?? '',
      pekerjaanAyah: json['pekerjaan_ayah'] ?? '',
      noHpAyah: json['no_hp_ayah'] ?? '',
      namaIbu: json['nama_ibu'] ?? '',
      tempatLahirIbu: json['tempat_lahir_ibu'] ?? '',
      tanggalLahirIbu: json['tanggal_lahir_ibu'] ?? '',
      agamaIbu: json['agama_ibu'] ?? '',
      kewarganegaraanIbu: json['kewarganegaraan_ibu'] ?? '',
      pendidikanIbu: json['pendidikan_ibu'] ?? '',
      pekerjaanIbu: json['pekerjaan_ibu'] ?? '',
      noHpIbu: json['no_hp_ibu'] ?? '',
      komentar: json['komentar'],
    );
  }
}

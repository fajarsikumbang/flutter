class PpdbDokumen {
  int siswaId;
  String jenisDokumen; // Contoh: 'foto', 'akta', 'kk'
  String filePath;

  // Constructor
  PpdbDokumen({
    required this.siswaId,
    required this.jenisDokumen,
    required this.filePath,
  });

  // Konversi ke JSON
  Map<String, dynamic> toJson() {
    return {
      'siswa_id': siswaId,
      'jenis_dokumen': jenisDokumen,
      'file_path': filePath,
    };
  }

  // Membuat objek PpdbDokumen dari JSON (jika diperlukan)
  factory PpdbDokumen.fromJson(Map<String, dynamic> json) {
    return PpdbDokumen(
      siswaId: json['siswa_id'],
      jenisDokumen: json['jenis_dokumen'],
      filePath: json['file_path'],
    );
  }
}

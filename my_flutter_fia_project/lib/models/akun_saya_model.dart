class AkunSaya {
  final String username;
  final String email;
  final String status;
  final String? namaLengkap;
  final String? namaPanggilan;
  final String? komentar;

  AkunSaya({
    required this.username,
    required this.email,
    required this.status,
    this.namaLengkap,
    this.namaPanggilan,
    this.komentar,
  });

  factory AkunSaya.fromJson(Map<String, dynamic> json) {
    return AkunSaya(
      username: json['username'],
      email: json['email'],
      status: json['status'],
      namaLengkap: json['nama_lengkap'],
      namaPanggilan: json['nama_panggilan'],
      komentar: json['komentar'],
    );
  }
}

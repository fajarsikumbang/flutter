class ProfilSekolah {
  final String visi;
  final String misi;
  final String tujuan;
  final String sistemPembelajaran;
  final List<JadwalKegiatan> jadwalKegiatanList;
  final List<Guru> guruList;
  final List<Kegiatan> kegiatanList;
  final List<Galeri> galeriList;

  ProfilSekolah({
    required this.visi,
    required this.misi,
    required this.tujuan,
    required this.sistemPembelajaran,
    required this.jadwalKegiatanList,
    required this.guruList,
    required this.kegiatanList,
    required this.galeriList,
  });

  factory ProfilSekolah.fromJson(Map<String, dynamic> json) {
    return ProfilSekolah(
      visi: json['visi'],
      misi: json['misi'],
      tujuan: json['tujuan'],
      sistemPembelajaran: json['sistem_pembelajaran'],
      jadwalKegiatanList: (json['jadwalKegiatan'] as List<dynamic>?)
              ?.map((item) => JadwalKegiatan.fromJson(item))
              .toList() ??
          [],
      guruList: List<Guru>.from(json['guru'].map((x) => Guru.fromJson(x))),
      kegiatanList: List<Kegiatan>.from(
          json['kegiatan'].map((x) => Kegiatan.fromJson(x))),
      galeriList:
          List<Galeri>.from(json['galeri'].map((x) => Galeri.fromJson(x))),
    );
  }
}

class JadwalKegiatan {
  final String namaKegiatan;
  final String jamMulai;
  final String jamSelesai;
  final String deskripsi;

  JadwalKegiatan({
    required this.namaKegiatan,
    required this.jamMulai,
    required this.jamSelesai,
    required this.deskripsi,
  });

  // Factory constructor untuk membuat objek dari response JSON
  factory JadwalKegiatan.fromJson(Map<String, dynamic> json) {
    return JadwalKegiatan(
      namaKegiatan:
          json['nama_kegiatan'] ?? '', // Default ke string kosong jika null
      jamMulai: json['jam_mulai'] ?? '', // Default ke string kosong jika null
      jamSelesai:
          json['jam_selesai'] ?? '', // Default ke string kosong jika null
      deskripsi: json['deskripsi'] ?? '', // Default ke string kosong jika null
    );
  }
}

class Guru {
  final String nama;
  final String jabatan;

  Guru({required this.nama, required this.jabatan});

  factory Guru.fromJson(Map<String, dynamic> json) {
    return Guru(
      nama: json['nama'],
      jabatan: json['jabatan'],
    );
  }
}

class Kegiatan {
  final String judul;
  final String keterangan;

  Kegiatan({required this.judul, required this.keterangan});

  factory Kegiatan.fromJson(Map<String, dynamic> json) {
    return Kegiatan(
      judul: json['judul'],
      keterangan: json['keterangan'],
    );
  }
}

class Galeri {
  final String fotoUrl;
  final String keterangan;

  Galeri({required this.fotoUrl, required this.keterangan});

  factory Galeri.fromJson(Map<String, dynamic> json) {
    return Galeri(
      fotoUrl: json['fotoUrl'] ?? '', // Berikan nilai default jika null
      keterangan: json['keterangan'] ?? '', // Berikan nilai default jika null
    );
  }
}

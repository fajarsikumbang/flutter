// import 'package:flutter/material.dart';

// class ProfilSekolahScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text("Profil Sekolah"));
//   }
// }

import 'package:flutter/material.dart';
import '../models/profil_sekolah_model.dart';
import '../services/profil_sekolah_service.dart';

class ProfilSekolahScreen extends StatefulWidget {
  const ProfilSekolahScreen({super.key});

  @override
  State<ProfilSekolahScreen> createState() => _ProfilSekolahScreenState();
}

class _ProfilSekolahScreenState extends State<ProfilSekolahScreen> {
  late Future<ProfilSekolah> _profilFuture;

  @override
  void initState() {
    super.initState();
    _profilFuture = ProfilSekolahService().fetchProfilSekolah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Sekolah'),
        centerTitle: true,
      ),
      body: FutureBuilder<ProfilSekolah>(
        future: _profilFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Gagal memuat data: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Data tidak tersedia.'));
          }

          final profil = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Visi'),
                _buildCard(profil.visi),
                _buildSectionTitle('Misi'),
                _buildCard(profil.misi),
                _buildSectionTitle('Tujuan'),
                _buildCard(profil.tujuan),
                _buildSectionTitle('Sistem Pembelajaran'),
                _buildCard(profil.sistemPembelajaran),
                _buildSectionTitle('Jadwal Kegiatan'),
                ...profil.jadwalKegiatanList.map((jadwalKegiatan) => ListTile(
                      leading: const Icon(Icons.schedule),
                      title: Text(jadwalKegiatan.namaKegiatan),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Jam: ${jadwalKegiatan.jamMulai} - ${jadwalKegiatan.jamSelesai}'),
                          Text('Deskripsi: ${jadwalKegiatan.deskripsi}'),
                        ],
                      ),
                    )),
                _buildSectionTitle('Guru & Pendidik'),
                ...profil.guruList.map((guru) => ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(guru.nama),
                      subtitle: Text(guru.jabatan),
                    )),
                _buildSectionTitle('Kegiatan Belajar'),
                ...profil.kegiatanList.map((kegiatan) => ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(kegiatan.judul),
                      subtitle: Text(kegiatan.keterangan),
                    )),
                _buildSectionTitle('Galeri Foto'),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: profil.galeriList.length,
                  itemBuilder: (context, index) {
                    final galeri = profil.galeriList[index];
                    print("URL gambar: ${galeri.fotoUrl}");
                    return Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              galeri.fotoUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(galeri.keterangan,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12)),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCard(String content) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(content),
      ),
    );
  }
}

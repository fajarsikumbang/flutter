// import 'package:flutter/material.dart';

// class AkunSayaScreen extends StatelessWidget {
//   final int userId;

//   const AkunSayaScreen({Key? key, required this.userId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // gunakan userId untuk fetch data akun
//     return Center(
//       child: Text("Akun Saya - ID: $userId"),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../models/akun_saya_model.dart';
// import '../services/akun_saya_service.dart';
// import '../utils/constants.dart'; // <-- dipakai di bawah

// class AkunSayaScreen extends StatefulWidget {
//   const AkunSayaScreen({Key? key}) : super(key: key);

//   @override
//   State<AkunSayaScreen> createState() => _AkunSayaScreenState();
// }

// class _AkunSayaScreenState extends State<AkunSayaScreen> {
//   final AkunSayaService _service = AkunSayaService();
//   AkunSaya? _akun;
//   bool _loading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserInfo();
//   }

//   Future<void> _loadUserInfo() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? userId = prefs.getInt('user_id');

//     if (userId != null) {
//       final data = await _service.getUserInfo(userId);
//       setState(() {
//         _akun = data;
//         _loading = false;
//       });
//     } else {
//       setState(() {
//         _loading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(namaApp)), // ← menggunakan konstanta
//       body: _loading
//           ? const Center(child: CircularProgressIndicator())
//           : _akun == null
//               ? const Center(child: Text('Gagal memuat data user'))
//               : Padding(
//                   padding: const EdgeInsets.all(
//                       defaultPadding), // ← juga dari constants.dart
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       infoTile('Username', _akun!.username),
//                       infoTile('Email', _akun!.email),
//                       infoTile('Status Pendaftaran', _akun!.status),
//                       const SizedBox(height: 16),
//                       if (_akun!.status != 'Belum Mendaftar') ...[
//                         const Divider(),
//                         const Text('Data Pendaftaran',
//                             style: TextStyle(fontWeight: FontWeight.bold)),
//                         const SizedBox(height: 8),
//                         infoTile('Nama Lengkap', _akun!.namaLengkap ?? '-'),
//                         infoTile('Nama Panggilan', _akun!.namaPanggilan ?? '-'),
//                       ],
//                       if (_akun!.status == 'Ditolak' &&
//                           _akun!.komentar != null &&
//                           _akun!.komentar!.trim().isNotEmpty) ...[
//                         const Divider(height: 32),
//                         const Text('Komentar Admin',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.red)),
//                         const SizedBox(height: 8),
//                         Container(
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             color: Colors.red.shade50,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(color: Colors.red),
//                           ),
//                           child: Text(_akun!.komentar!),
//                         ),
//                       ],
//                     ],
//                   ),
//                 ),
//     );
//   }

//   Widget infoTile(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Expanded(flex: 3, child: Text(label)),
//           const SizedBox(width: 8),
//           Expanded(flex: 5, child: Text(': $value')),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/akun_saya_model.dart';
import '../services/akun_saya_service.dart';
import '../utils/constants.dart';
import '../screens/edit_pendaftaran_screen.dart';

class AkunSayaScreen extends StatefulWidget {
  const AkunSayaScreen({Key? key}) : super(key: key);

  @override
  State<AkunSayaScreen> createState() => _AkunSayaScreenState();
}

class _AkunSayaScreenState extends State<AkunSayaScreen> {
  final AkunSayaService _service = AkunSayaService();
  AkunSaya? _akun;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('user_id');

    if (userId != null) {
      final data = await _service.getUserInfo(userId);
      setState(() {
        _akun = data;
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(namaApp)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _akun == null
              ? const Center(child: Text('Gagal memuat data user'))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      infoTile('Username', _akun!.username),
                      infoTile('Email', _akun!.email),
                      infoTile('Status Pendaftaran', _akun!.status),
                      const SizedBox(height: 16),
                      if (_akun!.status != 'Belum Mendaftar') ...[
                        const Divider(),
                        const Text('Data Pendaftaran',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        infoTile('Nama Lengkap', _akun!.namaLengkap ?? '-'),
                        infoTile('Nama Panggilan', _akun!.namaPanggilan ?? '-'),
                      ],

                      // Komentar Admin jika status Ditolak
                      if (_akun!.status == 'Ditolak') ...[
                        if (_akun!.komentar != null &&
                            _akun!.komentar!.trim().isNotEmpty) ...[
                          const Divider(height: 32),
                          const Text('Komentar Admin',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.red),
                            ),
                            child: Text(_akun!.komentar!),
                          ),
                          const SizedBox(height: 16),
                        ],

                        // Tombol perbaiki pendaftaran
                        Center(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.edit),
                            label: const Text('Perbaiki Pendaftaran'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditPendaftaranScreen(
                                    akun: _akun!, // Mengirimkan objek AkunSaya
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ],
                  ),
                ),
    );
  }

  Widget infoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: Text(label)),
          const SizedBox(width: 8),
          Expanded(flex: 5, child: Text(': $value')),
        ],
      ),
    );
  }
}

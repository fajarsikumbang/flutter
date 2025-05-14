// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import '../services/dokumen_service.dart';
// import '../models/dokumen_model.dart';

// class UploadDokumenScreen extends StatefulWidget {
//   final int ppdbSiswaId;

//   UploadDokumenScreen({required this.ppdbSiswaId});

//   @override
//   _UploadDokumenScreenState createState() => _UploadDokumenScreenState();
// }

// class _UploadDokumenScreenState extends State<UploadDokumenScreen> {
//   File? foto;
//   File? akta;
//   File? kk;

//   final ImagePicker _picker = ImagePicker();

//   // Ambil gambar dari galeri atau kamera
//   Future<void> pickFile(String jenisFile) async {
//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         if (jenisFile == 'foto') {
//           foto = File(pickedFile.path);
//         } else if (jenisFile == 'akta') {
//           akta = File(pickedFile.path);
//         } else if (jenisFile == 'kk') {
//           kk = File(pickedFile.path);
//         }
//       });
//     }
//   }

//   // Upload dokumen
//   Future<void> uploadDokumen() async {
//     var response = await DokumenService.uploadDokumen(
//       ppdbSiswaId: widget.ppdbSiswaId,
//       foto: foto,
//       akta: akta,
//       kk: kk,
//     );

//     if (response != null && response.status == 'success') {
//       // Jika berhasil
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Dokumen berhasil diupload")));
//     } else {
//       // Jika gagal
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Gagal mengupload dokumen")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Berkas'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ListTile(
//               title: Text('Foto Siswa'),
//               trailing: IconButton(
//                 icon: Icon(Icons.camera_alt),
//                 onPressed: () => pickFile('foto'),
//               ),
//             ),
//             foto != null
//                 ? Image.file(foto!)
//                 : Text("Belum ada foto yang dipilih"),
//             SizedBox(height: 20),
//             ListTile(
//               title: Text('Akta Kelahiran'),
//               trailing: IconButton(
//                 icon: Icon(Icons.camera_alt),
//                 onPressed: () => pickFile('akta'),
//               ),
//             ),
//             akta != null
//                 ? Image.file(akta!)
//                 : Text("Belum ada akta yang dipilih"),
//             SizedBox(height: 20),
//             ListTile(
//               title: Text('Kartu Keluarga (KK)'),
//               trailing: IconButton(
//                 icon: Icon(Icons.camera_alt),
//                 onPressed: () => pickFile('kk'),
//               ),
//             ),
//             kk != null ? Image.file(kk!) : Text("Belum ada KK yang dipilih"),
//             SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: uploadDokumen,
//               child: Text('Upload Dokumen'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

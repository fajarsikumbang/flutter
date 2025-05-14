// import 'package:flutter/material.dart';
// import '../models/ppdb_siswa_model.dart';
// import 'package:my_flutter_fia_project/utils/pdf_helper.dart';

// class DetailPendaftarScreen extends StatelessWidget {
//   final PpdbSiswa siswa;

//   const DetailPendaftarScreen({super.key, required this.siswa});

//   Widget _buildDetailItem(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: 3,
//             child: Text(
//               "$label",
//               style: const TextStyle(
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           const Text(": "),
//           Expanded(
//             flex: 5,
//             child: Text(
//               value.isNotEmpty ? value : "-",
//               style: const TextStyle(color: Colors.black87),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail Pendaftaran'),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: Card(
//                 elevation: 6,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: ListView(
//                     children: [
//                       const Text(
//                         "Data Siswa",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       _buildDetailItem("Nama Lengkap", siswa.namaLengkap),
//                       _buildDetailItem("NIK", siswa.nik),
//                       _buildDetailItem("Tempat Lahir", siswa.tempatLahir),
//                       _buildDetailItem("Tanggal Lahir", siswa.tanggalLahir),
//                       _buildDetailItem("Jenis Kelamin", siswa.jenisKelamin),
//                       _buildDetailItem("Alamat", siswa.alamat),
//                       _buildDetailItem("Kabupaten/Kota", siswa.kabupaten),
//                       const Divider(height: 30),
//                       const Text(
//                         "Data Orang Tua",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       _buildDetailItem("Nama Ayah", siswa.namaAyah),
//                       _buildDetailItem("Pekerjaan Ayah", siswa.pekerjaanAyah),
//                       _buildDetailItem("Nama Ibu", siswa.namaIbu),
//                       _buildDetailItem("Pekerjaan Ibu", siswa.pekerjaanIbu),
//                       const Divider(height: 30),
//                       _buildDetailItem("No HP", siswa.noHp),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton.icon(
//               onPressed: () async {
//                 try {
//                   print("Mencetak PDF...");
//                   // Memanggil fungsi generatePdfFromSiswa
//                   await generatePdfFromSiswa(siswa);
//                   // Tampilkan notifikasi sukses (opsional)
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('PDF berhasil dicetak!')),
//                   );
//                 } catch (e) {
//                   // Tangani kesalahan dan tampilkan pesan error
//                   print("Terjadi kesalahan: $e");
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Terjadi kesalahan: $e')),
//                   );
//                 }
//               },
//               icon: const Icon(Icons.picture_as_pdf),
//               label: const Text('Cetak PDF'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//tambah data ortu
import 'package:flutter/material.dart';
import '../models/ppdb_siswa_model.dart';
import 'package:my_flutter_fia_project/utils/pdf_helper.dart';

class DetailPendaftarScreen extends StatelessWidget {
  final PpdbSiswa siswa;

  const DetailPendaftarScreen({Key? key, required this.siswa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pendaftar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildDetailItem('Nama Lengkap', siswa.namaLengkap),
            buildDetailItem('Nama Panggilan', siswa.namaPanggilan),
            buildDetailItem('NIK', siswa.nik),
            buildDetailItem('Tempat Lahir', siswa.tempatLahir),
            buildDetailItem('Tanggal Lahir', siswa.tanggalLahir),
            buildDetailItem('Agama', siswa.agama),
            buildDetailItem('Kewarganegaraan', siswa.kewarganegaraan),
            buildDetailItem('Jenis Kelamin', siswa.jenisKelamin),
            buildDetailItem('Alamat', siswa.alamat),
            buildDetailItem('Kabupaten/Kota', siswa.kabupaten),
            buildDetailItem('Anak Keberapa', siswa.anakKeberapa),
            buildDetailItem(
                'Jumlah Saudara Kandung', siswa.jumlahSaudaraKandung),
            buildDetailItem('Jumlah Saudara Tiri', siswa.jumlahSaudaraTiri),
            buildDetailItem('Jumlah Saudara Angkat', siswa.jumlahSaudaraAngkat),
            buildDetailItem('Status Anak', siswa.statusAnak),
            buildDetailItem('Bahasa Sehari - Hari', siswa.bahasaSehariHari),
            buildDetailItem('Berat Badan', siswa.beratBadan),
            buildDetailItem('Tinggi Badan', siswa.tinggiBadan),
            buildDetailItem('Golongan Darah', siswa.golonganDarah),
            buildDetailItem(
                'Penyakit Yang Diderita', siswa.penyakitPernahDiderita),
            buildDetailItem(
                'Imunisasi Yang Diterima', siswa.imunisasiPernahDiterima),
            buildDetailItem('Ciri Khusus', siswa.ciriKhusus),
            buildDetailItem('Tempat Tinggal', siswa.tempatTinggal),
            buildDetailItem('Asal Mula Anak', siswa.asalMula),

            // Menampilkan Asal Mula

            // Jika siswa memilih "Pindahan", tampilkan pindahanDari
            if (siswa.asalMula == 'Pindahan')
              buildDetailItem(
                  'Pindahan Dari', siswa.pindahanDari ?? 'Tidak Ada'),

            const SizedBox(height: 20),
            const Text('Data Orang Tua',
                style: TextStyle(fontWeight: FontWeight.bold)),
            buildDetailItem('Nama Ayah', siswa.namaAyah),
            buildDetailItem('Tempat Lahir Ayah', siswa.tempatLahirAyah),
            buildDetailItem('Tanggal Lahir Ayah', siswa.tanggalLahirAyah),
            buildDetailItem('Agama Ayah', siswa.agamaAyah),
            buildDetailItem('Kewarganegaraan Ayah', siswa.kewarganegaraanAyah),
            buildDetailItem('Pendidikan Ayah', siswa.pendidikanAyah),
            buildDetailItem('Pekerjaan Ayah', siswa.pekerjaanAyah),
            buildDetailItem('Nomor HP Ayah', siswa.noHpAyah),
            buildDetailItem('Nama Ibu', siswa.namaIbu),
            buildDetailItem('Tempat Lahir Ibu', siswa.tempatLahirIbu),
            buildDetailItem('Tanggal Lahir Ibu', siswa.tanggalLahirIbu),
            buildDetailItem('Agama Ibu', siswa.agamaIbu),
            buildDetailItem('Kewarganegaraan Ibu', siswa.kewarganegaraanIbu),
            buildDetailItem('Pendidikan Ibu', siswa.pendidikanIbu),
            buildDetailItem('Pekerjaan Ibu', siswa.pekerjaanIbu),
            buildDetailItem('Nomor HP Ibu', siswa.noHpIbu),
            ElevatedButton(
              onPressed: () {
                final pdfHelper = PdfHelper();
                pdfHelper.generatePdf(siswa);
              },
              child: const Text('Unduh PDF'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(label,
                  style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }
}

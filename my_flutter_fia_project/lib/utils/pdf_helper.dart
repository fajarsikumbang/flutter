// import 'dart:typed_data';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import '../models/ppdb_siswa_model.dart';

// Future<void> generatePdfFromSiswa(PpdbSiswa siswa) async {
//   final pdf = pw.Document();

//   // Menambahkan halaman baru ke PDF
//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) {
//         return pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text("Detail Pendaftaran Siswa",
//                 style:
//                     pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
//             pw.SizedBox(height: 20),
//             pw.Text("Data Siswa",
//                 style:
//                     pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
//             pw.SizedBox(height: 10),
//             _buildDetailItem("Nama Lengkap", siswa.namaLengkap),
//             _buildDetailItem("NIK", siswa.nik),
//             _buildDetailItem("Tempat Lahir", siswa.tempatLahir),
//             _buildDetailItem("Tanggal Lahir", siswa.tanggalLahir),
//             _buildDetailItem("Jenis Kelamin", siswa.jenisKelamin),
//             _buildDetailItem("Alamat", siswa.alamat),
//             _buildDetailItem("Kabupaten/Kota", siswa.kabupaten),
//             pw.Divider(),
//             pw.Text("Data Orang Tua",
//                 style:
//                     pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
//             pw.SizedBox(height: 10),
//             _buildDetailItem("Nama Ayah", siswa.namaAyah),
//             _buildDetailItem("Pekerjaan Ayah", siswa.pekerjaanAyah),
//             _buildDetailItem("Nama Ibu", siswa.namaIbu),
//             _buildDetailItem("Pekerjaan Ibu", siswa.pekerjaanIbu),
//             _buildDetailItem("No HP", siswa.noHp),
//           ],
//         );
//       },
//     ),
//   );

//   // Menyimpan PDF sebagai file
//   final Uint8List bytes = await pdf.save();

//   // Menampilkan preview PDF
//   await Printing.layoutPdf(
//     onLayout: (PdfPageFormat format) async => bytes,
//   );
// }

// pw.Widget _buildDetailItem(String label, String value) {
//   return pw.Row(
//     mainAxisAlignment: pw.MainAxisAlignment.start,
//     children: [
//       pw.Expanded(
//         flex: 3,
//         child:
//             pw.Text(label, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//       ),
//       pw.Text(": "),
//       pw.Expanded(
//         flex: 5,
//         child: pw.Text(value.isNotEmpty ? value : "-",
//             style: pw.TextStyle(color: PdfColors.black)),
//       ),
//     ],
//   );
// }

//tambah data ortu
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/ppdb_siswa_model.dart';

class PdfHelper {
  // Fungsi untuk menghasilkan PDF dari data siswa
  Future<void> generatePdf(PpdbSiswa siswa) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Detail Pendaftar',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              buildPdfSection('Nama Lengkap', siswa.namaLengkap),
              buildPdfSection('Nama Panggilan', siswa.namaPanggilan),
              buildPdfSection('NIK', siswa.nik),
              buildPdfSection('Tempat Lahir', siswa.tempatLahir),
              buildPdfSection('Tanggal Lahir', siswa.tanggalLahir),
              buildPdfSection('Agama', siswa.agama),
              buildPdfSection('Kewarganegaraan', siswa.kewarganegaraan),
              buildPdfSection('Jenis Kelamin', siswa.jenisKelamin),
              buildPdfSection('Alamat', siswa.alamat),
              buildPdfSection('Kabupaten/Kota', siswa.kabupaten),
              buildPdfSection('Anak Keberapa', siswa.anakKeberapa),
              buildPdfSection(
                  'Jumlah Saudara Kandung', siswa.jumlahSaudaraKandung),
              buildPdfSection('Jumlah Saudara Tiri', siswa.jumlahSaudaraTiri),
              buildPdfSection(
                  'Jumlah Saudara Angkat', siswa.jumlahSaudaraAngkat),
              buildPdfSection('Status Anak', siswa.statusAnak),
              buildPdfSection('Bahasa Sehari - Hari', siswa.bahasaSehariHari),
              buildPdfSection('Berat Badan', siswa.beratBadan),
              buildPdfSection('Tinggi Badan', siswa.tinggiBadan),
              buildPdfSection('Golongan Darah', siswa.golonganDarah),
              buildPdfSection(
                  'Penyakit Yang Diderita', siswa.penyakitPernahDiderita),
              buildPdfSection(
                  'Imunisasi Yang Diterima', siswa.imunisasiPernahDiterima),
              buildPdfSection('Ciri Khusus', siswa.ciriKhusus),
              buildPdfSection('Tempat Tinggal', siswa.tempatTinggal),
              buildPdfSection('Asal Mula Anak', siswa.asalMula),

              // Menampilkan Asal Mula

              // Jika siswa memilih "Pindahan", tampilkan pindahanDari
              if (siswa.asalMula == 'Pindahan')
                buildPdfSection(
                    'Pindahan Dari', siswa.pindahanDari ?? 'Tidak Ada'),
              pw.SizedBox(height: 20),
              pw.Text('Data Orang Tua',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              buildPdfSection('Nama Ayah', siswa.namaAyah),
              buildPdfSection('Tempat Lahir Ayah', siswa.tempatLahirAyah),
              buildPdfSection('Tanggal Lahir Ayah', siswa.tanggalLahirAyah),
              buildPdfSection('Agama Ayah', siswa.agamaAyah),
              buildPdfSection(
                  'Kewarganegaraan Ayah', siswa.kewarganegaraanAyah),
              buildPdfSection('Pendidikan Ayah', siswa.pendidikanAyah),
              buildPdfSection('Pekerjaan Ayah', siswa.pekerjaanAyah),
              buildPdfSection('Nomor HP Ayah', siswa.noHpAyah),
              buildPdfSection('Nama Ibu', siswa.namaIbu),
              buildPdfSection('Tempat Lahir Ibu', siswa.tempatLahirIbu),
              buildPdfSection('Tanggal Lahir Ibu', siswa.tanggalLahirIbu),
              buildPdfSection('Agama Ibu', siswa.agamaIbu),
              buildPdfSection('Kewarganegaraan Ibu', siswa.kewarganegaraanIbu),
              buildPdfSection('Pendidikan Ibu', siswa.pendidikanIbu),
              buildPdfSection('Pekerjaan Ibu', siswa.pekerjaanIbu),
              buildPdfSection('Nomor HP Ibu', siswa.noHpIbu),
            ],
          );
        },
      ),
    );

    // Cetak atau simpan PDF
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }

  // Membuat bagian PDF untuk setiap data (label dan value)
  pw.Widget buildPdfSection(String label, String value) {
    return pw.Row(
      children: [
        pw.Text('$label:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(width: 8),
        pw.Text(value),
      ],
    );
  }
}

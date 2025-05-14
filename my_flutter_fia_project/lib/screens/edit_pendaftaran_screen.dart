// import 'package:flutter/material.dart';
// import '../models/ppdb_siswa_model.dart';
// import '../services/ppdb_service.dart';
// import '../screens/detail_pendaftar_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PpdbSiswaScreen extends StatefulWidget {
//   const PpdbSiswaScreen({Key? key}) : super(key: key);

//   @override
//   State<PpdbSiswaScreen> createState() => _PpdbSiswaScreenState();
// }

// class _PpdbSiswaScreenState extends State<PpdbSiswaScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final PpdbService _ppdbService = PpdbService();

//   // Controllers
//   final TextEditingController _namaController = TextEditingController();
//   final TextEditingController _namaPanggilanController = TextEditingController();
//   final TextEditingController _nikController = TextEditingController();
//   final TextEditingController _tempatLahirController = TextEditingController();
//   final TextEditingController _tanggalLahirController = TextEditingController();
//   final TextEditingController _agamaController = TextEditingController();
//   final TextEditingController _kewarganegaraanController = TextEditingController();
//   final TextEditingController _alamatController = TextEditingController();
//   final TextEditingController _kabupatenController = TextEditingController();

//   // Additional fields
//   final TextEditingController _anakKeberapaController = TextEditingController();
//   final TextEditingController _jumlahSaudaraKandungController = TextEditingController();
//   final TextEditingController _jumlahSaudaraTiriController = TextEditingController();
//   final TextEditingController _jumlahSaudaraAngkatController = TextEditingController();
//   final TextEditingController _statusAnakController = TextEditingController();
//   final TextEditingController _bahasaSehariHariController = TextEditingController();
//   final TextEditingController _beratBadanController = TextEditingController();
//   final TextEditingController _tinggiBadanController = TextEditingController();
//   final TextEditingController _golonganDarahController = TextEditingController();
//   final TextEditingController _penyakitYangDideritaController = TextEditingController();
//   final TextEditingController _imunisasiYangDiterimaController = TextEditingController();
//   final TextEditingController _ciriKhususController = TextEditingController();
//   final TextEditingController _tempatTinggalController = TextEditingController();

//   final TextEditingController _pindahanDariController = TextEditingController();

//   final TextEditingController _namaAyahController = TextEditingController();
//   final TextEditingController _tempatLahirAyahController = TextEditingController();
//   final TextEditingController _tanggalLahirAyahController = TextEditingController();
//   final TextEditingController _agamaAyahController = TextEditingController();
//   final TextEditingController _kewarganegaraanAyahController = TextEditingController();
//   final TextEditingController _pendidikanAyahController = TextEditingController();
//   final TextEditingController _pekerjaanAyahController = TextEditingController();
//   final TextEditingController _noHpAyahController = TextEditingController();

//   final TextEditingController _namaIbuController = TextEditingController();
//   final TextEditingController _tempatLahirIbuController = TextEditingController();
//   final TextEditingController _tanggalLahirIbuController = TextEditingController();
//   final TextEditingController _agamaIbuController = TextEditingController();
//   final TextEditingController _kewarganegaraanIbuController = TextEditingController();
//   final TextEditingController _pendidikanIbuController = TextEditingController();
//   final TextEditingController _pekerjaanIbuController = TextEditingController();
//   final TextEditingController _noHpIbuController = TextEditingController();

//   int? _userId;
//   bool _sudahDaftar = false;

//   String _jenisKelamin = 'Laki-laki';
//   String _asalMula = 'Anak Didik Baru';

//   @override
//   void initState() {
//     super.initState();
//     _loadUserId();
//   }

//   Future<void> _loadUserId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? id = prefs.getInt('user_id');
//     setState(() {
//       _userId = id;
//     });
//     if (id != null) {
//       bool sudah = await _ppdbService.cekSudahDaftar(id);
//       setState(() {
//         _sudahDaftar = sudah;
//       });
//       if (sudah) {
//         await _getPendaftaranLama(id);
//       }
//     }
//   }

//   Future<void> _loadPendaftaranLama(int userId) async {
//     PpdbSiswa? siswa = await _ppdbService.getPendaftaranLama(userId);
//     if (siswa != null) {
//       setState(() {
//         _namaController.text = siswa.namaLengkap ?? '';
//         _namaPanggilanController.text = siswa.namaPanggilan ?? '';
//         _nikController.text = siswa.nik ?? '';
//         _tempatLahirController.text = siswa.tempatLahir ?? '';
//         _tanggalLahirController.text = siswa.tanggalLahir ?? '';
//         _agamaController.text = siswa.agama ?? '';
//         _kewarganegaraanController.text = siswa.kewarganegaraan ?? '';
//         _alamatController.text = siswa.alamat ?? '';
//         _kabupatenController.text = siswa.kabupaten ?? '';

//         // Additional fields
//         _anakKeberapaController.text = siswa.anakKeberapa ?? '';
//         _jumlahSaudaraKandungController.text = siswa.jumlahSaudaraKandung ?? '';
//         _jumlahSaudaraTiriController.text = siswa.jumlahSaudaraTiri ?? '';
//         _jumlahSaudaraAngkatController.text = siswa.jumlahSaudaraAngkat ?? '';
//         _statusAnakController.text = siswa.statusAnak ?? '';
//         _bahasaSehariHariController.text = siswa.bahasaSehariHari ?? '';
//         _beratBadanController.text = siswa.beratBadan ?? '';
//         _tinggiBadanController.text = siswa.tinggiBadan ?? '';
//         _golonganDarahController.text = siswa.golonganDarah ?? '';
//         _penyakitYangDideritaController.text = siswa.penyakitPernahDiderita ?? '';
//         _imunisasiYangDiterimaController.text = siswa.imunisasiPernahDiterima ?? '';
//         _ciriKhususController.text = siswa.ciriKhusus ?? '';
//         _tempatTinggalController.text = siswa.tempatTinggal ?? '';

//         _asalMula = siswa.asalMula ?? 'Anak Didik Baru';
//         _pindahanDariController.text = siswa.pindahanDari ?? '';

//         // Parent data
//         _namaAyahController.text = siswa.namaAyah ?? '';
//         _tempatLahirAyahController.text = siswa.tempatLahirAyah ?? '';
//         _tanggalLahirAyahController.text = siswa.tanggalLahirAyah ?? '';
//         _agamaAyahController.text = siswa.agamaAyah ?? '';
//         _kewarganegaraanAyahController.text = siswa.kewarganegaraanAyah ?? '';
//         _pendidikanAyahController.text = siswa.pendidikanAyah ?? '';
//         _pekerjaanAyahController.text = siswa.pekerjaanAyah ?? '';
//         _noHpAyahController.text = siswa.noHpAyah ?? '';

//         _namaIbuController.text = siswa.namaIbu ?? '';
//         _tempatLahirIbuController.text = siswa.tempatLahirIbu ?? '';
//         _tanggalLahirIbuController.text = siswa.tanggalLahirIbu ?? '';
//         _agamaIbuController.text = siswa.agamaIbu ?? '';
//         _kewarganegaraanIbuController.text = siswa.kewarganegaraanIbu ?? '';
//         _pendidikanIbuController.text = siswa.pendidikanIbu ?? '';
//         _pekerjaanIbuController.text = siswa.pekerjaanIbu ?? '';
//         _noHpIbuController.text = siswa.noHpIbu ?? '';
//       });
//     }
//   }

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       FocusScope.of(context).unfocus();

//       final siswa = PpdbSiswa(
//         userId: _userId,
//         namaLengkap: _namaController.text,
//         namaPanggilan: _namaPanggilanController.text,
//         nik: _nikController.text,
//         tempatLahir: _tempatLahirController.text,
//         tanggalLahir: _tanggalLahirController.text,
//         agama: _agamaController.text,
//         kewarganegaraan: _kewarganegaraanController.text,
//         jenisKelamin: _jenisKelamin,
//         alamat: _alamatController.text,
//         kabupaten: _kabupatenController.text,
//         anakKeberapa: _anakKeberapaController.text,
//         jumlahSaudaraKandung: _jumlahSaudaraKandungController.text,
//         jumlahSaudaraTiri: _jumlahSaudaraTiriController.text,
//         jumlahSaudaraAngkat: _jumlahSaudaraAngkatController.text,
//         statusAnak: _statusAnakController.text,
//         bahasaSehariHari: _bahasaSehariHariController.text,
//         beratBadan: _beratBadanController.text,
//         tinggiBadan: _tinggiBadanController.text,
//         golonganDarah: _golonganDarahController.text,
//         penyakitPernahDiderita: _penyakitYangDideritaController.text,
//         imunisasiPernahDiterima: _imunisasiYangDiterimaController.text,
//         ciriKhusus: _ciriKhususController.text,
//         tempatTinggal: _tempatTinggalController.text,
//         asalMula: _asalMula,
//         pindahanDari: _asalMula == 'Pindahan' ? _pindahanDariController.text : '',
//         namaAyah: _namaAyahController.text,
//         tempatLahirAyah: _tempatLahirAyahController.text,
//         tanggalLahirAyah: _tanggalLahirAyahController.text,
//         agamaAyah: _agamaAyahController.text,
//         kewarganegaraanAyah: _kewarganegaraanAyahController.text,
//         pendidikanAyah: _pendidikanAyahController.text,
//         pekerjaanAyah: _pekerjaanAyahController.text,
//         noHpAyah: _noHpAyahController.text,
//         namaIbu: _namaIbuController.text,
//         tempatLahirIbu: _tempatLahirIbuController.text,
//         tanggalLahirIbu: _tanggalLahirIbuController.text,
//         agamaIbu: _agamaIbuController.text,
//         kewarganegaraanIbu: _kewarganegaraanIbuController.text,
//         pendidikanIbu: _pendidikanIbuController.text,
//         pekerjaanIbu: _pekerjaanIbuController.text,
//         noHpIbu: _noHpIbuController.text,
//       );

//       bool success = await _ppdbService.submitPendaftaran(siswa);

//       if (success) {
//         if (!mounted) return;

//         await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Pendaftaran Berhasil'),
//             content:
//                 const Text('Data pendaftaran berhasil dikirim ke database.'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: const Text('Tutup'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => DetailPendaftarScreen(siswa: siswa),
//                     ),
//                   );
//                 },
//                 child: const Text('Lihat Detail'),
//               ),
//             ],
//           ),
//         );
//       } else {
//         if (!mounted) return;
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Gagal mengirim pendaftaran.')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_userId == null) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     if (_sudahDaftar) {
//       return Scaffold(
//         appBar: AppBar(title: const Text('Form Pendaftaran')),
//         body: const Center(
//           child: Text(
//             'Anda sudah melakukan pendaftaran.',
//             style: TextStyle(fontSize: 16),
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(title: const Text('Formulir Pendaftaran Siswa')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               buildTextField(_namaController, 'Nama Lengkap'),
//               buildTextField(_namaPanggilanController, 'Nama Panggilan'),
//               buildTextField(_nikController, 'NIK'),
//               buildTextField(_tempatLahirController, 'Tempat Lahir'),
//               buildTextField(_tanggalLahirController, 'Tanggal Lahir'),
//               buildTextField(_agamaController, 'Agama'),
//               buildTextField(_kewarganegaraanController, 'Kewarganegaraan'),
//               buildTextField(_alamatController, 'Alamat Lengkap'),
//               buildTextField(_kabupatenController, 'Kabupaten/Kota'),
//               // ... additional form fields here ...
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 child: const Text('Kirim Pendaftaran'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(TextEditingController controller, String label) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12.0),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: const OutlineInputBorder(),
//         ),
//         validator: (value) =>
//             value == null || value.isEmpty ? 'Tidak boleh kosong' : null,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/akun_saya_model.dart';

class EditPendaftaranScreen extends StatefulWidget {
  final AkunSaya akun;

  const EditPendaftaranScreen({Key? key, required this.akun}) : super(key: key);

  @override
  State<EditPendaftaranScreen> createState() => _EditPendaftaranScreenState();
}

class _EditPendaftaranScreenState extends State<EditPendaftaranScreen> {
  late TextEditingController _namaLengkapController;
  late TextEditingController _namaPanggilanController;

  @override
  void initState() {
    super.initState();
    _namaLengkapController =
        TextEditingController(text: widget.akun.namaLengkap ?? '');
    _namaPanggilanController =
        TextEditingController(text: widget.akun.namaPanggilan ?? '');
  }

  @override
  void dispose() {
    _namaLengkapController.dispose();
    _namaPanggilanController.dispose();
    super.dispose();
  }

  void _simpanPerubahan() {
    // logika simpan ke backend di sini
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Perubahan disimpan')),
    );
    Navigator.pop(context); // kembali ke halaman sebelumnya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Pendaftaran')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _namaLengkapController,
              decoration: const InputDecoration(labelText: 'Nama Lengkap'),
            ),
            TextFormField(
              controller: _namaPanggilanController,
              decoration: const InputDecoration(labelText: 'Nama Panggilan'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _simpanPerubahan,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../models/ppdb_siswa_model.dart';
// import '../services/ppdb_service.dart';
// // import '../screens/detail_pendaftar_screen.dart';

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
//   final TextEditingController _nikController = TextEditingController();
//   final TextEditingController _tempatLahirController = TextEditingController();
//   final TextEditingController _tanggalLahirController = TextEditingController();
//   final TextEditingController _alamatController = TextEditingController();
//   final TextEditingController _kabupatenController = TextEditingController();
//   final TextEditingController _namaAyahController = TextEditingController();
//   final TextEditingController _pekerjaanAyahController =
//       TextEditingController();
//   final TextEditingController _namaIbuController = TextEditingController();
//   final TextEditingController _pekerjaanIbuController = TextEditingController();
//   final TextEditingController _noHpController = TextEditingController();

//   String _jenisKelamin = 'Laki-laki';

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       FocusScope.of(context).unfocus(); // Tutup keyboard

//       final siswa = PpdbSiswa(
//         namaLengkap: _namaController.text,
//         nik: _nikController.text,
//         tempatLahir: _tempatLahirController.text,
//         tanggalLahir: _tanggalLahirController.text,
//         jenisKelamin: _jenisKelamin,
//         alamat: _alamatController.text,
//         kabupaten: _kabupatenController.text,
//         namaAyah: _namaAyahController.text,
//         pekerjaanAyah: _pekerjaanAyahController.text,
//         namaIbu: _namaIbuController.text,
//         pekerjaanIbu: _pekerjaanIbuController.text,
//         noHp: _noHpController.text,
//       );

//       bool success = await _ppdbService.submitPendaftaran(siswa);

//       if (success) {
//         if (!mounted) return;

//         // Tampilkan dialog sukses
//         await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Pendaftaran Berhasil'),
//             content: const Text('Data pendaftaran berhasil dikirim ke database.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Tutup dialog
//                 },
//                 child: const Text('Tutup'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Tutup dialog
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

//         // Reset form
//         _formKey.currentState!.reset();
//         _namaController.clear();
//         _nikController.clear();
//         _tempatLahirController.clear();
//         _tanggalLahirController.clear();
//         _alamatController.clear();
//         _kabupatenController.clear();
//         _namaAyahController.clear();
//         _pekerjaanAyahController.clear();
//         _namaIbuController.clear();
//         _pekerjaanIbuController.clear();
//         _noHpController.clear();
//         setState(() {
//           _jenisKelamin = 'Laki-laki';
//         });
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
//     return Scaffold(
//       appBar: AppBar(title: const Text('Formulir Pendaftaran Siswa')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               buildTextField(_namaController, 'Nama Lengkap'),
//               buildTextField(_nikController, 'NIK'),
//               buildTextField(_tempatLahirController, 'Tempat Lahir'),
//               buildTextField(
//                   _tanggalLahirController, 'Tanggal Lahir (yyyy-mm-dd)'),
//               DropdownButtonFormField<String>(
//                 value: _jenisKelamin,
//                 items: ['Laki-laki', 'Perempuan']
//                     .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                     .toList(),
//                 onChanged: (val) => setState(() => _jenisKelamin = val!),
//                 decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
//               ),
//               buildTextField(_alamatController, 'Alamat Lengkap'),
//               buildTextField(_kabupatenController, 'Kabupaten/Kota'),
//               const SizedBox(height: 20),
//               const Text('Data Orang Tua',
//                   style: TextStyle(fontWeight: FontWeight.bold)),
//               buildTextField(_namaAyahController, 'Nama Ayah'),
//               buildTextField(_pekerjaanAyahController, 'Pekerjaan Ayah'),
//               buildTextField(_namaIbuController, 'Nama Ibu'),
//               buildTextField(_pekerjaanIbuController, 'Pekerjaan Ibu'),
//               buildTextField(_noHpController, 'Nomor HP Orang Tua/Wali'),
//               const SizedBox(height: 20),
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

//tambah data orang tua
// import 'package:flutter/material.dart';
// import '../models/ppdb_siswa_model.dart';
// import '../services/ppdb_service.dart';
// import '../screens/detail_pendaftar_screen.dart';

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
//   final TextEditingController _nikController = TextEditingController();
//   final TextEditingController _tempatLahirController = TextEditingController();
//   final TextEditingController _tanggalLahirController = TextEditingController();
//   final TextEditingController _alamatController = TextEditingController();
//   final TextEditingController _kabupatenController = TextEditingController();
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

//   String _jenisKelamin = 'Laki-laki';

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       FocusScope.of(context).unfocus(); // Tutup keyboard

//       final siswa = PpdbSiswa(
//         namaLengkap: _namaController.text,
//         nik: _nikController.text,
//         tempatLahir: _tempatLahirController.text,
//         tanggalLahir: _tanggalLahirController.text,
//         jenisKelamin: _jenisKelamin,
//         alamat: _alamatController.text,
//         kabupaten: _kabupatenController.text,
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

//         // Tampilkan dialog sukses
//         await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Pendaftaran Berhasil'),
//             content: const Text('Data pendaftaran berhasil dikirim ke database.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Tutup dialog
//                 },
//                 child: const Text('Tutup'),
//               ),
//               // Jika ingin membuka detail pendaftar
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Tutup dialog
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

//         // Reset form
//         _formKey.currentState!.reset();
//         _namaController.clear();
//         _nikController.clear();
//         _tempatLahirController.clear();
//         _tanggalLahirController.clear();
//         _alamatController.clear();
//         _kabupatenController.clear();
//         _namaAyahController.clear();
//         _tempatLahirAyahController.clear();
//         _tanggalLahirAyahController.clear();
//         _agamaAyahController.clear();
//         _kewarganegaraanAyahController.clear();
//         _pendidikanAyahController.clear();
//         _pekerjaanAyahController.clear();
//         _noHpAyahController.clear();
//         _namaIbuController.clear();
//         _tempatLahirIbuController.clear();
//         _tanggalLahirIbuController.clear();
//         _agamaIbuController.clear();
//         _kewarganegaraanIbuController.clear();
//         _pendidikanIbuController.clear();
//         _pekerjaanIbuController.clear();
//         _noHpIbuController.clear();
//         setState(() {
//           _jenisKelamin = 'Laki-laki';
//         });
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
//     return Scaffold(
//       appBar: AppBar(title: const Text('Formulir Pendaftaran Siswa')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               buildTextField(_namaController, 'Nama Lengkap'),
//               buildTextField(_nikController, 'NIK'),
//               buildTextField(_tempatLahirController, 'Tempat Lahir'),
//               buildTextField(_tanggalLahirController, 'Tanggal Lahir (yyyy-mm-dd)'),
//               DropdownButtonFormField<String>(
//                 value: _jenisKelamin,
//                 items: ['Laki-laki', 'Perempuan']
//                     .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                     .toList(),
//                 onChanged: (val) => setState(() => _jenisKelamin = val!),
//                 decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
//               ),
//               buildTextField(_alamatController, 'Alamat Lengkap'),
//               buildTextField(_kabupatenController, 'Kabupaten/Kota'),
//               const SizedBox(height: 20),
//               const Text('Data Orang Tua', style: TextStyle(fontWeight: FontWeight.bold)),
//               buildTextField(_namaAyahController, 'Nama Ayah'),
//               buildTextField(_tempatLahirAyahController, 'Tempat Lahir Ayah'),
//               buildTextField(_tanggalLahirAyahController, 'Tanggal Lahir Ayah'),
//               buildTextField(_agamaAyahController, 'Agama Ayah'),
//               buildTextField(_kewarganegaraanAyahController, 'Kewarganegaraan Ayah'),
//               buildTextField(_pendidikanAyahController, 'Pendidikan Ayah'),
//               buildTextField(_pekerjaanAyahController, 'Pekerjaan Ayah'),
//               buildTextField(_noHpAyahController, 'Nomor HP Ayah'),
//               buildTextField(_namaIbuController, 'Nama Ibu'),
//               buildTextField(_tempatLahirIbuController, 'Tempat Lahir Ibu'),
//               buildTextField(_tanggalLahirIbuController, 'Tanggal Lahir Ibu'),
//               buildTextField(_agamaIbuController, 'Agama Ibu'),
//               buildTextField(_kewarganegaraanIbuController, 'Kewarganegaraan Ibu'),
//               buildTextField(_pendidikanIbuController, 'Pendidikan Ibu'),
//               buildTextField(_pekerjaanIbuController, 'Pekerjaan Ibu'),
//               buildTextField(_noHpIbuController, 'Nomor HP Ibu'),
//               const SizedBox(height: 20),
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

//Tambah data baru
import 'package:flutter/material.dart';
// import '../screens/upload_dokumen_screen.dart';
import '../models/ppdb_siswa_model.dart';
import '../services/ppdb_service.dart';
import '../screens/detail_pendaftar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PpdbSiswaScreen extends StatefulWidget {
  const PpdbSiswaScreen({Key? key}) : super(key: key);

  @override
  State<PpdbSiswaScreen> createState() => _PpdbSiswaScreenState();
}

class _PpdbSiswaScreenState extends State<PpdbSiswaScreen> {
  final _formKey = GlobalKey<FormState>();
  final PpdbService _ppdbService = PpdbService();

  // Controllers
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _namaPanggilanController =
      TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _tempatLahirController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  final TextEditingController _agamaController = TextEditingController();
  final TextEditingController _kewarganegaraanController =
      TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _kabupatenController = TextEditingController();
  // baru
  final TextEditingController _anakKeberapaController = TextEditingController();
  final TextEditingController _jumlahSaudaraKandungController =
      TextEditingController();
  final TextEditingController _jumlahSaudaraTiriController =
      TextEditingController();
  final TextEditingController _jumlahSaudaraAngkatController =
      TextEditingController();
  final TextEditingController _statusAnakController = TextEditingController();
  final TextEditingController _bahasaSehariHariController =
      TextEditingController();
  final TextEditingController _beratBadanController = TextEditingController();
  final TextEditingController _tinggiBadanController = TextEditingController();
  final TextEditingController _golonganDarahController =
      TextEditingController();
  final TextEditingController _penyakitYangDideritaController =
      TextEditingController();
  final TextEditingController _imunisasiYangDiterimaController =
      TextEditingController();
  final TextEditingController _ciriKhususController = TextEditingController();
  final TextEditingController _tempatTinggalController =
      TextEditingController();

  final TextEditingController _pindahanDariController = TextEditingController();

  final TextEditingController _namaAyahController = TextEditingController();
  final TextEditingController _tempatLahirAyahController =
      TextEditingController();
  final TextEditingController _tanggalLahirAyahController =
      TextEditingController();
  final TextEditingController _agamaAyahController = TextEditingController();
  final TextEditingController _kewarganegaraanAyahController =
      TextEditingController();
  final TextEditingController _pendidikanAyahController =
      TextEditingController();
  final TextEditingController _pekerjaanAyahController =
      TextEditingController();
  final TextEditingController _noHpAyahController = TextEditingController();

  final TextEditingController _namaIbuController = TextEditingController();
  final TextEditingController _tempatLahirIbuController =
      TextEditingController();
  final TextEditingController _tanggalLahirIbuController =
      TextEditingController();
  final TextEditingController _agamaIbuController = TextEditingController();
  final TextEditingController _kewarganegaraanIbuController =
      TextEditingController();
  final TextEditingController _pendidikanIbuController =
      TextEditingController();
  final TextEditingController _pekerjaanIbuController = TextEditingController();
  final TextEditingController _noHpIbuController = TextEditingController();

  int? _userId;
  bool _sudahDaftar = false;
  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  // Future<void> _loadUserId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _userId = prefs.getInt('user_id');
  //   });
  // }
  Future<void> _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('user_id');
    setState(() {
      _userId = id;
    });
    if (id != null) {
      bool sudah = await _ppdbService.cekSudahDaftar(id);
      setState(() {
        _sudahDaftar = sudah;
      });
    }
  }

  String _jenisKelamin = 'Laki-laki';
  String _asalMula = 'Anak Didik Baru'; // Default pilihan asal mula

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();

      final siswa = PpdbSiswa(
        userId: _userId,
        namaLengkap: _namaController.text,
        namaPanggilan: _namaPanggilanController.text,
        nik: _nikController.text,
        tempatLahir: _tempatLahirController.text,
        tanggalLahir: _tanggalLahirController.text,
        agama: _agamaController.text,
        kewarganegaraan: _kewarganegaraanController.text,
        jenisKelamin: _jenisKelamin,
        alamat: _alamatController.text,
        kabupaten: _kabupatenController.text,
        //baru
        anakKeberapa: _anakKeberapaController.text,
        jumlahSaudaraKandung: _jumlahSaudaraKandungController.text,
        jumlahSaudaraTiri: _jumlahSaudaraTiriController.text,
        jumlahSaudaraAngkat: _jumlahSaudaraAngkatController.text,
        statusAnak: _statusAnakController.text,
        bahasaSehariHari: _bahasaSehariHariController.text,
        beratBadan: _beratBadanController.text,
        tinggiBadan: _tinggiBadanController.text,
        golonganDarah: _golonganDarahController.text,
        penyakitPernahDiderita: _penyakitYangDideritaController.text,
        imunisasiPernahDiterima: _imunisasiYangDiterimaController.text,
        ciriKhusus: _ciriKhususController.text,
        tempatTinggal: _tempatTinggalController.text,

        asalMula: _asalMula,
        pindahanDari:
            _asalMula == 'Pindahan' ? _pindahanDariController.text : '',
        namaAyah: _namaAyahController.text,
        tempatLahirAyah: _tempatLahirAyahController.text,
        tanggalLahirAyah: _tanggalLahirAyahController.text,
        agamaAyah: _agamaAyahController.text,
        kewarganegaraanAyah: _kewarganegaraanAyahController.text,
        pendidikanAyah: _pendidikanAyahController.text,
        pekerjaanAyah: _pekerjaanAyahController.text,
        noHpAyah: _noHpAyahController.text,
        namaIbu: _namaIbuController.text,
        tempatLahirIbu: _tempatLahirIbuController.text,
        tanggalLahirIbu: _tanggalLahirIbuController.text,
        agamaIbu: _agamaIbuController.text,
        kewarganegaraanIbu: _kewarganegaraanIbuController.text,
        pendidikanIbu: _pendidikanIbuController.text,
        pekerjaanIbu: _pekerjaanIbuController.text,
        noHpIbu: _noHpIbuController.text,
      );

      bool success = await _ppdbService.submitPendaftaran(siswa);

      if (success) {
        if (!mounted) return;

        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Pendaftaran Berhasil'),
            content:
                const Text('Data pendaftaran berhasil dikirim ke database.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Tutup'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailPendaftarScreen(siswa: siswa),
                    ),
                  );
                },
                child: const Text('Lihat Detail'),
              ),
            ],
          ),
        );

        _formKey.currentState!.reset();
        _namaController.clear();
        _namaPanggilanController.clear();
        _nikController.clear();
        _tempatLahirController.clear();
        _tanggalLahirController.clear();
        _agamaController.clear();
        _kewarganegaraanController.clear();
        _alamatController.clear();
        _kabupatenController.clear();
        _anakKeberapaController.clear();
        _jumlahSaudaraKandungController.clear();
        _jumlahSaudaraTiriController.clear();
        _jumlahSaudaraAngkatController.clear();
        _statusAnakController.clear();
        _bahasaSehariHariController.clear();
        _beratBadanController.clear();
        _tinggiBadanController.clear();
        _golonganDarahController.clear();
        _penyakitYangDideritaController.clear();
        _imunisasiYangDiterimaController.clear();
        _ciriKhususController.clear();
        _tempatTinggalController.clear();
        _pindahanDariController.clear();
        _namaAyahController.clear();
        _tempatLahirAyahController.clear();
        _tanggalLahirAyahController.clear();
        _agamaAyahController.clear();
        _kewarganegaraanAyahController.clear();
        _pendidikanAyahController.clear();
        _pekerjaanAyahController.clear();
        _noHpAyahController.clear();
        _namaIbuController.clear();
        _tempatLahirIbuController.clear();
        _tanggalLahirIbuController.clear();
        _agamaIbuController.clear();
        _kewarganegaraanIbuController.clear();
        _pendidikanIbuController.clear();
        _pekerjaanIbuController.clear();
        _noHpIbuController.clear();
        setState(() {
          _jenisKelamin = 'Laki-laki';
          _asalMula = 'Anak Didik Baru';
        });
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal mengirim pendaftaran.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_userId == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_sudahDaftar) {
      return Scaffold(
        appBar: AppBar(title: const Text('Form Pendaftaran')),
        body: const Center(
          child: Text(
            'Anda sudah melakukan pendaftaran.',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Formulir Pendaftaran Siswa')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField(_namaController, 'Nama Lengkap'),
              buildTextField(_namaPanggilanController, 'Nama Panggilan'),
              buildTextField(_nikController, 'NIK'),
              buildTextField(_tempatLahirController, 'Tempat Lahir'),
              buildTextField(
                  _tanggalLahirController, 'Tanggal Lahir (yyyy-mm-dd)'),
              buildTextField(_agamaController, 'Agama'),
              buildTextField(_kewarganegaraanController, 'Kewarganegaraan'),
              DropdownButtonFormField<String>(
                value: _jenisKelamin,
                items: ['Laki-laki', 'Perempuan']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => _jenisKelamin = val!),
                decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
              ),
              buildTextField(_alamatController, 'Alamat Lengkap'),
              buildTextField(_kabupatenController, 'Kabupaten/Kota'),
              buildTextField(_anakKeberapaController, 'Anak Keberapa'),
              buildTextField(
                  _jumlahSaudaraKandungController, 'Jumlah Saudara Kandung'),
              buildTextField(
                  _jumlahSaudaraTiriController, 'Jumlah Saudara Tiri'),
              buildTextField(
                  _jumlahSaudaraAngkatController, 'Jumlah Saudara Angkat'),
              buildTextField(_statusAnakController, 'Status Anak'),
              buildTextField(
                  _bahasaSehariHariController, "Bahasa Sehari - Hari"),
              buildTextField(_beratBadanController, 'Berat Badan'),
              buildTextField(_tinggiBadanController, 'Tinggi Badan'),
              buildTextField(_golonganDarahController, 'Golongan Darah'),
              buildTextField(_penyakitYangDideritaController,
                  'Penyakit Yang Pernah Diderita'),
              buildTextField(_imunisasiYangDiterimaController,
                  'Imunisasi Yang Pernah Diterima'),
              buildTextField(_ciriKhususController, 'Ciri Khusus'),
              buildTextField(
                  _tempatTinggalController, 'Tempat Tinggal Sekarang'),
              const SizedBox(height: 20),
              const Text('Asal Mula Anak',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                value: _asalMula,
                items: ['Anak Didik Baru', 'Pindahan']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _asalMula = val!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Asal Mula Anak'),
              ),
              if (_asalMula == 'Pindahan')
                buildTextField(_pindahanDariController,
                    'Pindahan dari (Nama Sekolah Lama)'),
              const SizedBox(height: 20),
              const Text('Data Orang Tua',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              buildTextField(_namaAyahController, 'Nama Ayah'),
              buildTextField(_tempatLahirAyahController, 'Tempat Lahir Ayah'),
              buildTextField(_tanggalLahirAyahController, 'Tanggal Lahir Ayah'),
              buildTextField(_agamaAyahController, 'Agama Ayah'),
              buildTextField(
                  _kewarganegaraanAyahController, 'Kewarganegaraan Ayah'),
              buildTextField(_pendidikanAyahController, 'Pendidikan Ayah'),
              buildTextField(_pekerjaanAyahController, 'Pekerjaan Ayah'),
              buildTextField(_noHpAyahController, 'Nomor HP Ayah'),
              buildTextField(_namaIbuController, 'Nama Ibu'),
              buildTextField(_tempatLahirIbuController, 'Tempat Lahir Ibu'),
              buildTextField(_tanggalLahirIbuController, 'Tanggal Lahir Ibu'),
              buildTextField(_agamaIbuController, 'Agama Ibu'),
              buildTextField(
                  _kewarganegaraanIbuController, 'Kewarganegaraan Ibu'),
              buildTextField(_pendidikanIbuController, 'Pendidikan Ibu'),
              buildTextField(_pekerjaanIbuController, 'Pekerjaan Ibu'),
              buildTextField(_noHpIbuController, 'Nomor HP Ibu'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Kirim Pendaftaran'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? 'Tidak boleh kosong' : null,
      ),
    );
  }
}

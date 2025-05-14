import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/ppdb_siswa_model.dart';
import '../utils/constants.dart';

class PpdbService {
  Future<bool> submitPendaftaran(PpdbSiswa siswa) async {
    final url = Uri.parse('$baseUrl/ppdb_siswa_form.php');

    // Pastikan menggunakan method POST dengan 'application/x-www-form-urlencoded'
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: siswa.toJson(),
    );

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Parsed response: $data');
      return data['success'] == true;
    } else {
      return false;
    }
  }

  Future<bool> cekSudahDaftar(int userId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/cek_pendaftaran.php'),
      body: {'user_id': userId.toString()},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['sudah_daftar'] == true;
    }
    return false;
  }

  // Ambil data pendaftaran berdasarkan ID (untuk edit/detail)
  Future<PpdbSiswa?> getPendaftaranByUserId(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/get_pendaftaran.php?user_id=$userId'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success']) {
        return PpdbSiswa.fromJson(data['data']);
      }
    }
    return null;
  }

  // Future<bool> updatePendaftaran(PpdbSiswa siswa) async {
  //   final url = Uri.parse('$baseUrl/update_ppdb_siswa.php');

  //   final response = await http.post(
  //     url,
  //     body: {
  //       'id': siswa.userId.toString(),
  //       'nama_lengkap': siswa.namaLengkap,
  //       'nama_panggilan': siswa.namaPanggilan,
  //       'nik': siswa.nik,
  //       'tempat_lahir': siswa.tempatLahir,
  //       'tanggal_lahir': siswa.tanggalLahir,
  //       'agama': siswa.agama,
  //       'kewarganegaraan': siswa.kewarganegaraan,
  //       'jenis_kelamin': siswa.jenisKelamin,
  //       'alamat': siswa.alamat,
  //       'kabupaten': siswa.kabupaten,
  //       'anak_keberapa': siswa.anakKeberapa,
  //       'jumlah_saudara_kandung': siswa.jumlahSaudaraKandung,
  //       'jumlah_saudara_tiri': siswa.jumlahSaudaraTiri,
  //       'jumlah_saudara_angkat': siswa.jumlahSaudaraAngkat,
  //       'status_anak': siswa.statusAnak,
  //       'bahasa_sehari_hari': siswa.bahasaSehariHari,
  //       'berat_badan': siswa.beratBadan,
  //       'tinggi_badan': siswa.tinggiBadan,
  //       'golongan_darah': siswa.golonganDarah,
  //       'penyakit_pernah_diderita': siswa.penyakitPernahDiderita,
  //       'imunisasi_pernah_diterima': siswa.imunisasiPernahDiterima,
  //       'ciri_khusus': siswa.ciriKhusus,
  //       'tempat_tinggal': siswa.tempatTinggal,
  //       'asal_mula': siswa.asalMula,
  //       'pindahan_dari': siswa.pindahanDari ?? '',
  //       'nama_ayah': siswa.namaAyah,
  //       'tempat_lahir_ayah': siswa.tempatLahirAyah,
  //       'tanggal_lahir_ayah': siswa.tanggalLahirAyah,
  //       'agama_ayah': siswa.agamaAyah,
  //       'kewarganegaraan_ayah': siswa.kewarganegaraanAyah,
  //       'pendidikan_ayah': siswa.pendidikanAyah,
  //       'pekerjaan_ayah': siswa.pekerjaanAyah,
  //       'no_hp_ayah': siswa.noHpAyah,
  //       'nama_ibu': siswa.namaIbu,
  //       'tempat_lahir_ibu': siswa.tempatLahirIbu,
  //       'tanggal_lahir_ibu': siswa.tanggalLahirIbu,
  //       'agama_ibu': siswa.agamaIbu,
  //       'kewarganegaraan_ibu': siswa.kewarganegaraanIbu,
  //       'pendidikan_ibu': siswa.pendidikanIbu,
  //       'pekerjaan_ibu': siswa.pekerjaanIbu,
  //       'no_hp_ibu': siswa.noHpIbu,
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     print('Update Response: $data');
  //     return data['success'] == true;
  //   }
  //   return false;
  // }
  Future<bool> updatePendaftaran({
    required int id,
    required String namaLengkap,
    required String namaPanggilan,
    required String tempatLahir,
    required String tanggalLahir,
    required String alamat,
    required String kabupaten,
  }) async {
    final url = Uri.parse('$baseUrl/update_pendaftaran.php');

    final response = await http.post(url, body: {
      'id': id.toString(),
      'nama_lengkap': namaLengkap,
      'nama_panggilan': namaPanggilan,
      'tempat_lahir': tempatLahir,
      'tanggal_lahir': tanggalLahir,
      'alamat': alamat,
      'kabupaten': kabupaten,
    });

    final data = json.decode(response.body);
    return data['success'];
  }
}

// //Tambah FOTO
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import '../models/ppdb_siswa_model.dart';
// import '../utils/constants.dart';

// class PpdbService {
//   Future<bool> submitPendaftaran(PpdbSiswa siswa, File fotoSiswa) async {
//     final url = Uri.parse('$baseUrl/ppdb_siswa_form.php');

//     // Buat request multipart
//     var request = http.MultipartRequest('POST', url);

//     // Tambahkan data siswa ke form data
//     request.fields.addAll(siswa.toJson());

//     // Tambahkan file foto siswa
//     request.files.add(await http.MultipartFile.fromPath(
//       'foto_siswa',
//       fotoSiswa.path,
//       contentType:
//           MediaType('image', 'jpeg'), // Atau sesuaikan dengan jenis file foto
//     ));

//     // Kirim request dan dapatkan response
//     var response = await request.send();

//     if (response.statusCode == 200) {
//       final responseString = await response.stream.bytesToString();
//       print('Response body: $responseString');

//       final data = jsonDecode(responseString);
//       return data['success'] == true;
//     } else {
//       print('Failed to submit form. Status code: ${response.statusCode}');
//       return false;
//     }
//   }

//   Future<bool> cekSudahDaftar(int userId) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/cek_pendaftaran.php'),
//       body: {'user_id': userId.toString()},
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data['sudah_daftar'] == true;
//     }
//     return false;
//   }
// }

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/ppdb_siswa_model.dart';
// import '../utils/constants.dart';

// class PpdbService {
//   static Future<bool> submitForm(PpdbSiswaModel siswa) async {
//     final url = Uri.parse('$baseUrl/ppdb_siswa_form.php');

//     // Mengonversi objek siswa ke Map
//     Map<String, String> data = siswa.toJson().map((key, value) {
//       return MapEntry(key, value.toString());
//     });

//     try {
//       final response = await http.post(
//         url,
//         body: data,
//       );

//       if (response.statusCode == 200) {
//         final result = jsonDecode(response.body);
//         return result['success'] == true;
//       } else {
//         print('Server error: ${response.statusCode}');
//         return false;
//       }
//     } catch (e) {
//       print('Exception: $e');
//       return false;
//     }
//   }
// }

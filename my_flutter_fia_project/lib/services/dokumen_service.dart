import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// Definisikan baseUrl langsung di sini
const String baseUrl = 'http://localhost/login_tugas/backend';

class DokumenService {
  Future<bool> uploadDokumen({
    required int siswaId,
    required String jenisDokumen,
    required File file,
  }) async {
    final url = Uri.parse('$baseUrl/upload_dokumen.php');

    // Membuat request multipart untuk mengupload file
    var request = http.MultipartRequest('POST', url);

    // Kirimkan data form
    request.fields['siswa_id'] = siswaId.toString();
    request.fields['jenis_dokumen'] = jenisDokumen;
    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    // Kirim permintaan
    var response = await request.send();

    if (response.statusCode == 200) {
      final respStr = await response.stream.bytesToString();
      final data = json.decode(respStr);

      // Cek status response
      if (data['status'] == 'success') {
        // Status menggunakan string 'success'
        return true;
      }
    }

    return false;
  }
}

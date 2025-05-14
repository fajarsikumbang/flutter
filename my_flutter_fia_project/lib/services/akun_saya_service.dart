import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/akun_saya_model.dart';
import '../utils/constants.dart'; // ini bagian yang kamu minta

class AkunSayaService {
  Future<AkunSaya?> getUserInfo(int userId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/akun_saya.php?user_id=$userId'));

    if (response.statusCode == 200) {
      return AkunSaya.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  // Future<bool> updatePendaftaran(
  //     int id, String namaLengkap, String namaPanggilan) async {
  //   final url = Uri.parse('$baseUrl/update_pendaftaran.php');

  //   final response = await http.post(
  //     url,
  //     body: {
  //       'id': id.toString(),
  //       'namaLengkap': namaLengkap,
  //       'namaPanggilan': namaPanggilan,
  //     },
  //   );

  //   final data = json.decode(response.body);
  //   return data['success'] == true;
  // }
}

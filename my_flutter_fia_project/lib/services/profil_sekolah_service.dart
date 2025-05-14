import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/profil_sekolah_model.dart';
import '../utils/constants.dart';

class ProfilSekolahService {
  Future<ProfilSekolah> fetchProfilSekolah() async {
    final response = await http.get(Uri.parse('$baseUrl/profil_sekolah.php'));

    if (response.statusCode == 200) {
      return ProfilSekolah.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat data profil sekolah');
    }
  }
}

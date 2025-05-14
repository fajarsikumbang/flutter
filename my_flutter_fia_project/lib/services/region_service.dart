import 'dart:convert';
import 'package:http/http.dart' as http;

class RegionService {
  static Future<List<Map<String, dynamic>>> fetchProvinsi() async {
    final response = await http.get(
      Uri.parse('https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json'),
    );
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat provinsi');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchKabupaten(String provId) async {
    final response = await http.get(
      Uri.parse('https://www.emsifa.com/api-wilayah-indonesia/api/regencies/$provId.json'),
    );
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat kabupaten');
    }
  }
}

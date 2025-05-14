// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import '../utils/constants.dart';
// import '../models/user_model.dart';

// class AuthService {
//   static Future<Map<String, dynamic>> login(UserModel user) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/login.php'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(user.toJson()),
//     );

//     final responseData = jsonDecode(response.body);

//     if (responseData['status'] == 'success') {
//       // Save user data to SharedPreferences
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setInt('user_id', responseData['user']['id']);
//     }

//     return responseData;
//   }

//   static Future<Map<String, dynamic>> register(UserModel user) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/register.php'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(user.toJson()),
//     );

//     return jsonDecode(response.body);
//   }

//   static Future<Map<String, dynamic>> getUserData(int userId) async {
//     final response = await http.get(
//       Uri.parse('$baseUrl/get_user.php?id=$userId'),
//       headers: {'Content-Type': 'application/json'},
//     );

//     return jsonDecode(response.body);
//   }
//   //untuk ambil data
//   static Future<int?> getUserId() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt('user_id');
//   }

// }

//hari ini
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';
import '../models/user_model.dart';

class AuthService {
  // Fungsi login dengan menambahkan try-catch untuk menangani error saat login
  static Future<Map<String, dynamic>> login(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()), // Mengirim data user sebagai JSON
      );

      final responseData = jsonDecode(response.body);

      // Jika login berhasil, simpan user_id di SharedPreferences
      if (responseData['status'] == 'success') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('user_id', responseData['user']['id']);
        print('User ID saved: ${responseData['user']['id']}'); // Debugging
      }

      return responseData;
    } catch (error) {
      // Menangani error jika ada masalah saat melakukan request atau proses lainnya
      return {'status': 'error', 'message': 'Login failed: $error'};
    }
  }

  // Fungsi register dengan menambahkan error handling
  static Future<Map<String, dynamic>> register(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()), // Mengirim data user sebagai JSON
      );

      return jsonDecode(response.body);
    } catch (error) {
      return {'status': 'error', 'message': 'Registration failed: $error'};
    }
  }

  // Fungsi untuk mengambil data user berdasarkan user_id
  static Future<Map<String, dynamic>> getUserData(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/get_user.php?id=$userId'),
        headers: {'Content-Type': 'application/json'},
      );

      return jsonDecode(response.body);
    } catch (error) {
      return {'status': 'error', 'message': 'Failed to get user data: $error'};
    }
  }

  // Fungsi untuk mendapatkan user_id yang disimpan di SharedPreferences
  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final userId =
        prefs.getInt('user_id'); // Mengambil user_id dari SharedPreferences
    print('User ID retrieved: $userId'); // Debugging
    return userId; // Mengembalikan user_id yang tersimpan
  }

  // Fungsi untuk menyimpan user_id ke SharedPreferences
  static Future<void> saveUserId(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
        'user_id', userId); // Menyimpan user_id ke SharedPreferences
    print('User ID saved successfully!'); // Debugging
  }

  // Fungsi untuk menghapus data user dari SharedPreferences
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Menghapus semua data yang tersimpan
    print('User data cleared from SharedPreferences'); // Debugging
  }
}

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../services/auth_service.dart';
// import '../models/user_model.dart';
// import 'login_screen.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   UserModel? userData;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//   }

//   Future<void> fetchUserData() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final userId = prefs.getInt('user_id');
//       if (userId != null) {
//         final response = await AuthService.getUserData(userId);
//         if (response['status'] == 'success') {
//           setState(() {
//             userData = UserModel.fromJson(response['user']);
//             isLoading = false;
//           });
//         } else {
//           throw Exception(response['message'] ?? 'Failed to load user data');
//         }
//       } else {
//         logout();
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString())),
//       );
//     }
//   }

//   Future<void> logout() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.clear();

//       Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//         (route) => false,
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error logging out')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Home'),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: logout,
//           ),
//         ],
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : userData == null
//               ? Center(
//                   child: Text(
//                     'No user data available.',
//                     style: TextStyle(fontSize: 18, color: Colors.grey),
//                   ),
//                 )
//               : Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Welcome, ${userData!.username}!',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Id : ${userData!.id}',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 16),
//                       Text(
//                         'Email : ${userData!.email}',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Role : ${userData!.role}',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 32),
//                       Center(
//                         child: ElevatedButton(
//                           onPressed: logout,
//                           child: Text('Logout'),
//                           style: ElevatedButton.styleFrom(
//                             padding: EdgeInsets.symmetric(horizontal: 16),
//                             textStyle: TextStyle(fontSize: 18),
//                             backgroundColor: Colors.blueAccent,
//                             foregroundColor: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'profil_sekolah_screen.dart';
import 'ppdb_siswa_screen.dart';
// import 'get_user_screen.dart';
import 'akun_saya_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ProfilSekolahScreen(),
    PpdbSiswaScreen(),
    AkunSayaScreen(),
    // GetUserScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Profil Sekolah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Daftar Siswa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun Saya',
          ),
        ],
      ),
    );
  }
}

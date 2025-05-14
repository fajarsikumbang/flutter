class UserModel {
  final int? id;
  final String username;
  final String? email;
  final String password;
  final String? role;

  UserModel({
    this.id,
    required this.username,
    this.email,
    required this.password,
    this.role,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'password': password,
    'role': role,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      username: json['username'],
      email: json['email'],
      password: '', // We don't store password after login
      role: json['role'],
    );
  }
}
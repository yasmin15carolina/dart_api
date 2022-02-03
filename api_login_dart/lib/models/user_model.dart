import 'dart:convert';

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String password;
  final String userType;
  final String code;
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.userType,
    required this.code,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'userType': userType,
      'code': code,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      userType: map['userType'],
      code: map['code'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

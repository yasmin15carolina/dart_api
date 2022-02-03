import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:mysql1/mysql1.dart';

import '../database/database_connect.dart';
import '../models/user_model.dart';

class UserRepository {
  Future<List<UserModel>> findAll() async {
    MySqlConnection? conn;

    try {
      conn = await DatabaseConnect().openConnection();
      final result = await conn.query("SELECT * FROM AdminUser");
      return result
          .map<UserModel>((u) => UserModel(
                id: u['id'],
                name: u['name'],
                username: u['username'],
                email: u['email'],
                password: u['password'],
                userType: u['userType'],
                code: u['code'],
              ))
          .toList();
    } catch (e, s) {
      print(e);
      print(s);
      rethrow;
    } finally {
      conn?.close();
    }
  }

  Future<List<UserModel>> findOne(String username, String password) async {
    MySqlConnection? conn;

    try {
      conn = await DatabaseConnect().openConnection();
      var bytes = utf8.encode(password); //transforma a senha em hash

      var digest = md5.convert(bytes);
      print("object:$digest");
      password = digest.toString();

      // password = "912ec803b2ce49e4a541068d495ab570";

      final result = await conn.query(
          "SELECT * FROM AdminUser WHERE username='$username' AND password='$password'");
      print("result: $result"
          // "SELECT * FROM AdminUser WHERE username='$username' AND password='$password'",
          );
      return result
          .map<UserModel>((u) => UserModel(
                id: u['id'],
                name: u['name'],
                username: u['username'],
                email: u['email'],
                password: u['password'],
                userType: u['userType'],
                code: u['code'],
              ))
          .toList();
    } catch (e, s) {
      print(e);
      print(s);
      rethrow;
    } finally {
      conn?.close();
    }
  }
}

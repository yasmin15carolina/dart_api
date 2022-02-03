import 'package:mysql1/mysql1.dart';

class DatabaseConnect {
  Future<MySqlConnection> openConnection() {
    return MySqlConnection.connect(ConnectionSettings(
      host: 'ccompjr.com.br',
      user: 'ccompj_teste',
      password: 'teste',
      db: 'ccompj_teste',
      port: 3306,
      // host: 'localhost',
      // user: 'root',
      // password: 'root',
      // db: 'ccompj_teste',
    ));
  }
}

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:mysql1/mysql1.dart';
import 'package:anjoman/core/utils/extensions/hash.dart';
import 'package:anjoman/core/values/env.dart';

class Database {
  // ! If you don't want to use encryption methods, this variable is suitable for you.
  // static final _settings = ConnectionSettings(
  //   host: Env.dbHOST,
  //   port: Env.dbPORT,
  //   user: Env.dbUSERNAME,
  //   password: Env.dbPASSWORD,
  //   db: Env.dbDATABASE,
  // );
  // ! If you want to use encryption methods, this variable is suitable for you.
  // ! What is necessary for this is to first encrypt the words in the .env file with your own key and put the base64 value that the encrypt text gives in them.
  static final _settings = ConnectionSettings(
    host: HashAES.decrypt(Env.dbHOST),
    port: Env.dbPORT,
    user: HashAES.decrypt(Env.dbUSERNAME),
    password: Env.dbPASSWORD,
    db: HashAES.decrypt(Env.dbDATABASE),
  );

  static Future<MySqlConnection> connect() async {
    return await MySqlConnection.connect(_settings);
  }
}

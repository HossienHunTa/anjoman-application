import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'dbHOST', obfuscate: true)
  static String dbHOST = _Env.dbHOST;
  @EnviedField(varName: 'dbPORT', obfuscate: true)
  static int dbPORT = _Env.dbPORT;
  @EnviedField(varName: 'dbDATABASE', obfuscate: true)
  static String dbDATABASE = _Env.dbDATABASE;
  @EnviedField(varName: 'dbUSERNAME', obfuscate: true)
  static String dbUSERNAME = _Env.dbUSERNAME;
  @EnviedField(varName: 'dbPASSWORD', obfuscate: true)
  static String dbPASSWORD = _Env.dbPASSWORD;
  @EnviedField(varName: 'Key', obfuscate: true)
  static String key = _Env.key;
}

import 'dart:convert';
import 'package:anjoman/core/values/env.dart';
import 'package:encrypt/encrypt.dart';

class HashAES {
  //AES Algorithms
  static Encrypted? encrypted;
  static String? decrypted;

  static encrypt(String data) {
    String? value = Env.key;
    final key = Key.fromBase64(value);
    final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
    final fernet = AES(b64key);
    final encrypter = Encrypter(fernet);
    encrypted = encrypter.encrypt(data, iv: IV.fromLength(16));
    return (encrypted!.base64);
  }

  static decrypt(String data) {
    String? value = Env.key;
    final key = Key.fromBase64(value);
    final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
    final fernet = AES(b64key);
    final encrypter = Encrypter(fernet);
    decrypted = encrypter.decrypt64(data, iv: IV.fromLength(16));
    return (decrypted);
  }
}

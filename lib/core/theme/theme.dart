import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'colors.dart';

class MyTheme {
  MyTheme._();
  static final GetStorage _box = GetStorage('Application');
  static RxBool isDarkTheme = false.obs;
  static ThemeData lightTheme = ThemeData(
      fontFamily: 'Mitra',
      primaryColor: MyColors.miloOrange,
      scaffoldBackgroundColor: MyColors.willowSky,
      brightness: Brightness.light,
      buttonTheme: const ButtonThemeData(
        buttonColor: MyColors.sweetOrange,
        disabledColor: MyColors.karBlue,
      ));
  static ThemeData darkTheme = ThemeData(
      fontFamily: 'Mitra',
      primaryColor: MyColors.miloOrange,
      scaffoldBackgroundColor: MyColors.stormyBrew,
      brightness: Brightness.dark,
      buttonTheme: const ButtonThemeData(
        buttonColor: MyColors.darkLightBlue,
        disabledColor: MyColors.karBlue,
      ));

  static changeTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeThemeMode(
      isDarkTheme.value ? ThemeMode.light : ThemeMode.dark,
    );
  }

  static void getThemeStatus() async {
    if (_box.hasData('theme')) {
      isDarkTheme.value = _box.read('theme');
      Get.changeThemeMode(isDarkTheme.value ? ThemeMode.light : ThemeMode.dark);
    } else {
      _box.write('theme', isDarkTheme.value);
      isDarkTheme.value = _box.read('theme');
      Get.changeThemeMode(isDarkTheme.value ? ThemeMode.light : ThemeMode.dark);
    }
  }
}

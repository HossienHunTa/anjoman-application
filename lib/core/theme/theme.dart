import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'colors.dart';

class MyTheme {
  MyTheme._();
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  static RxBool isDarkTheme = true.obs;
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

  static void changeTheme() async {
    SharedPreferences prefs = await _prefs;
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeThemeMode(
      isDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
    );
    prefs.setBool('isDarkTheme', isDarkTheme.value);
  }

  static void getThemeStatus() async {
    SharedPreferences prefs = await _prefs;
    if (!prefs.containsKey('isDarkTheme')) {
      prefs.setBool('isDarkTheme', isDarkTheme.value);
    }
    isDarkTheme.value = prefs.getBool('isDarkTheme') as bool;
    Get.changeThemeMode(
      isDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'colors.dart';

class MyTheme {
  MyTheme._();
  static final GetStorage _box = GetStorage('Application');
  static RxBool isDarkTheme = (_box.read('isDarkTheme')).obs;
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

  static changeTheme() async {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeThemeMode(
      isDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
    );
    await _box.write('isDarkTheme', isDarkTheme.value);
    await _box.save();
  }

  static void getThemeStatus() async {
    if (!_box.hasData('isDarkTheme')) {
      await _box.write('isDarkTheme', true);
      await _box.save();
    }
    isDarkTheme.value = await _box.read('isDarkTheme');
    Get.changeThemeMode(
      isDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
    );
  }
}

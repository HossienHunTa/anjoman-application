import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'from/en-US.dart';
part 'from/fa-IR.dart';

class Languages extends Translations {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  static RxBool isPersian = true.obs;

  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
  static const supportedLocales = [
    Locale('fa', 'IR'),
    Locale('en', 'US'),
  ];

  static void changeLanguage() async {
    SharedPreferences prefs = await _prefs;
    isPersian.value = !isPersian.value;
    Get.updateLocale(
      isPersian.value ? const Locale('fa', 'IR') : const Locale('en', 'US'),
    );
    prefs.setBool('isPersian', isPersian.value);
  }

  static void getLanguageStatus() async {
    SharedPreferences prefs = await _prefs;
    if (!prefs.containsKey('isPersian')) {
      prefs.setBool('isPersian', isPersian.value);
    }
    isPersian.value = prefs.getBool('isPersian') as bool;
    Get.updateLocale(
      isPersian.value ? const Locale('fa', 'IR') : const Locale('en', 'US'),
    );
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'fa_IR': faIR,
        'en_US': enUS,
      };
}

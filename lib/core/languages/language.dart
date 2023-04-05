import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

part 'from/en-US.dart';
part 'from/fa-IR.dart';

class Languages extends Translations {
  static final GetStorage _box = GetStorage('Application');
  static RxBool isPersian = false.obs;

  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('fa', 'IR'),
  ];

  static changeLanguage() {
    isPersian.value = !isPersian.value;
    Get.updateLocale(
      isPersian.value ? const Locale('fa', 'IR') : const Locale('en', 'US'),
    );
  }

  static void getLanguageStatus() async {
    if (_box.hasData('theme')) {
      isPersian.value = _box.read('lang');
      Get.updateLocale(
        isPersian.value ? const Locale('fa', 'IR') : const Locale('en', 'US'),
      );
    } else {
      _box.write('theme', isPersian.value);
      isPersian.value = _box.read('theme');
      Get.updateLocale(
        isPersian.value ? const Locale('fa', 'IR') : const Locale('en', 'US'),
      );
    }
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'fa_IR': faIR,
      };
}
// Get.updateLocale(locale);

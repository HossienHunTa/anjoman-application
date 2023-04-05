import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

part 'from/en-US.dart';
part 'from/fa-IR.dart';

class Languages extends Translations {
  static final GetStorage _box = GetStorage('Application');
  static RxBool isPersian = (_box.read('isPersian')).obs;

  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('fa', 'IR'),
  ];

  static changeLanguage() async {
    isPersian.value = !isPersian.value;
    Get.updateLocale(
      isPersian.value ? const Locale('fa', 'IR') : const Locale('en', 'US'),
    );
    await _box.write('isPersian', isPersian.value);
    await _box.save();
  }

  static void getLanguageStatus() async {
    if (!_box.hasData('isPersian')) {
      await _box.write('isPersian', true);
      await _box.save();
    }
    isPersian.value = await _box.read('isPersian');
    Get.updateLocale(
      isPersian.value ? const Locale('fa', 'IR') : const Locale('en', 'US'),
    );
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'fa_IR': faIR,
      };
}

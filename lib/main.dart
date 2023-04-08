// Package>flutter lib
import 'package:flutter/material.dart';

// Package>pub lib
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
// Package>Anjoman>Core
import 'package:anjoman/core/theme/theme.dart';
import 'package:anjoman/core/languages/language.dart';
// Package>Anjoman>routes>Pages
import 'app/routes/app_pages.dart';

// Package>Anjoman>app>data>service
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  runApp(
    MyApp(),
  );
}

Future<void> initializeApp() async {
  //Access Service and Storage Data
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    MyTheme.getThemeStatus();
    Languages.getLanguageStatus();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'application_title'.tr,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.fade,
      localizationsDelegates: Languages.localizationsDelegates,
      supportedLocales: Languages.supportedLocales,
      translations: Languages(),
      locale: Languages.isPersian.value
          ? const Locale('fa', 'IR')
          : const Locale('en', 'US'),
      fallbackLocale: Languages.isPersian.value
          ? const Locale('en', 'US')
          : const Locale('fa', 'IR'),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      unknownRoute: AppPages.UNKNOWN,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: '4K'),
        ],
      ),
    );
  }
}

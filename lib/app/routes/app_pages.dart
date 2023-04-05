// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/unknown/bindings/unknown_binding.dart';
import '../modules/unknown/views/unknown_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static GetPage UNKNOWN = GetPage(
    name: _Paths.UNKNOWN,
    page: () => const UnknownView(),
    binding: UnknownBinding(),
  );

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

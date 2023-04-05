import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anjoman/core/utils/extensions/hash.dart';
import 'package:anjoman/core/theme/theme.dart';
import 'package:anjoman/core/languages/language.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final hh = HashAES.encrypt('application_title'.tr);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${hh}"),
            Text("${HashAES.decrypt(hh)}"),
            ElevatedButton(
              onPressed: () => Languages.changeLanguage(),
              child: Text('lang_button'.tr),
            ),
            ElevatedButton(
              onPressed: () => MyTheme.changeTheme(),
              child: Text('theme_button'.tr),
            ),
          ],
        ),
      ),
    );
  }
}

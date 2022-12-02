import 'package:flutter/material.dart';
import 'package:geek_garden_test/data/networking/base_service.dart';
import 'package:geek_garden_test/data/values/strings.dart';
import 'package:geek_garden_test/routes/pages.dart';
import 'package:geek_garden_test/routes/routes.dart';
import 'package:get/get.dart';

void _initCoreService() {
  Get.put(BaseService(), permanent: true);
}

void main() {
  _initCoreService();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      initialRoute: Routes.dashboard,
      getPages: AppPages.pages,
    );
  }
}
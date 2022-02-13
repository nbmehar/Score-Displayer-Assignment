import 'package:bluestacks_assignment/app/modules/login_module/login_binding.dart';
import 'package:bluestacks_assignment/app/theme/app_theme.dart';
import 'package:bluestacks_assignment/app/translations/app_translations.dart';
import 'package:bluestacks_assignment/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/home_module/home_binding.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: controller.isAlreadyLoggedIn()?Routes.HOME:Routes.LOGIN,
            initialBinding: controller.isAlreadyLoggedIn()?HomeBinding():LoginBinding(),
            theme: appThemeData(),
            defaultTransition: Transition.fade,
            getPages: AppPages.pages,
            locale: Get.deviceLocale,
            fallbackLocale: Locale('en', 'US'),
            translationsKeys: AppTranslation.translations,
          );
        });
  }
}

import 'package:bluestacks_assignment/app/modules/home_module/home.dart';
import 'package:bluestacks_assignment/app/modules/home_module/home_binding.dart';
import 'package:bluestacks_assignment/app/modules/login_module/login.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.LOGIN , page:()=> LoginPage()),
    GetPage(name: Routes.HOME, page:()=> HomePage()),
    GetPage(name: Routes.HOMEWBINDING, page:()=> HomePage(),binding: HomeBinding())
  ];
} 
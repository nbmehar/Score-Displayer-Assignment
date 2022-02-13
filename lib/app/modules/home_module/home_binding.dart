import 'package:bluestacks_assignment/app/data/providers/api.dart';
import 'package:bluestacks_assignment/app/data/repositories/home_repository.dart';
import 'package:bluestacks_assignment/app/modules/home_module/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
@override
void dependencies() {
  Get.put(HomeController(HomeRepository(ApiClient())));
  }
}
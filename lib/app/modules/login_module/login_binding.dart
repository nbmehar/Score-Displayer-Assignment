import 'package:bluestacks_assignment/app/data/providers/api.dart';
import 'package:bluestacks_assignment/app/data/repositories/users_repository.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBinding implements Bindings {
@override
void dependencies() {
      Get.put(LoginController(
     UsersRepository(ApiClient())));
  }
}
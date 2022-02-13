import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  
  GetStorage localStorage = GetStorage();

  bool isAlreadyLoggedIn() {
    if (localStorage.read("username") == null) {
      return false;
    } else {
      return true;
    }
  }
}

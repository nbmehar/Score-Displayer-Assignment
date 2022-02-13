import 'package:bluestacks_assignment/app/data/repositories/users_repository.dart';
import 'package:bluestacks_assignment/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  LoginController(this.repository);

  final UsersRepository repository;
  bool isFormValidated;

  TextEditingController usernameEditingController;
  TextEditingController passwordEditingController;

  final formKey = GlobalKey<FormState>();
  String username, password;
  bool firstSubmit = false;
  bool remember = false;

  final localStorage = GetStorage();

  @override
  void onInit() {
    usernameEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    isFormValidated = false;
    super.onInit();
  }

  @override
  void onClose() {
    usernameEditingController.dispose();
    passwordEditingController.dispose();
    super.onClose();
  }


  void authenticate() {
    print(usernameEditingController.text +
        "   " +
        passwordEditingController.text);
    if (repository.authenticate(
        usernameEditingController.text, passwordEditingController.text)) {
      print("Login Success");
      localStorage.write("username", usernameEditingController.text);
      Get.snackbar("Logged In", "You Have Successfully Logged In ",
          colorText: Colors.white, backgroundColor: Colors.green);
      Get.offNamed(Routes.HOMEWBINDING);
    } else {
      print("Login Failed");
      Get.snackbar(
          "Login Failed", "You have entered wrong Username or Password ",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  validForm() {
    if (passwordEditingController.text == null ||
        usernameEditingController.text == null ||
        usernameEditingController.text.isEmpty ||
        usernameEditingController.text.length < 3 ||
        usernameEditingController.text.length > 11 ||
        passwordEditingController.text.isEmpty ||
        passwordEditingController.text.length < 3 ||
        passwordEditingController.text.length > 11) {
      isFormValidated = false;
      update();
    } else {
      isFormValidated = true;
      update();
    }
  }
}

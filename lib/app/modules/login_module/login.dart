import 'package:bluestacks_assignment/app/modules/login_module/widgets/logo_widget.dart';
import 'package:bluestacks_assignment/app/modules/login_module/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';
import 'package:bluestacks_assignment/app/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(14.w),
            child: Column(
              children: [
                SizedBox(height: 0.04.sh),
                Text(
                  "Welcome Back",
                  style: headingStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Sign in with your email and password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 0.04.sh),
                LogoWidget(),
                SizedBox(height: 0.04.sh),
                SignForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

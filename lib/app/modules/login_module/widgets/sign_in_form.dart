import 'package:bluestacks_assignment/app/modules/login_module/login_controller.dart';
import 'package:bluestacks_assignment/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'custom_suffix_icon.dart';
import 'default_button.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (gxValues) {
      return Form(
        key: gxValues.formKey,
        child: Column(
          children: [
            buildUsernameFormField(gxValues),
            SizedBox(height: 30.h),
            buildPasswordFormField(gxValues),
            SizedBox(
              height: 0.2.sh,
            ),
            DefaultButton(
              text: "Submit",
              press: () {
                if (gxValues.formKey.currentState.validate()) {
                  gxValues.formKey.currentState.save();
                  gxValues.authenticate();
                }
                gxValues.firstSubmit = true;
              },
            ),
          ],
        ),
      );
    });
  }

  TextFormField buildPasswordFormField(LoginController gxValues) {
    return TextFormField(
      controller: gxValues.passwordEditingController,
      onSaved: (newPassword) => gxValues.password = newPassword,
      onChanged: (password) {
        gxValues.validForm();
        gxValues.formKey.currentState.validate();
      },
      validator: (password) {
        if (password.isEmpty) {
          return kPassNullError;
        } else if (password.isNotEmpty && password.length < 3) {
          return kShortPassError;
        } else if (password.isNotEmpty && password.length > 11) {
          return kLongPassError;
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        suffixIcon: CustomSuffixIcon(iconPath: "assets/icons/Lock.svg"),
      ),
      obscureText: true,
    );
  }

  buildUsernameFormField(LoginController gxValues) {
    return TextFormField(
      controller: gxValues.usernameEditingController,
      onSaved: (newUsername) => gxValues.username = newUsername,
      onChanged: (username) {
        gxValues.validForm();
        gxValues.formKey.currentState.validate();
      },
      validator: (username) {
        if (username.isEmpty) {
          return kUserNameNullError;
        } else if (username.isNotEmpty && username.length < 3) {
          return kShortUserNameError;
        } else if (username.isNotEmpty && username.length > 11) {
          return kLongUserNameError;
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Enter your Username",
        suffixIcon: CustomSuffixIcon(iconPath: "assets/icons/Mail.svg"),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

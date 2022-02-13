import 'package:bluestacks_assignment/app/modules/login_module/login_controller.dart';
import 'package:bluestacks_assignment/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (gxValues) {
      print("Inside Button " + gxValues.isFormValidated.toString());

      return ElevatedButton(
        onPressed: () {
          return press();
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: gxValues.isFormValidated
              ? MaterialStateProperty.all(kPrimaryColor)
              : MaterialStateProperty.all(Colors.grey),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            Size(
              double.infinity,
              56.w,
            ),
          ),
        ),
      );
    });
  }
}

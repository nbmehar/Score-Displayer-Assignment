import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kPrimaryColor = Color(0xff2e7ff6);
const kPrimaryLightColor = Color(0xFFDFECFF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF3EA5FF), Color(0xFF4376FF)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: 28.sp,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

//Images Strings
const String kLogoImagePath = "assets/images/gametvlogo.jpg";

// Form Error

const String kUserNameNullError = "Please Enter your Username";
const String kShortUserNameError =
    "Username is too short, at least 3 characters Required";
const String kLongUserNameError =
    "Username is very long, less than 11 chars Required";

const String kPassNullError = "Please Enter your password";
const String kShortPassError =
    "Password is too short, at least 3 characters Required";
const String kLongPassError ="Password is very long, less than 11 chars required";
const String kMatchPassError = "Passwords don't match";
const String kFirstNamelNullError = "Please Enter your first name";
const String kLastNamelNullError = "Please Enter your last name";

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15.h),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.h),
    borderSide: BorderSide(color: kTextColor),
  );
}

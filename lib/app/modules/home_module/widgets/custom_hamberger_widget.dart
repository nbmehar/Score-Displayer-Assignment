import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHamburgerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 2.5,
          width: 15.w,
          color: Colors.black,
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          height: 2.5,
          width: 20.w,
          color: Colors.black,
        ),
      ],
    );
  }
}

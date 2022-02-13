import 'package:bluestacks_assignment/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.30.sh,
      height: 0.1.sh,
      child: Image.asset(
        kLogoImagePath,
      ),
    );
  }
}
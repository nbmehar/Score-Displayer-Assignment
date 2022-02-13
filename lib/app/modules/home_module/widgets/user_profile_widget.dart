import 'package:bluestacks_assignment/app/modules/global_widgets/error_widget.dart';
import 'package:bluestacks_assignment/app/modules/global_widgets/loading_widget.dart';
import 'package:bluestacks_assignment/app/modules/home_module/home_controller.dart';
import 'package:bluestacks_assignment/app/modules/home_module/widgets/user_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (gxValues) {
      return gxValues.userApiState.when(loading: () {
        return LoadingWidget();
      }, error: (e) {
        return CustomErrorWidget(e);
      }, noError: () {
        return Row(
          children: [
            UserImageWidget(gxValues),
            SizedBox(
              width: 15,
            ),
            Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    gxValues.userModel.name,
                    style: TextStyle(
                        color: Color(0xff2D2D32),
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    width: 155.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4A6EF6)),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      child: Row(
                        children: [
                          Text(
                            gxValues.userModel.eloRating,
                            style: TextStyle(
                                color: Color(0xff4A6EF6),
                                fontFamily: 'Roboto',
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Elo rating",
                            style: TextStyle(
                              color: Color(0xff2D2D32),
                              fontFamily: 'Roboto',
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      });
    });
  }
}



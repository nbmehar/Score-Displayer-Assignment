import 'package:bluestacks_assignment/app/modules/home_module/widgets/home_app_bar_widget.dart';
import 'package:bluestacks_assignment/app/modules/home_module/widgets/paged_tournament_list.dart';
import 'package:bluestacks_assignment/app/modules/home_module/widgets/tournamentStats_widget.dart';
import 'package:bluestacks_assignment/app/modules/home_module/widgets/user_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBarWidget(),
            Expanded(
              child: NestedScrollView(
                  headerSliverBuilder: (ctx, header) {
                    return [
                      SliverToBoxAdapter(
                          child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // HomeAppBarWidget(),
                            SizedBox(height: 0.05.sh),
                            UserProfileWidget(),
                            SizedBox(height: 0.02.sh),
                            TournamentStatsWidget(),
                            SizedBox(height: 0.02.sh),
                            Text(
                              "Recommended for you",
                              style: TextStyle(
                                  color: Color(0xff2D2D32),
                                  fontFamily: 'Roboto',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ))
                    ];
                  },
                  body: PagedTournamentListView()),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bluestacks_assignment/app/data/models/recommended_tournament_response_model.dart';
import 'package:bluestacks_assignment/app/modules/home_module/home_controller.dart';
import 'package:bluestacks_assignment/app/modules/home_module/widgets/empty_list_indicator.dart';
import 'package:bluestacks_assignment/app/modules/home_module/widgets/error_indicator.dart';
import 'package:bluestacks_assignment/app/modules/home_module/widgets/recommended_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PagedTournamentListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (gxValues) {
      return RefreshIndicator(
        onRefresh: () => Future.sync(
          () => gxValues.pagingController.refresh(),
        ),
        child: PagedListView.separated(
          pagingController: gxValues.pagingController,
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          builderDelegate: PagedChildBuilderDelegate<Tournament>(
            itemBuilder: (context, tournament, index) {
              return RecommendedItem(tournament);
            },
            firstPageErrorIndicatorBuilder: (context) {
              return ErrorIndicator(
                error: gxValues.pagingController.error,
                onTryAgain: () => gxValues.pagingController.refresh(),
              );
            },
            newPageErrorIndicatorBuilder: (context) {
              return SizedBox(
                height: 50,
                width: double.infinity,
                child: RaisedButton.icon(
                  onPressed: () =>
                      gxValues.pagingController.retryLastFailedRequest(),
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Try Again',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
            noItemsFoundIndicatorBuilder: (context) {
              return EmptyListIndicator();
            },
          ),
        ),
      );
    });
  }
}

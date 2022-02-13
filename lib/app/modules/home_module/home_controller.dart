import 'dart:convert';

import 'package:bluestacks_assignment/app/data/models/recommended_tournament_response_model.dart';
import 'package:bluestacks_assignment/app/data/models/user_model.dart';
import 'package:bluestacks_assignment/app/data/repositories/home_repository.dart';
import 'package:bluestacks_assignment/app/utils/state/current_state.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  HomeController(this.repository);

  final HomeRepository repository;
  UserModel userModel;

  CurrentState userApiState = CurrentState.loading();

  Logger lg = Logger();

  final pagingController = PagingController<String, Tournament>(
    firstPageKey: "",
  );

  @override
  void onInit() {
    print("Inside Home INIT");
    fetchUser();

    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    print("Called fetch Page INIT");

    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  Future<void> fetchUser() async {
    try {
      var response = await repository.getUserDetails();
      print(response.body);
      var result = jsonDecode(response.body);
      userModel = UserModel.fromJson(result[0]);
      userApiState = CurrentState.noError();
      update();
    } catch (e) {
      print("There was a Error " + e.toString());
      userApiState =
          CurrentState.error("There Was a error loading User Stats Data");
      update();
    }
  }

  Future<void> fetchPage(String pageKey) async {
    print("Inside Fetch Page >>>>>>>>>>> " + pageKey);

    try {
      final response = await repository.getTournamentListPage(
        pageKey,
        10,
      );

      final result = jsonDecode(response.body);

      TournamentListPageModel newPage =
          TournamentListPageModel.fromJson(result);

      final newItems = newPage.data.tournaments;
      lg.d(newPage.data.tournaments);

      if (newPage.data.isLastBatch) {
        print("Load Last Batch");
        pagingController.appendLastPage(newItems);
      } else {
        print("Load Next Bath");
        final nextPageKey = newPage.data.cursor;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      print(error.toString());
      pagingController.error = error;
    }
  }
}

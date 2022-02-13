import 'package:bluestacks_assignment/app/data/providers/api.dart';
import 'package:http/http.dart';

class HomeRepository {
  final ApiClient api;

  HomeRepository(this.api);

  Future<Response> getUserDetails() {
    return api.getUserDetails();
  }

  Future<Response> getTournamentListPage(String cursor, int size) {
    return api.getTournamentListPage(cursor ,size);
  }
}

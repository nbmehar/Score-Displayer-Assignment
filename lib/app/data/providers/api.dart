import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://612693153ab4100017a69009.mockapi.io';

const tournamentUrl =
    'http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?';

class ApiClient extends GetConnect {
  
  bool authenticate(String username, String password) {
    if (username == "9898989898" && password == "password123" ||
        username == "9876543210" && password == "password123") {
      return true;
    } else {
      return false;
    }
  }

  Future<http.Response> getUserDetails() {
    return http.get(baseUrl + "/getUsers");
  }

  Future<http.Response> getTournamentListPage(String cursor, int size) {
    var url = tournamentUrl +
        "limit=" +
        size.toString() +
        "&status=all&cursor=" +
        cursor;

    print(url);
    return http.get(url);
    
  }
}

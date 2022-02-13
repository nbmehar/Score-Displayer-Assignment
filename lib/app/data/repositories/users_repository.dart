import 'package:bluestacks_assignment/app/data/providers/api.dart';

class UsersRepository {

  final ApiClient api;

  UsersRepository(this.api);

  authenticate(String username, String password) {
    return api.authenticate(username ,password);
  }
  
}

import 'package:vita_client_app/data/model/entity/user.dart';

abstract class UserDao {
  Future<void> insert(User user);

  User read();

  String getToken();

  bool isLoggedIn();

  Future<void> clear();
}

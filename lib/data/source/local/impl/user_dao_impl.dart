import 'package:hive/hive.dart';
import 'package:vita_client_app/data/model/entity/user.dart';
import 'package:vita_client_app/data/source/local/user_dao.dart';

class UserDaoImpl implements UserDao {
  final Box<Map> _box;

  UserDaoImpl(this._box);

  @override
  String getToken() {
    if (isLoggedIn()) {
      return read().token;
    } else {
      return "";
    }
  }

  @override
  Future<void> insert(User user) async {
    await _box.put(1, user.toJson());
  }

  @override
  User read() {
    final data = _box.get(1)?.map((key, value) {
      return MapEntry(key.toString(), value);
    });
    if (data == null) throw Exception("User not found");
    final user = User.fromJson(data);
    return user;
  }

  @override
  bool isLoggedIn() {
    return _box.isNotEmpty;
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }
}

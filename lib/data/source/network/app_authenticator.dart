import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:hive/hive.dart';
import 'package:vita_client_app/data/source/local/impl/user_dao_impl.dart';

class AppAuthenticator extends Authenticator {
  @override
  FutureOr<Request?> authenticate(Request request, Response<dynamic> response,
      [Request? originalRequest]) {
    final userBox = Hive.box<Map>('user');
    final userDao = UserDaoImpl(userBox);
    if (userDao.isLoggedIn()) {
      final headers = request.headers;
      final token = userDao.getToken();
      headers['Authorization'] = 'Bearer $token';
      return request.copyWith(headers: headers);
    } else {
      return request;
    }
  }
}

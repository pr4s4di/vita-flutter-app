import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:hive/hive.dart';
import 'package:vita_client_app/data/source/local/impl/user_dao_impl.dart';

class AppInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) {
    final userBox = Hive.box<Map>('user');
    final userDao = UserDaoImpl(userBox);
    if (userDao.isLoggedIn()) {
      final token = userDao.getToken();
      final request =
          applyHeader(chain.request, 'Authorization', 'Bearer $token');
      return chain.proceed(request);
    } else {
      return chain.proceed(chain.request);
    }
  }
}

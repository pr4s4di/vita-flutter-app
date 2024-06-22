import 'package:chopper/chopper.dart';
import 'package:vita_client_app/core/di.dart';
import 'package:vita_client_app/data/source/local/user_dao.dart';
import 'package:vita_client_app/data/source/network/image_service.dart';
import 'package:vita_client_app/data/source/network/message_service.dart';
import 'package:vita_client_app/data/source/network/user_service.dart';
import 'package:vita_client_app/util/constant/endpoint.dart';
import 'package:vita_client_app/util/converter/response_converter.dart';

String interceptorToken = '';

ChopperClient get chopperClient => ChopperClient(
      baseUrl: Uri.parse(baseUrl),
      converter: ResponseConverter(),
      errorConverter: ResponseConverter(),
      interceptors: [HeadersInterceptor(authToken)],
      services: [
        MessageService.create(),
        ImageService.create(),
        UserService.create()
      ],
    );

Map<String, String> get authToken {
  try {
    if (interceptorToken.isNotEmpty) {
      final token = interceptorToken;
      return {'Authorization': 'Bearer $token'};
    } else if (di<UserDao>().isLoggedIn()) {
      final token = di<UserDao>().getToken();
      return {'Authorization': 'Bearer $token'};
    }
  } catch (_) {}

  return {};
}

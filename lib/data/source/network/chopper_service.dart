import 'package:chopper/chopper.dart';
import 'package:vita_client_app/data/source/network/app_interceptor.dart';
import 'package:vita_client_app/data/source/network/image_service.dart';
import 'package:vita_client_app/data/source/network/message_service.dart';
import 'package:vita_client_app/data/source/network/user_service.dart';
import 'package:vita_client_app/util/converter/response_converter.dart';

String baseUrl = 'https://ad3b-182-253-55-248.ngrok-free.app';

ChopperClient get chopperClient {
  return ChopperClient(
    baseUrl: Uri.parse(baseUrl),
    converter: ResponseConverter(),
    errorConverter: ResponseConverter(),
    interceptors: [AppInterceptor()],
    services: [
      MessageService.create(),
      ImageService.create(),
      UserService.create()
    ],
  );
}

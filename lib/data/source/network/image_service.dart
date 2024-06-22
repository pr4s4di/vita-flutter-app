import "dart:async";

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:vita_client_app/data/model/entity/message.dart';

part 'image_service.chopper.dart';

@ChopperApi(baseUrl: "/image")
abstract class ImageService extends ChopperService {
  static ImageService create([ChopperClient? client]) => _$ImageService(client);

  @Post()
  @multipart
  Future<Response<List<Message>>> scanImage(
    @PartFile('image') String image,
    @Part('message') String message,
  );

  @Post()
  @multipart
  Future<Response<List<Message>>> scanImageWeb(
    @PartFile('image') http.MultipartFile image,
    @Part('message') String message,
  );
}

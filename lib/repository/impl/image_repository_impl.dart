import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:image_picker/image_picker.dart';
import 'package:vita_client_app/data/model/entity/image_possibility.dart';
import 'package:vita_client_app/data/model/entity/message.dart';
import 'package:vita_client_app/data/source/local/image_dao.dart';
import 'package:vita_client_app/data/source/network/image_service.dart';
import 'package:vita_client_app/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDao dao;
  final ImageService service;

  ImageRepositoryImpl(this.dao, this.service);

  @override
  Future<XFile?> pickImage(ImageSource source) {
    return dao.pickImage(source);
  }

  @override
  Future<Response<List<Message>>> scanImage(XFile image, String message) async {
    if (kIsWeb) {
      final contentType = "image/${image.name.split('.').last}";
      final mediaType = http_parser.MediaType.parse(contentType);

      return await service.scanImageWeb(
        http.MultipartFile.fromBytes(
          'image',
          await image.readAsBytes(),
          filename: image.name,
          contentType: mediaType,
        ),
        message,
      );
    } else {
      return await service.scanImage(image.path, message);
    }
  }

  @override
  clear() async {
    dao.delete();
  }

  @override
  inserts(List<ImagePossibility> possibilities) {
    dao.inserts(possibilities);
  }

  @override
  Future<List<ImagePossibility>> read() {
    return dao.get();
  }
}

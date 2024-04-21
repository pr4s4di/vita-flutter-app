import 'package:chopper/chopper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vita_client_app/data/model/entity/image_possibility.dart';
import 'package:vita_client_app/data/model/entity/message.dart';

abstract class ImageRepository {
  Future<XFile?> pickImage(ImageSource source);

  Future<Response<List<Message>>> scanImage(XFile image, String message);

  inserts(List<ImagePossibility> possibilities);

  Future<List<ImagePossibility>> read();

  clear();
}

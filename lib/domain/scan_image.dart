import 'package:image_picker/image_picker.dart';
import 'package:vita_client_app/data/model/entity/message.dart';

abstract class ScanImage {
  Future<List<Message>> call(XFile image, String message);
}

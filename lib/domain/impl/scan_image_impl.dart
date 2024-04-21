import 'package:image_picker/image_picker.dart';
import 'package:vita_client_app/data/model/entity/message.dart';
import 'package:vita_client_app/domain/scan_image.dart';
import 'package:vita_client_app/repository/image_repository.dart';
import 'package:vita_client_app/repository/message_repository.dart';

class ScanImageImpl implements ScanImage {
  final ImageRepository _imageRepository;
  final MessageRepository _messageRepository;

  ScanImageImpl(this._imageRepository, this._messageRepository);

  @override
  Future<List<Message>> call(XFile image, String message) async {
    var response = await _imageRepository.scanImage(image, message);
    var result = response.body!;
    _messageRepository.inserts(result);
    return result;
  }
}

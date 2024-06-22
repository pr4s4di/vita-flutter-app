import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vita_client_app/data/model/entity/image_possibility.dart';
import 'package:vita_client_app/data/source/local/image_dao.dart';

class ImageDaoImpl implements ImageDao {
  final ImagePicker _imgPicker;
  final Box<Map> _box;

  ImageDaoImpl(this._imgPicker, this._box);

  @override
  Future<XFile?> pickImage(ImageSource source) async {
    XFile? pickedFile = await _imgPicker.pickImage(source: source);
    return pickedFile;
  }

  @override
  delete() {
    _box.clear();
  }

  @override
  Future<List<ImagePossibility>> get() async {
    return _box.values
        .map((e) => ImagePossibility.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  inserts(List<ImagePossibility> possibilities) {
    Map<int, Map<String, dynamic>> data = {};

    for (final possibility in possibilities) {
      data[0] = possibility.toJson();
    }

    _box.putAll(data);
  }
}

import 'package:hive/hive.dart';
import 'package:vita_client_app/data/model/entity/message.dart';
import 'package:vita_client_app/data/source/local/message_dao.dart';

class MessageDaoImpl implements MessageDao {
  final Box<Map> _boxMessage;

  MessageDaoImpl(this._boxMessage);

  @override
  inserts(List<Message> messages) async {
    Map<int, Map<String, dynamic>> data = {};

    for (final message in messages) {
      data[message.id] = message.toJson();
    }

    _boxMessage.putAll(data);
  }

  @override
  Future<List<Message>> get() async {
    List<Message> messages = [];

    for (final key in _boxMessage.keys) {
      final data = _boxMessage.get(key)?.map((key, value) {
        return MapEntry(key.toString(), value);
      });
      messages.add(Message.fromJson(data!));
    }

    return messages;
  }

  @override
  Future<void> delete() async {
    await _boxMessage.clear();
  }
}

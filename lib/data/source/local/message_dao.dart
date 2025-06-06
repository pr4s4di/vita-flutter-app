import 'package:vita_client_app/data/model/entity/message.dart';

abstract class MessageDao {
  Future<void> inserts(List<Message> messages);

  Future<List<Message>> get();

  Future<void> delete();
}

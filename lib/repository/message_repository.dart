import 'package:chopper/chopper.dart';
import 'package:vita_client_app/data/model/entity/message.dart';
import 'package:vita_client_app/data/model/request/send_message.dart';

abstract class MessageRepository {
  Future<void> inserts(List<Message> messages);

  Future<List<Message>> read();

  Future<void> clear();

  Future<Response<List<Message>>> getMessage();

  @Post()
  Future<Response<List<Message>>> sendMessage(SendMessage request);
}

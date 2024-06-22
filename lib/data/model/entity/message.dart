import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vita_client_app/util/converter/date_time_converter.dart';

part 'message.g.dart';

@JsonSerializable()
class Message extends Equatable {
  final int id;
  final String email;
  final String message;
  @DatetimeJsonConverter()
  @JsonKey(name: "created_date")
  final DateTime createdDate;
  @JsonKey(name: "message_type")
  final String messageType;
  @JsonKey(name: "file_type")
  final String fileType;

  const Message(this.id, this.email, this.message, this.createdDate,
      this.messageType, this.fileType);

  const Message.name(this.id, this.email, this.message, this.createdDate,
      this.messageType, this.fileType);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  List<Object?> get props =>
      [id, email, message, createdDate, messageType, fileType];
}

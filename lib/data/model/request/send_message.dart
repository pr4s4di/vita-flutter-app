import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_message.g.dart';

@JsonSerializable()
class SendMessage extends Equatable {
  final String message;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool isError = false;

  const SendMessage(this.message);

  factory SendMessage.fromJson(Map<String, dynamic> json) =>
      _$SendMessageFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageToJson(this);

  @override
  List<Object?> get props => [message, isError];
}

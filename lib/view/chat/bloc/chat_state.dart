import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.onLoadMessage() = LoadMessageEvent;

  const factory ChatEvent.onSendMessage(String message) = SendMessageEvent;

  const factory ChatEvent.onResendMessage(String message) = ResendMessageEvent;

  const factory ChatEvent.pickImage(ImageSource source) = PickImageEvent;

  const factory ChatEvent.onScanImage(String message) = ScanImageEvent;
}

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = ChatInitialState;

  const factory ChatState.loading() = ChatLoadingState;

  const factory ChatState.error(String message) = ChatErrorState;

  const factory ChatState.loadedState() = ChatLoadedState;

  const factory ChatState.messageSendingState() = ChatSendingState;

  const factory ChatState.messageSendedState() = ChatSendedState;

  const factory ChatState.imageSelectedState() = ImageSelectedState;

  const factory ChatState.imageUploadState() = ImageUploadState;

  const factory ChatState.imageUploadCancelState() = ImageUploadCancelState;

  const factory ChatState.imageUploadedState() = ImageUploadedState;
}

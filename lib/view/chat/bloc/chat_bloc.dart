import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vita_client_app/data/model/request/send_message.dart'
    as request;
import 'package:vita_client_app/data/model/request/upload_image.dart';
import 'package:vita_client_app/domain/load_message.dart';
import 'package:vita_client_app/domain/load_possibility.dart';
import 'package:vita_client_app/domain/pick_image.dart';
import 'package:vita_client_app/domain/scan_image.dart';
import 'package:vita_client_app/domain/send_message.dart';
import 'package:vita_client_app/view/chat/bloc/chat_error.dart';
import 'package:vita_client_app/view/chat/bloc/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final LoadMessage _loadMessage;
  final LoadPossibility _loadPossibility;
  final SendMessage _sendMessage;
  final PickImage _pickimage;
  final ScanImage _scanImage;

  List messages = [];
  XFile? selectedImage;

  ChatBloc(this._loadMessage, this._loadPossibility, this._sendMessage,
      this._pickimage, this._scanImage)
      : super(const ChatInitialState()) {
    on<LoadMessageEvent>((event, emit) async {
      emit(const ChatState.loading());
      var loadMessageResult = await _loadMessage.call();
      var loadPossibilityResult = await _loadPossibility.call();
      messages.clear();
      messages.insertAll(0, loadMessageResult);
      if (loadPossibilityResult.length > 1) {
        messages.insert(0, loadPossibilityResult);
      }
      emit(const ChatState.loadedState());
    });

    on<SendMessageEvent>((event, emit) async {
      emit(const ChatState.messageSendingState());
      await Task(() async {
        var message = request.SendMessage(event.message);
        messages.insert(0, message);
        return await _sendMessage.call(message);
      }).run().then((value) {
        messages.removeAt(0);
        messages.insertAll(0, value.reversed.toList());
        emit(const ChatState.messageSendedState());
      }).catchError((error) {
        messages.first.isError = true;
        emit(ChatState.error(error.toString()));
      });
    });

    on<ResendMessageEvent>((event, emit) async {
      emit(const ChatState.messageSendingState());
      await Task(() async {
        messages.removeWhere(
            (e) => e is request.SendMessage && e.message == event.message);
        var message = request.SendMessage(event.message);
        messages.insert(0, message);
        return await _sendMessage.call(message);
      }).run().then((value) {
        messages.removeAt(0);
        messages.insertAll(0, value.reversed.toList());
        emit(const ChatState.messageSendedState());
      }).catchError((error) {
        messages.first.isError = true;
        emit(ChatState.error(error.toString()));
      });
    });

    on<PickImageEvent>((event, emit) async {
      emit(const ChatState.imageUploadState());
      await Task(() => _pickimage.call(event.source)).run().then((image) {
        throwIf(image == null, ImageNotSelected());
        selectedImage = image;
        emit(const ChatState.imageSelectedState());
      }).catchError((error) {
        if (error is ImageNotSelected) {
          emit(const ChatState.imageUploadCancelState());
        } else {
          messages.first.isError = true;
          emit(ChatState.error(error.toString()));
        }
      });
    });

    on<ScanImageEvent>((event, emit) async {
      emit(const ChatState.imageUploadState());
      var uploadImage = UploadImage(selectedImage!);
      var message = request.SendMessage(event.message);
      messages.insert(0, uploadImage);
      messages.insert(0, message);
      await Task(() => _scanImage.call(selectedImage!, event.message))
          .run()
          .then((data) {
        messages.removeRange(0, 2);
        messages.insertAll(0, data.reversed);
        emit(const ChatState.imageUploadedState());
      }).catchError((error) {
        messages.first.isError = true;
        emit(ChatState.error(error.toString()));
      });
    });
  }
}

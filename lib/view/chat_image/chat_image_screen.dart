import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vita_client_app/view/chat_image/widget/chat_image_text_field.dart';

import '../chat/bloc/chat_bloc.dart';

class ChatImageScreen extends StatefulWidget {
  const ChatImageScreen({super.key});

  @override
  State<ChatImageScreen> createState() => _ChatImageScreenState();
}

class _ChatImageScreenState extends State<ChatImageScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Image.file(
              File(
                context.read<ChatBloc>().selectedImage!.path,
              ),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ChatImageTextField(controller: controller),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vita_client_app/data/model/entity/message.dart';
import 'package:vita_client_app/util/extension/color_extension.dart';
import 'package:vita_client_app/view/chat/widget/chat_text_time.dart';

class ChatReply extends StatelessWidget {
  final Message message;

  const ChatReply({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  color: AssetColor.gray100,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 5,
                        spreadRadius: 0,
                        offset: const Offset(0, 0))
                  ]),
              child: MarkdownBody(
                data: message.message,
                selectable: true,
                onTapText: () {},
                onSelectionChanged: (text, selection, selectionChangedCause) {},
                styleSheet: MarkdownStyleSheet(
                  code: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Colors.black,
                    backgroundColor: AssetColor.gray100,
                  ),
                  codeblockDecoration: BoxDecoration(
                    color: AssetColor.gray100,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: const Offset(0, 0))
                    ],
                  ),
                ),
                onTapLink: (text, href, title) async {
                  if (href != null) {
                    final url = Uri.parse(href);
                    if (await canLaunchUrl(url)) await launchUrl(url);
                  }
                },
              ),
            ),
          ),
          ChatTextTime(time: message.createdDate),
        ],
      ),
    );
  }
}

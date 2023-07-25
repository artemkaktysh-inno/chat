import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/messages_bloc.dart';

class ChatListTile extends StatefulWidget {
  final Chat chat;

  const ChatListTile({
    super.key,
    required this.chat,
  });

  @override
  State<ChatListTile> createState() => _ChatListTileState();
}

class _ChatListTileState extends State<ChatListTile> {
  late Chat chat;

  @override
  void initState() {
    super.initState();
    chat = widget.chat;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.PADDING_5),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<MessagesBloc>(context).add(OpenChatEvent(chat: chat));
        },
        child: Container(
          height: AppDimens.heightChatTile,
          decoration: BoxDecoration(
            color: AppColors.of(context).gray,
            borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_4),
          ),
          child: Column(
            children: <Widget>[
              Text(chat.lastMessage.sendTime.toString()),
              Row(
                children: <Widget>[
                  chat.receiver.imageUrl != ''
                      ? Image.network(chat.receiver.imageUrl)
                      : SvgPicture.asset(AppImages.profileIcon),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(chat.receiver.username),
                        Text(chat.lastMessage.content),
                      ],
                    ),
                  ),
                  Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

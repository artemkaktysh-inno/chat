import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:messages/src/widgets/chat_list_tile.dart';

class ChatList extends StatefulWidget {
  final List<Chat> chats;

  const ChatList({
    super.key,
    required this.chats,
  });

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  late List<Chat> chats;

  @override
  void initState() {
    super.initState();
    chats = widget.chats;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ChatListTile(
            chat: chats[index],
          );
        },
      ),
    );
  }
}

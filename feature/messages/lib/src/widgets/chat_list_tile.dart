import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return ListTile();
  }
}

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final Message message;

  const MessageTile({
    required this.message,
    super.key,
  });

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  late Message message;

  @override
  void initState() {
    super.initState();
    message = widget.message;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:chat/src/bloc/chat_bloc.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'chat_form.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    required this.uuid,
    super.key,
  });

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatBloc>(
      create: (_) => ChatBloc()..add(InitEvent(uuid: uuid)),
      child: const ChatForm(),
    );
  }
}

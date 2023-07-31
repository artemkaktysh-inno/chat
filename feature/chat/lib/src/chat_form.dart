import 'package:chat/src/widgets/chat_bottom_bar.dart';
import 'package:chat/src/widgets/message_tile.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'bloc/chat_bloc.dart';

class ChatForm extends StatefulWidget {
  const ChatForm({super.key});

  @override
  State<ChatForm> createState() => _ChatFormState();
}

class _ChatFormState extends State<ChatForm> {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (BuildContext context, ChatState state) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) => MessageTile(
                message: state.messages[index],
              ),
              reverse: true,
            );
          },
        ),
        bottomNavigationBar: ChatBottomBar(
          controller: messageController,
          onTapAdd: () {},
          onTapSend: () {
            BlocProvider.of<ChatBloc>(context).add(
              SendMessageEvent(
                message: messageController.value.text,
              ),
            );
          },
        ),
      ),
    );
  }
}

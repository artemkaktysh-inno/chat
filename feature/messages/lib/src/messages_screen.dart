import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'bloc/messages_bloc.dart';
import 'messages_form.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MessagesBloc>(
      create: (_) => MessagesBloc(),
      child: const MessagesForm(),
    );
  }
}

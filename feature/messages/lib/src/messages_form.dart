import 'package:flutter/material.dart';

class MessagesForm extends StatefulWidget {
  const MessagesForm({super.key});

  @override
  State<MessagesForm> createState() => _MessagesFormState();
}

class _MessagesFormState extends State<MessagesForm> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('messages'),
    );
  }
}

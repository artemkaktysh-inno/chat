import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class MessagesEvent {}

class InitEvent extends MessagesEvent {}

class OpenChatEvent extends MessagesEvent {
  final Chat chat;

  OpenChatEvent({
    required this.chat,
  });
}

class NewChatEvent extends MessagesEvent {}

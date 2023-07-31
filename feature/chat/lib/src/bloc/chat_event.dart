import 'dart:io';

import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ChatEvent {}

class InitEvent extends ChatEvent {
  final String uuid;

  InitEvent({
    required this.uuid,
  });
}

class SendMessageEvent extends ChatEvent {
  final String message;
  final List<File>? files;

  SendMessageEvent({
    required this.message,
    this.files,
  });
}

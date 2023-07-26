import 'package:flutter/foundation.dart';

@immutable
abstract class ChatEvent {}

class InitEvent extends ChatEvent {
  final String uuid;

  InitEvent({
    required this.uuid,
  });
}

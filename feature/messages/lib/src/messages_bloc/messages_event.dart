import 'package:flutter/foundation.dart';

@immutable
abstract class MessagesEvent {}

class InitEvent extends MessagesEvent {}

class NewChatEvent extends MessagesEvent {}

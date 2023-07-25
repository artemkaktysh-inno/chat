import 'dart:io';

import 'package:flutter/foundation.dart';

@immutable
abstract class ProfileEvent {}

class EditEvent extends ProfileEvent {}

class SaveEvent extends ProfileEvent {
  final String uuid;
  final String username;
  final File? photo;

  SaveEvent({
    required this.uuid,
    required this.username,
    this.photo,
  });
}

class DeleteUserEvent extends ProfileEvent {}

class ChooseImageEvent extends ProfileEvent {}

class InitEvent extends ProfileEvent {}

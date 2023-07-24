import 'dart:io';

import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class SetImageUseCase extends FutureUseCase<File, void> {
  final UserRepository _userRepository;

  SetImageUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<void> execute(File input) async {
    await _userRepository.setImage(input);
  }
}

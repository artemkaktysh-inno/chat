import 'package:domain/domain.dart';

import 'package:domain/usecases/usecase.dart';

class CreateChatUseCase extends FutureUseCase<String, void> {
  final UserRepository _userRepository;

  CreateChatUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<void> execute(String input) async {
    await _userRepository.createChat(input);
  }
}

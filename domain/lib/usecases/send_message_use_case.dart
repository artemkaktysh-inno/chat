import 'package:domain/domain.dart';

import 'usecase.dart';

class SendMessageUseCase extends FutureUseCase<Message, void> {
  final UserRepository _userRepository;

  SendMessageUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<void> execute(Message input) async {
    await _userRepository.sendMessage(input);
  }
}

import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class GetMessagesUseCase extends FutureUseCase<String, List<Message>> {
  final UserRepository _userRepository;

  GetMessagesUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<List<Message>> execute(String input) async {
    return await _userRepository.getMessages(input);
  }
}

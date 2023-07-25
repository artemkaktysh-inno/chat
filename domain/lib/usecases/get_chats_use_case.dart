import 'package:domain/domain.dart';

import 'usecase.dart';

class GetChatsUseCase extends FutureUseCase<NoParams, List<Chat>?> {
  final UserRepository _userRepository;

  GetChatsUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<List<Chat>?> execute(NoParams input) async {
    return await _userRepository.getChats();
  }
}

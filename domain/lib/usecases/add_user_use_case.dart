import 'package:domain/domain.dart';

import 'usecase.dart';

class AddUserUseCase extends FutureUseCase<User, void> {
  final UserRepository _userRepository;

  AddUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<void> execute(User input) async {
    await _userRepository.addUser(input);
  }
}

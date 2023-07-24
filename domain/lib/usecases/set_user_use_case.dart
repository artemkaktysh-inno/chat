import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class SetUserUseCase extends FutureUseCase<User, void> {
  final UserRepository _userRepository;

  SetUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<void> execute(User input) async {
    await _userRepository.setUser(input);
  }
}

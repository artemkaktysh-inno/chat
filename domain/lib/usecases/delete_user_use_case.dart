import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class DeleteUserUseCase extends FutureUseCase<NoParams, void> {
  final UserRepository _userRepository;

  DeleteUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<void> execute(NoParams input) async {
    await _userRepository.deleteUser();
  }
}

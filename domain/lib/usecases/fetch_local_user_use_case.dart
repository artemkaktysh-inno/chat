import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class FetchLocalUserUseCase extends FutureUseCase<NoParams, User> {
  final UserRepository _userRepository;

  FetchLocalUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<User> execute(NoParams input) async {
    return await _userRepository.fetchLocalUser();
  }
}

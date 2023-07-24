import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class GetLocalUserUseCase extends UseCase<NoParams, User?> {
  final UserRepository _userRepository;

  GetLocalUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  User? execute(NoParams input) {
    return _userRepository.getLocalUser();
  }
}

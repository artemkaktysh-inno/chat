import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class GetUserByUuidUseCase extends FutureUseCase<String, User> {
  final UserRepository _userRepository;

  GetUserByUuidUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<User> execute(String input) async {
    return await _userRepository.getUserByUuid(input);
  }
}

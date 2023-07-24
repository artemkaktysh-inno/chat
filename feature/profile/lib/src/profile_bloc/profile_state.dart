import 'package:core/core.dart';

class ProfileState extends Equatable {
  final bool isDisabled;
  final String username;
  final String uuid;
  final String imagePath;
  final bool isAuthorized;

  const ProfileState({
    required this.isAuthorized,
    required this.imagePath,
    required this.isDisabled,
    required this.uuid,
    required this.username,
  });

  ProfileState copyWith({
    required bool isAuthorized,
    required bool isDisabled,
    required String uuid,
    required String username,
    required String imagePath,
  }) {
    return ProfileState(
      isAuthorized: isAuthorized,
      imagePath: imagePath,
      isDisabled: isDisabled,
      uuid: uuid,
      username: username,
    );
  }

  @override
  List<Object> get props => <Object>[
        isAuthorized,
        imagePath,
        isDisabled,
        uuid,
        username,
      ];
}

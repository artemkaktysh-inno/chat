import 'package:core/core.dart';

class ProfileState extends Equatable {
  final bool isDisabled;
  final String username;
  final String uuid;
  final String imagePath;
  final bool isAuthorized;
  final bool isAlreadyExists;

  const ProfileState({
    required this.isAuthorized,
    required this.imagePath,
    required this.isDisabled,
    required this.uuid,
    required this.username,
    required this.isAlreadyExists,
  });

  ProfileState copyWith({
    bool? isAuthorized,
    bool? isDisabled,
    String? uuid,
    String? username,
    String? imagePath,
    bool? isAlreadyExists,
  }) {
    return ProfileState(
      isAuthorized: isAuthorized ?? this.isAuthorized,
      imagePath: imagePath ?? this.imagePath,
      isDisabled: isDisabled ?? this.isDisabled,
      uuid: uuid ?? this.uuid,
      username: username ?? this.username,
      isAlreadyExists: isAlreadyExists ?? this.isAlreadyExists,
    );
  }

  @override
  List<Object> get props => <Object>[
        isAuthorized,
        imagePath,
        isDisabled,
        uuid,
        username,
        isAlreadyExists,
      ];
}

import 'package:domain/domain.dart';

import '../entities/firebase_user.dart';

class UserMapper {
  static User mapFirebaseToUser(FirebaseUser firebaseUser) {
    return User(
      username: firebaseUser.username,
      uuid: firebaseUser.uuid,
      imageUrl: firebaseUser.imageUrl,
    );
  }

  static FirebaseUser mapUserToFirebase(User user) {
    return FirebaseUser(
      imageUrl: user.imageUrl,
      uuid: user.uuid,
      username: user.username,
    );
  }
}

import 'package:core/core.dart';

class FirebaseUser {
  final String uuid;
  final String username;
  final String imageUrl;

  FirebaseUser({
    required this.imageUrl,
    required this.uuid,
    required this.username,
  });

  factory FirebaseUser.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final Map<String, dynamic>? data = snapshot.data();
    return FirebaseUser(
      imageUrl: data?['image_url'],
      uuid: data?['uuid'],
      username: data?['username'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      'username': username,
      'uuid': uuid,
      'image_url': imageUrl,
    };
  }
}

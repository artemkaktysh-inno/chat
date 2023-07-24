import 'dart:io';

import 'package:core/core.dart';
import 'package:data/entities/firebase_user.dart';
import 'package:path/path.dart';

class FirebaseProvider {
  final FirebaseStorage _firebaseStorage;
  final FirebaseFirestore _firebaseFirestore;

  FirebaseProvider({
    required FirebaseStorage firebaseStorage,
    required FirebaseFirestore firebaseFirestore,
  })  : _firebaseStorage = firebaseStorage,
        _firebaseFirestore = firebaseFirestore;

  Future<FirebaseUser> getFirebaseUserById(String id) async {
    final DocumentReference<FirebaseUser> docRef =
        _firebaseFirestore.collection('users').doc(id).withConverter(
              fromFirestore: FirebaseUser.fromFirestore,
              toFirestore: (FirebaseUser firebaseUser, _) =>
                  firebaseUser.toFirestore(),
            );

    final DocumentSnapshot<FirebaseUser> snapshot = await docRef.get();
    return snapshot.data() ??
        FirebaseUser(
          imageUrl: '',
          uuid: '',
          username: '',
        );
  }

  Future<FirebaseUser?> getFirebaseUserByUuid(String uuid) async {
    final Query<Map<String, dynamic>> query =
        _firebaseFirestore.collection('users').where(
              'uuid',
              isEqualTo: uuid,
            );
    final QuerySnapshot<Map<String, dynamic>> data = await query.get();

    return data.docs.isEmpty
        ? null
        : FirebaseUser.fromFirestore(data.docs.first, null);
  }

  Future<String> addFirebaseUser(FirebaseUser firebaseUser) async {
    String id = '';
    await _firebaseFirestore
        .collection('users')
        .add(firebaseUser.toFirestore())
        .then(
          (DocumentReference<Map<String, dynamic>> documentSnapshot) =>
              id = documentSnapshot.id,
        );
    AppLogger().debug(id);
    return id;
  }

  Future<void> setFirebaseUser(String id, FirebaseUser firebaseUser) async {
    await _firebaseFirestore
        .collection('users')
        .doc(id)
        .set(firebaseUser.toFirestore());
  }

  Future<void> deleteUser(String id) async {
    await _firebaseFirestore.collection('users').doc(id).delete();
  }

  Future<String> setImage(String uuid, File image) async {
    final Reference storageRef = _firebaseStorage.ref();

    final Reference imageRef =
        storageRef.child('images/$uuid/${basename(image.path)}');

    await imageRef.putFile(image);

    return await imageRef.getDownloadURL();
  }
}

import 'dart:io';

import 'package:core/core.dart';
import 'package:data/entities/firebase_user.dart';
import 'package:path/path.dart';

import '../entities/firebase_chat.dart';

class FirebaseProvider {
  final FirebaseStorage _firebaseStorage;
  final FirebaseFirestore _firebaseFirestore;

  FirebaseProvider({
    required FirebaseStorage firebaseStorage,
    required FirebaseFirestore firebaseFirestore,
  })  : _firebaseStorage = firebaseStorage,
        _firebaseFirestore = firebaseFirestore;

  Future<FirebaseUser> getFirebaseUserById(String id) async {
    final DocumentReference<Map<String, dynamic>> docRef =
        _firebaseFirestore.collection('users').doc(id);

    final DocumentSnapshot<Map<String, dynamic>> snapshot = await docRef.get();

    final Map<String, dynamic>? data = snapshot.data();

    if (data == null) {
      return FirebaseUser(
        imageUrl: '',
        uuid: '',
        username: '',
      );
    } else {
      return FirebaseUser.fromJson(data);
    }
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
        : FirebaseUser.fromJson(data.docs.first.data());
  }

  Future<String> addFirebaseUser(FirebaseUser firebaseUser) async {
    String id = '';
    await _firebaseFirestore
        .collection('users')
        .add(firebaseUser.toJson())
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
        .set(firebaseUser.toJson());
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

  //TODO: rework to single request
  Future<List<FirebaseChat>> getChats(String uuid) async {
    final QuerySnapshot<Map<String, dynamic>> snapshotSender =
        await _firebaseFirestore
            .collection('chats')
            .where('sender_uuid', isEqualTo: uuid)
            .get();
    final QuerySnapshot<Map<String, dynamic>> snapshotReceiver =
        await _firebaseFirestore
            .collection('chats')
            .where('receiver_uuid', isEqualTo: uuid)
            .get();

    final List<FirebaseChat> listSender = snapshotSender.docs.isEmpty
        ? <FirebaseChat>[]
        : snapshotSender.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
            AppLogger().warning(snapshot.data());
            return FirebaseChat.fromJson(snapshot.data());
          }).toList();

    final List<FirebaseChat> listReceiver = snapshotReceiver.docs.isEmpty
        ? <FirebaseChat>[]
        : snapshotReceiver.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> snapshot) =>
                FirebaseChat.fromJson(snapshot.data()))
            .toList();

    return <FirebaseChat>[...listSender, ...listReceiver];
  }

  Future<void> createChat(FirebaseChat chat) async {
    await _firebaseFirestore.collection('chats').add(chat.toJson());
  }
}

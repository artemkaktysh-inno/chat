import 'package:data/entities/firebase_chat.dart';
import 'package:domain/domain.dart';

import 'message_mapper.dart';
import 'user_mapper.dart';

class ChatMapper {
  static Chat mapFromFirebase(FirebaseChat firebaseChat) {
    return Chat(
      receiverUuid: firebaseChat.receiverUuid,
      senderUuid: firebaseChat.senderUuid,
      lastMessage: firebaseChat.lastMessage != null
          ? MessageMapper.mapFromFirebase(firebaseChat.lastMessage!)
          : null,
    );
  }

  static FirebaseChat mapToFirebase(Chat chat) {
    return FirebaseChat(
      receiverUuid: chat.receiverUuid,
      senderUuid: chat.senderUuid,
      lastMessage: chat.lastMessage != null
          ? MessageMapper.mapToFirebase(chat.lastMessage!)
          : null,
    );
  }
}

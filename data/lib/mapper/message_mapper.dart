import 'package:data/entities/firebase_message.dart';
import 'package:domain/domain.dart';

class MessageMapper {
  static Message mapFromFirebase(FirebaseMessage firebaseMessage) {
    return Message(
      chatUuid: firebaseMessage.chatUuid,
      senderUuid: firebaseMessage.senderUuid,
      content: firebaseMessage.content,
      sendTime: firebaseMessage.sendTime,
    );
  }

  static FirebaseMessage mapToFirebase(Message message) {
    return FirebaseMessage(
      chatUuid: message.chatUuid,
      senderUuid: message.senderUuid,
      content: message.content,
      sendTime: message.sendTime,
    );
  }
}

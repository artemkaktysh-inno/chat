import 'firebase_message.dart';
import 'firebase_user.dart';

class FirebaseChat {
  final String receiverUuid;

  final String senderUuid;

  final FirebaseMessage? lastMessage;

  FirebaseChat({
    required this.receiverUuid,
    required this.senderUuid,
    this.lastMessage,
  });

  factory FirebaseChat.fromJson(Map<String, dynamic> data) {
    return FirebaseChat(
      receiverUuid: data['receiver_uuid'],
      senderUuid: data['sender_uuid'],
      lastMessage: FirebaseMessage.fromJson(
        data['last_message'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'receiver_uuid': receiverUuid,
      'sender_uuid': senderUuid,
      'last_message': lastMessage?.toJson(),
    };
  }
}

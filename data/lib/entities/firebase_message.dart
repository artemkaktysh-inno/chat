import 'package:core/core.dart';

class FirebaseMessage {
  final String content;

  final String chatUuid;

  final String senderUuid;

  final DateTime sendTime;

  FirebaseMessage({
    required this.chatUuid,
    required this.senderUuid,
    required this.content,
    required this.sendTime,
  });

  factory FirebaseMessage.fromJson(Map<String, dynamic> data) {
    return FirebaseMessage(
      chatUuid: data['chat_uuid'],
      senderUuid: data['sender_uuid'],
      content: data['content'],
      sendTime: DateTime.parse(
        data['send_time'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'chat_uuid': chatUuid,
      'sender_uuid': senderUuid,
      'content': content,
      'send_time': sendTime.toString(),
    };
  }
}

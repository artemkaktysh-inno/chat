import 'package:core/core.dart';

class Message extends Equatable {
  final String chatUuid;

  final String senderUuid;

  final String content;

  final DateTime sendTime;

  const Message({
    required this.chatUuid,
    required this.senderUuid,
    required this.content,
    required this.sendTime,
  });

  @override
  List<Object> get props => <Object>[
        chatUuid,
        senderUuid,
        content,
        sendTime,
      ];
}

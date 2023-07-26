import 'package:core/core.dart';

import 'message.dart';
import 'user.dart';

class Chat extends Equatable {
  const Chat({
    required this.receiverUuid,
    required this.senderUuid,
    this.lastMessage,
  });

  final Message? lastMessage;

  final String receiverUuid;

  final String senderUuid;

  @override
  List<Object?> get props => <Object?>[
        lastMessage,
        receiverUuid,
        senderUuid,
      ];
}

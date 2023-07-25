import 'package:core/core.dart';

import 'message.dart';

class Chat extends Equatable {
  const Chat({
    required this.receiverUuid,
    required this.lastMessage,
  });

  final String lastMessage;

  final Message receiverUuid;

  @override
  List<Object> get props => <Object>[
        lastMessage,
        receiverUuid,
      ];
}

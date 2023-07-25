import 'package:core/core.dart';

import 'message.dart';
import 'user.dart';

class Chat extends Equatable {
  const Chat({
    required this.receiver,
    required this.lastMessage,
  });

  final Message lastMessage;

  final User receiver;

  @override
  List<Object> get props => <Object>[
        lastMessage,
        receiver,
      ];
}

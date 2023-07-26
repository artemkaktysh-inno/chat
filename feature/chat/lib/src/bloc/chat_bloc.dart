import 'package:core/core.dart';

import 'chat_event.dart';
import 'chat_state.dart';

export 'chat_event.dart';
export 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc()
      : super(
          ChatState(),
        );
}

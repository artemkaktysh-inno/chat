import 'package:core/core.dart';
import 'package:domain/domain.dart';

import 'messages_event.dart';
import 'messages_state.dart';

export 'messages_event.dart';
export 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc()
      : super(
          const MessagesState(chats: <Chat>[]),
        ) {
    on<InitEvent>(_onInitEvent);
    on<NewChatEvent>(_onNewChatEvent);

    add(InitEvent());
  }

  Future<void> _onInitEvent(
    InitEvent event,
    Emitter<MessagesState> emit,
  ) async {}

  Future<void> _onNewChatEvent(
    NewChatEvent event,
    Emitter<MessagesState> emit,
  ) async {}
}

import 'package:core/core.dart';

import 'messages_event.dart';
import 'messages_state.dart';

export 'messages_event.dart';
export 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc()
      : super(
          const MessagesState(),
        );
}

import 'package:core/core.dart';
import 'package:domain/domain.dart';

import 'chat_event.dart';
import 'chat_state.dart';

export 'chat_event.dart';
export 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetMessagesUseCase _getMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;

  ChatBloc({
    required GetMessagesUseCase getMessagesUseCase,
    required SendMessageUseCase sendMessagesUseCase,
  })  : _getMessagesUseCase = getMessagesUseCase,
        _sendMessageUseCase = sendMessagesUseCase,
        super(
          ChatState(
            messages: const <Message>[],
          ),
        ) {
    on<InitEvent>(_onInitEvent);
    on<SendMessageEvent>(_onSendMessageEvent);
  }

  Future<void> _onInitEvent(
    InitEvent event,
    Emitter<ChatState> emit,
  ) async {
    final List<Message> messages =
        await _getMessagesUseCase.execute(event.uuid);
    emit(
      state.copyWith(
        messages: messages,
      ),
    );
  }

  Future<void> _onSendMessageEvent(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {}
}

import 'package:core/core.dart';
import 'package:domain/domain.dart';

class ChatState extends Equatable {
  final List<Message> messages;

  ChatState({
    required this.messages,
  });

  ChatState copyWith({
    List<Message>? messages,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
    );
  }

  @override
  List<Object> get props => <Object>[
        messages,
      ];
}

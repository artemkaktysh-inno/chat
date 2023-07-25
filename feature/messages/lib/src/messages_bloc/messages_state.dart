import 'package:core/core.dart';
import 'package:domain/domain.dart';

class MessagesState extends Equatable {
  final List<Chat> chats;

  const MessagesState({
    required this.chats,
  });

  MessagesState copyWith({List<Chat>? chats}) {
    return MessagesState(
      chats: chats ?? this.chats,
    );
  }

  @override
  List<Object> get props => <Object>[
        chats,
      ];
}

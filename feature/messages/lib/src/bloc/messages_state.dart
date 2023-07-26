import 'package:core/core.dart';
import 'package:domain/domain.dart';

class MessagesState extends Equatable {
  final List<Chat> chats;
  final List<User> users;

  const MessagesState({
    required this.chats,
    required this.users,
  });

  MessagesState copyWith({List<Chat>? chats, List<User>? users}) {
    return MessagesState(
      chats: chats ?? this.chats,
      users: users ?? this.users,
    );
  }

  @override
  List<Object> get props => <Object>[
        chats,
        users,
      ];
}

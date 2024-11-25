part of 'messages_cubit.dart';

sealed class MessagesState {}

final class MessagesCubitInitial extends MessagesState {}

class MessagesLoaded extends MessagesState {
  final List<MessageModel> messages;

  MessagesLoaded(this.messages);
}

class MessagesError extends MessagesState {
  final String error;

  MessagesError(this.error);
}

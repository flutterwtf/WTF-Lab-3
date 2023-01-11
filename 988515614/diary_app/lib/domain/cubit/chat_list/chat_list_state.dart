part of 'chat_list_cubit.dart';

abstract class ChatListState {}

class ChatListFillerState extends ChatListState {}

class ChatListChanged extends ChatListState {
  final List<Chat> chats;
  ChatListChanged(this.chats);
}

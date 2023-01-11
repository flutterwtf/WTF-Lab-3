import 'package:bloc/bloc.dart';
import 'package:diary_app/data/temp_chat_events.dart';
import 'package:diary_app/data/temp_chats.dart';
import 'package:equatable/equatable.dart';

import '../../entities/chat.dart';

part 'chat_list_state.dart';

class ChatListCubit extends Cubit<ChatListState> {
  ChatListCubit() : super(ChatListChanged(chats));

  ChatListChanged update() {
    emit(ChatListFillerState());
    return ChatListChanged(chats);
  }

  void pinUnpinChat(int index) {
    if (chats[index].isPinned) {
      chats[index].isPinned = false;
      final lastPinnedIndex = chats.lastIndexWhere((element) => element.isPinned);
      final chat = chats.removeAt(index);
      chats.insert(lastPinnedIndex, chat);
      emit(update());
      return;
    }

    final lastPinnedIndex = chats.lastIndexWhere((element) => element.isPinned);
    final chat = chats.removeAt(index);
    chat.isPinned = true;
    chats.insert(lastPinnedIndex + 1, chat);
    emit(update());
  }

  void editChat(Chat? result, int index) {
    if (result != null) {
      chats[index].icon = result.icon;
      chats[index].title = result.title;
      emit(update());
    }
  }

  void removeChat(int index) {
    final chatId = chats[index].chatId;
    chatEvents.remove(chatId);
    chats.removeAt(index);
    emit(update());
  }

  void addChat(Chat? result) {
    if (result != null) {
      final lastPinnedIndex = chats.lastIndexWhere((element) => element.isPinned);
      chats.insert(lastPinnedIndex + 1, result);
      emit(update());
    }
  }

  Chat getChatData(int index) {
    return chats[index];
  }
}

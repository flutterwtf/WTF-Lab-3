import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/temp_chat_events.dart';
import 'package:meta/meta.dart';

import '../../entities/event.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final int chatId;
  bool get isEmpty => chatEvents[chatId]!.isEmpty;

  ChatCubit(this.chatId) : super(ChatEventsUpdated(chatEvents: chatEvents[chatId]!));

  ChatEventsUpdated update() {
    emit(ChatEventsFillerState());
    return ChatEventsUpdated(
      chatEvents: chatEvents[chatId]!,
    );
  }

  void removeSelectedItems() {
    chatEvents[chatId]!.removeWhere((element) => element.isSelected);
    emit(update());
  }

  void changeFavoriteness(bool isFavorite) {
    for (var e in chatEvents[chatId]!) {
      if (e.isSelected) {
        e.isFavorite = isFavorite;
      }
    }
    emit(update());
  }

  void removeSelections() {
    for (var e in chatEvents[chatId]!) {
      e.isSelected = false;
    }
    emit(update());
  }

  void editEvent(int eventIndex, Event editedEvent) {
    chatEvents[chatId]![eventIndex] = editedEvent;
    emit(update());
  }

  void addEvent(Event newEvent) {
    chatEvents[chatId]!.add(newEvent);
    emit(update());
  }

  void changeSelectionState(int eventIndex) {
    final chat = chatEvents[chatId]!;
    chat[eventIndex].isSelected = !chat[eventIndex].isSelected;
    emit(update());
  }

  void getSearchResult(String filter) {
    unmarkSearchResults();
    for (var e in chatEvents[chatId]!) {
      if (!e.message.toLowerCase().contains(filter.toLowerCase())) {
        e.isDisplayed = false;
      }
    }
    emit(update());
  }

  void unmarkSearchResults() {
    for (var e in chatEvents[chatId]!) {
      e.isDisplayed = true;
    }
    emit(update());
  }

  void moveSelectedItems(int targetChatId) {
    final toBeMoved = [];
    for (var e in chatEvents[chatId]!) {
      if (e.isSelected) {
        toBeMoved.add(e);
      }
    }
    chatEvents[chatId]!.removeWhere((element) => element.isSelected);

    for (var e in toBeMoved) {
      e.isSelected = false;
    }
    chatEvents[targetChatId]!.addAll(List.from(toBeMoved));

    emit(update());
  }

  void removeItemById(int eventIndex) {
    chatEvents[chatId]!.removeAt(eventIndex);
    emit(update());
  }
}

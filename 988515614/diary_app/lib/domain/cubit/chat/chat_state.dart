// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatEventsFillerState extends ChatState {}

class ChatEventsUpdated extends ChatState {
  final List<Event> chatEvents;
  ChatEventsUpdated({
    required this.chatEvents,
  });
}

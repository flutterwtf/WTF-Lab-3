import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:rxdart/rxdart.dart';

import '../models/chat.dart';

abstract class ChatRepositoryApi {
  ValueStream<IList<Chat>> get chats;

  Future<void> load();

  Future<void> add(Chat chat);

  Future<void> update(Chat chat);

  Future<void> remove(Chat chat);

  Future<void> pin(Chat chat);

  Future<void> unpin(Chat chat);

  Future<void> togglePin(Chat chat);

  Future<Chat?> findById(int id);
}

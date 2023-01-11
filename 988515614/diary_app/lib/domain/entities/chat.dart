// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Chat {
  final DateTime createdAt;
  final int chatId;
  IconData icon;
  String title;
  String? lastMessage;
  DateTime? updatedAt;
  bool isPinned;

  Chat({
    required this.chatId,
    required this.icon,
    required this.title,
    required this.createdAt,
  }) : isPinned = false;
}

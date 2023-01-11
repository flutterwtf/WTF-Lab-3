// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diary_app/domain/entities/event_category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Event extends Equatable {
  bool isFavorite = false;
  bool isSelected = false;
  bool isDisplayed = true;
  EventCategory? category;

  final bool isMessage;
  final DateTime dateTime;
  final String message;
  final Image? image;

  Event(
    this.category, {
    required this.isMessage,
    required this.dateTime,
    required this.message,
    this.image,
  });

  @override
  List<Object?> get props => [isFavorite, isSelected, isMessage, dateTime, message, image];
}

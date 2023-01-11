import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';

import '../domain/entities/chat.dart';

final List<Chat> chats = [
  Chat(
    chatId: 1,
    icon: CarbonIcons.departure,
    title: 'Travel',
    createdAt: DateTime.now(),
  ),
  Chat(
    chatId: 2,
    icon: CarbonIcons.pedestrian_family,
    title: 'Family',
    createdAt: DateTime.now(),
  ),
  Chat(
    chatId: 3,
    icon: CarbonIcons.trophy,
    title: 'Sports',
    createdAt: DateTime.now(),
  ),
  Chat(
    chatId: 4,
    icon: Icons.label_important,
    title: 'Smth interesting',
    createdAt: DateTime.now(),
  ),
];

// Chat(
//     icon: CarbonIcons.game_console,
//     title: 'Chill',
//     createdAt: DateTime.now(),
//   ),
//   Chat(
//     icon: CarbonIcons.workspace,
//     title: 'Projects',
//     createdAt: DateTime.now(),
//   ),
//   Chat(
//     icon: CarbonIcons.navaid_civil,
//     title: 'Goals',
//     createdAt: DateTime.now(),
//   ),
//   Chat(
//     icon: CarbonIcons.face_activated_add,
//     title: 'Mood',
//     createdAt: DateTime.now(),
//   ),
//   Chat(
//     icon: CarbonIcons.satellite,
//     title: 'Work',
//     createdAt: DateTime.now(),
//   ),
//   Chat(
//     icon: CarbonIcons.gas_station,
//     title: 'Mechanics',
//     createdAt: DateTime.now(),
//   ),
//   Chat(
//     icon: CarbonIcons.keyboard,
//     title: 'Programming',
//     createdAt: DateTime.now(),
//   ),
//   Chat(
//     icon: CarbonIcons.watson,
//     title: 'Ideas',
//     createdAt: DateTime.now(),
//   ),
//   Chat(
//     icon: CarbonIcons.quadrant_plot,
//     title: 'Stats',
//     createdAt: DateTime.now(),
//   ),
import 'themes.dart';
import 'package:flutter/material.dart';

import 'custom_theme.dart';
import 'presentation/pages/main_screen.dart';

void main() {
  runApp(const CustomTheme(
    initialThemeKey: MyThemesKeys.light,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.of(context),
      title: 'Diary app',
      home: MainScreen(),
    );
  }
}

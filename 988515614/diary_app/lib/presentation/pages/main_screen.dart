import 'package:diary_app/domain/cubit/chat_list/chat_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_theme.dart';

import 'home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainScreen extends HookWidget {
  MainScreen({super.key});
  static const _tabNames = ['Home', 'Daily', 'Timeline', 'Explore'];
  final _pages = [
    BlocProvider(
      create: (context) => ChatListCubit(),
      child: const HomePage(),
    ), // Home
    Text('2nd'), // Daily
    Text('3rd'), // Timeline
    Text('4th'), // Explore
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final currentTab = useState(_tabNames[currentIndex.value]);

    return Scaffold(
      appBar: _appBar(context, currentTab),
      body: _body(currentIndex),
      bottomNavigationBar: _bottomNavBar(
        currentIndex,
        currentTab,
      ),
    );
  }

  Widget _bottomNavBar(ValueNotifier<int> currentIndex, ValueNotifier<String> currentTab) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex.value,
      selectedItemColor: Colors.yellow.shade900,
      unselectedItemColor: Colors.grey.shade700,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      onTap: (index) {
        currentIndex.value = index;
        currentTab.value = _tabNames[index];
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            Icons.book,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Daily',
          icon: Icon(Icons.access_time_filled_sharp),
        ),
        BottomNavigationBarItem(
          label: 'Timeline',
          icon: Icon(Icons.map),
        ),
        BottomNavigationBarItem(
          label: 'Explore',
          icon: Icon(Icons.architecture_outlined),
        ),
      ],
    );
  }

  Widget _body(ValueNotifier<int> currentIndex) => _pages.elementAt(currentIndex.value);

  PreferredSizeWidget _appBar(BuildContext context, ValueNotifier<String> currentTab) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        splashRadius: 20,
        icon: const Icon(CupertinoIcons.line_horizontal_3),
        onPressed: () {},
      ),
      title: Text(
        currentTab.value,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: [
        IconButton(
          splashRadius: 20,
          icon: const Icon(CupertinoIcons.drop_fill),
          onPressed: () => CustomTheme.changeTheme(context),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project4/models/lesson.dart';
import 'package:project4/screen/choose_title_screen.dart';
import 'package:project4/screen/home_screen.dart';
import 'package:project4/screen/statistical_screen.dart';
import 'package:project4/wiget/CustomTabbar.dart';

import 'list_vocabulary_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    // ChooseTitleScreen(model: Lesson(title: 'title', img: 'img', sttLesson: 'sttLesson', totalStar: 3, id: 2)),
    HomeScreen(),
    StatisticalScreen(),
    ListVocabularyScreen(),
    // Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.handyman,
    Icons.perm_contact_cal_outlined,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          // appBar: ,
          // body: IndexedStack(
          //   index: _selectedIndex,
          //   children: _screens,
          // ),
          body: _screens[_selectedIndex],
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: CustomTabar(
              icons: _icons,
              selectedIndex : _selectedIndex,
              onTap:(index) =>setState(()=>_selectedIndex = index),
            ),
          ),
        )
    );
  }
}

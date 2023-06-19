import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/myschedulePage.dart';
import 'package:flutter_application_1/screens/newsPage.dart';
import 'package:flutter_application_1/screens/schedulePage.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/screens/myschludePage1.dart';
import 'package:flutter_application_1/screens/findPage.dart';

class MyBotBar extends StatefulWidget {
  const MyBotBar({super.key});

  @override
  State<MyBotBar> createState() => _MyBotBarState();
}

class _MyBotBarState extends State<MyBotBar> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const NewsPage(),
    ScheduleWidget(),
    // MySchedule(),
    MyWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedIconTheme: const IconThemeData(color: Colors.white, size: 30),
        type: BottomNavigationBarType.fixed,
        // backgroundColor: const Color.fromARGB(255, 123, 209, 255),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'Расписание',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}

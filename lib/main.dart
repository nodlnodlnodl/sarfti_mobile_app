import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/bot_bar.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/services/api.dart';


void main() => runApp(const MyApp());

bool _iconBool = false;
IconData _iconLight = Icons.nights_stay;
IconData _iconDark = Icons.wb_sunny;

ThemeData _lightTheme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 33, 150, 243),
    ),
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        backgroundColor: Color.fromARGB(255, 33, 150, 243)),
    brightness: Brightness.light);
ThemeData _darkTheme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 0, 89, 141),
    ),
    primarySwatch: Colors.indigo,
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        backgroundColor: Color.fromARGB(255, 0, 89, 141)),
    brightness: Brightness.dark);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _iconBool ? _darkTheme : _lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                color: Colors.white,
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
          title: const Center(
            child: Text('СарФТИ'),
          ),
          //backgroundColor: Colors.deepPurple[400],
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _iconBool = !_iconBool;
                });
              },
              icon: Icon(_iconBool ? _iconDark : _iconLight),
            ),
          ],
        ),
        body: const MyBotBar(),
        drawer: const MainDrawer(),
      ),
    );
  }
}

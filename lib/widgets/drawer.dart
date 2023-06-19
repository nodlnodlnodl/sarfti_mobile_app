import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/myschedulePage.dart';
import 'package:flutter_application_1/screens/settingsPage.dart';
import 'package:flutter_application_1/services/api.dart';


class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('User Name'),
            accountEmail: Text('username@email.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('image/haha.jpg'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListTile(
                title: const Text('Настройки'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MySettings()));
                },
              ),
              ListTile(
                title: const Text('О приложении'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

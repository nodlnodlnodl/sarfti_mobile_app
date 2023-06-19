import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/bot_bar.dart';
import 'package:flutter_application_1/main.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.0), // Высота AppBar
        child: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Группы'),
              Tab(text: 'Преподаватели'),
              Tab(text: 'Аудитории'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          GroupPage(),
          TeacherPage(),
          RoomPage(),
        ],
      ),
    );
  }
}

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildGroupCard(context, 'Группа 1'),
          _buildGroupCard(context, 'Группа 2'),
          _buildGroupCard(context, 'Группа 3'),
        ],
      ),
    );
  }

  Widget _buildGroupCard(BuildContext context, String groupName) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: Text(groupName),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        },
      ),
    );
  }
}

class TeacherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildTeacherCard(context, 'Преподаватель 1'),
          _buildTeacherCard(context, 'Преподаватель 2'),
          _buildTeacherCard(context, 'Преподаватель 3'),
        ],
      ),
    );
  }

  Widget _buildTeacherCard(BuildContext context, String teacherName) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: Text(teacherName),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        },
      ),
    );
  }
}

class RoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildRoomCard(context, 'Аудитория 1'),
          _buildRoomCard(context, 'Аудитория 2'),
          _buildRoomCard(context, 'Аудитория 3'),
        ],
      ),
    );
  }

  Widget _buildRoomCard(BuildContext context, String roomName) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: Text(roomName),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        },
      ),
    );
  }
}

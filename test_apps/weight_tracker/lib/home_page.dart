import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker/models/user.dart';
import 'package:weight_tracker/pages/history_page.dart';
import 'package:weight_tracker/pages/profile_page.dart';
import 'package:weight_tracker/pages/statistics_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final user = User(
      'John',
      'Doe',
      23,
      emails: ['johny@gmail.com', 'john.doe@gmail.com'],
    );
    return Provider<User>.value(
      value: user,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weight Tracker'),
        ),
        body: _page == 0
            ? StatisticsPage()
            : (_page == 1 ? HistoryPage() : ProfilePage()),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: (i) => setState(() => _page = i),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              title: Text('Statistics'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              title: Text('History'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

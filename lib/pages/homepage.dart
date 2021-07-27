import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:twitter_clone/Screens/MessageScreen.dart';
import 'package:twitter_clone/Screens/NotificationScreen.dart';
import 'package:twitter_clone/Screens/SearchScreen.dart';
import 'package:twitter_clone/Screens/homeScreen.dart';
import 'package:twitter_clone/Widgets/DrawerWidget.dart';
import 'package:twitter_clone/themes.dart';

class HomePage extends StatefulWidget {
  static const routename = '/homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    NotificationScreen(),
    MessageScreen(),
  ];

  void _nextIndex(int val) {
    setState(() {
      _currIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: DrawerWidget(),
      body: _screens[_currIndex],
      bottomNavigationBar: Container(
        height: devicesize.height * 0.09,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: TwitterTheme.blueTColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currIndex,
          onTap: _nextIndex,
          enableFeedback: true,
          elevation: 10,
          items: [
            BottomNavigationBarItem(icon: Icon(LineIcons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(LineIcons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(LineIcons.bell), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: ""),
          ],
        ),
      ),
    );
  }
}

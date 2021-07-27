import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
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
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            centerTitle: true,
            elevation: 5,
            title: Icon(
              LineIcons.twitter,
              size: 36,
            ),
            actions: [IconButton(onPressed: () {}, icon: Icon(LineIcons.star))],
          ),
        ],
      ),
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

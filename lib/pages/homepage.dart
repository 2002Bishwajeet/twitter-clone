import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: Drawer(),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            centerTitle: true,
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
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.white70,
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
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
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            padding: const EdgeInsets.fromLTRB(
              16.0,
              16.0,
              0.0,
              8.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        "https://images.pexels.com/photos/2811087/pexels-photo-2811087.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                    radius: 25),
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Carol hans',
                    softWrap: true,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    "@Carol_21",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                  ),
                  trailing: IconButton(
                      splashRadius: 15,
                      onPressed: () {},
                      icon: Icon(Icons.expand_more)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                          children: [
                            TextSpan(
                                text: '239 ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(text: 'Following ')
                          ]),
                    ),
                    SizedBox(width: 10),
                    RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                          children: [
                            TextSpan(
                                text: '18k ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(text: 'Followers ')
                          ]),
                    ),
                  ],
                ),
                Divider(),
                // SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.person),
                  contentPadding: EdgeInsets.zero,
                  title: Text('Profile'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.notes),
                  contentPadding: EdgeInsets.zero,
                  title: Text('Lists'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.topic_sharp),
                  contentPadding: EdgeInsets.zero,
                  title: Text('Topics'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.bookmark_outline_rounded),
                  contentPadding: EdgeInsets.zero,
                  title: Text('Bookmarks'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.lightbulb_outline_rounded),
                  contentPadding: EdgeInsets.zero,
                  title: Text('Moments'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.star_outline_rounded),
                  contentPadding: EdgeInsets.zero,
                  title: Text('Monetisation'),
                  onTap: () {},
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Settings and privacy',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Help Centre',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Spacer(),
                Divider(),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.lightbulb,
                          color: TwitterTheme.blueTColor,
                        )),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.qr_code,
                          color: TwitterTheme.blueTColor,
                        )))
              ],
            ),
          ),
        ),
      ),
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

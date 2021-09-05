/*
  Developed by Bishwajeet Parhi
  GitHub: https://github.com/2002Bishwajeet
  Twitter: https://twitter.com/biswa_20p
  Feel free to improve the  twitter_clone Repo.
*/

import 'package:flutter/material.dart';
import 'package:twitter_clone/Mobile/MobileWelcomeScreen.dart';
import 'package:twitter_clone/Web/WebWelcomeScreen.dart';
import 'package:twitter_clone/themes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: TwitterTheme.blueTColor,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, size) {
          if (size.maxWidth < 830) return MobileViewWidget();
          return WebViewWidget();
        }),
      ),
    );
  }
}

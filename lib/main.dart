import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/pages/homepage.dart';
import 'package:twitter_clone/pages/login_signup_screen.dart';
import '../pages/authenticationPage.dart';
import 'package:twitter_clone/themes.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TwitterTheme.lightTheme(context),
      home: AuthenticationPage(),
      routes: {
        HomePage.routename: (ctx) => HomePage(),
        LoginScreen.routename: (ctx) => LoginScreen(),
      },
    );
  }
}

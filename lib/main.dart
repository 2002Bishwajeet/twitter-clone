import 'package:flutter/material.dart';
import 'package:twitter_clone/themes.dart';
import '../pages/homepage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TwitterTheme.lightTheme(context),
      home: HomePage(),
    );
  }
}

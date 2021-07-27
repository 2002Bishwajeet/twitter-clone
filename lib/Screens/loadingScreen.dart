import 'package:flutter/material.dart';
import 'package:twitter_clone/themes.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: TwitterTheme.blueTColor,
        ),
      ),
    );
  }
}

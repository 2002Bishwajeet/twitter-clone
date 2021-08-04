import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
          'https://media1.tenor.com/images/0e91293f60f1bbdebdd8a6932e4c903e/tenor.gif?itemid=18519512'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
    );
  }
}

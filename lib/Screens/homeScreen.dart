import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:twitter_clone/Widgets/Story_widget.dart';

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
          elevation: 15,
          title: Icon(
            LineIcons.twitter,
            size: 36,
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(LineIcons.star))],
        ),
        SliverToBoxAdapter(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: ListView.builder(
              itemBuilder: (context, index) => StoryWidget(index: index),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              padding: const EdgeInsets.only(left: 8),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:twitter_clone/themes.dart';

class StoryWidget extends StatelessWidget {
  // final String twitterId;
  // final String imageUrl;
  final int index;
  const StoryWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Stack(
        children: [
          CircleAvatar(
              radius: 30,
              backgroundColor:
                  index == 0 ? Colors.transparent : TwitterTheme.blueTColor,
              child: CircleAvatar(
                radius: 27,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/2811087/pexels-photo-2811087.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
              )),
          if (index == 0)
            Positioned(
              bottom: 2,
              right: 0,
              child: CircleAvatar(
                backgroundColor: TwitterTheme.blueTColor,
                radius: 10,
                child: Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

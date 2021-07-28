import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class TweetWidget extends StatelessWidget {
  const TweetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                radius: 26,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/2811087/pexels-photo-2811087.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')),
            title: RichText(
              text: TextSpan(
                  text: 'Sonia Joseph ',
                  style: Theme.of(context).textTheme.headline6,
                  children: [
                    TextSpan(
                        text: '@soniajoseph_ ',
                        style: Theme.of(context).textTheme.subtitle1,
                        children: [
                          TextSpan(text: ' 23h'),
                        ]),
                  ]),
            ),
            subtitle: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Flutter is Google\'s SDK for crafting beautiful, fast user experiences for mobile, web, and desktop from a single codebase.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconNumberedWidget(
                          ico: LineIcons.alternateComment, number: 3),
                      Spacer(),
                      IconNumberedWidget(ico: LineIcons.retweet, number: 5),
                      Spacer(),
                      IconNumberedWidget(ico: LineIcons.heart, number: 7),
                      Spacer(),
                    ])
              ],
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          ),
          Divider(
            color: Colors.grey.shade700,
            thickness: 0.5,
          )
        ],
      ),
    );
  }
}

class IconNumberedWidget extends StatelessWidget {
  final IconData ico;
  final int number;
  const IconNumberedWidget({Key? key, required this.ico, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {},
            child: Icon(
              ico,
              color: Colors.grey,
            )),
        SizedBox(width: 10),
        Text(number.toString())
      ],
    );
  }
}

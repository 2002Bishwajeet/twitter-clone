/*
  Developed by Bishwajeet Parhi
  GitHub: https://github.com/2002Bishwajeet
  Twitter: https://twitter.com/biswa_20p
  Feel free to improve the  twitter_clone Repo.
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:twitter_clone/models/tweetModel.dart';

class TweetWidget extends StatelessWidget {
  final TweetModel data;
  const TweetWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: data.imgUrl.contains('assets')
                  ? AssetImage(data.imgUrl)
                  : CachedNetworkImageProvider(data.imgUrl) as ImageProvider,
            ),
            title: RichText(
              text: TextSpan(
                  text: '${data.name} ',
                  style: Theme.of(context).textTheme.headline6,
                  children: [
                    TextSpan(
                        text: '@${data.handle} ',
                        style: Theme.of(context).textTheme.subtitle1,
                        children: [
                          TextSpan(
                              text: DateFormat.Hms().format(data.createdAt)),
                        ]),
                  ]),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    data.tweet,
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
                          ico: LineIcons.alternateComment,
                          number: data.comments),
                      Spacer(),
                      IconNumberedWidget(
                          ico: LineIcons.retweet, number: data.retweets),
                      Spacer(),
                      IconNumberedWidget(
                          ico: LineIcons.heart, number: data.likes),
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

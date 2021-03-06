/*
  Developed by Bishwajeet Parhi
  GitHub: https://github.com/2002Bishwajeet
  Twitter: https://twitter.com/biswa_20p
  Feel free to improve the  twitter_clone Repo.
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/providers/tweet_provider.dart';
import 'package:twitter_clone/providers/user_provider.dart';
import 'package:twitter_clone/themes.dart';

class CreateTweetPage extends ConsumerWidget {
  static const routename = '/CreateTweet';
  CreateTweetPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _tweet = watch(tweetTextProvider);
    final _postTweet = watch(tweetClassProvider);
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(CupertinoIcons.xmark,
                        color: TwitterTheme.blueTColor),
                  ),
                  MaterialButton(
                    onPressed: _tweet.state.isEmpty
                        ? null
                        : () async {
                            await _postTweet.postTweet(_tweet.state);
                            Navigator.of(context).pop();
                          },
                    child: Text('Tweet'),
                    color: TwitterTheme.blueTColor,
                    disabledColor: TwitterTheme.blueTColor.withOpacity(0.5),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ],
              ),
              Consumer(
                builder: (context, watch, _) {
                  final _userProfileimage = watch(getUserProfileDataProvider);
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    leading: _userProfileimage.when(
                        data: (data) => CircleAvatar(
                            backgroundImage:
                                CachedNetworkImageProvider(data.avatarUrl)),
                        loading: () =>
                            CircleAvatar(backgroundColor: Colors.blue),
                        error: (e, trace) =>
                            CircleAvatar(child: Text(e.toString()))),
                    title: TextFormField(
                      autocorrect: true,
                      autofocus: true,
                      enableSuggestions: true,
                      maxLines: 20,
                      decoration: InputDecoration(
                        hintText: 'What\'s happening? ',
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                      ),
                      onChanged: (val) {
                        _tweet.state = val;
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

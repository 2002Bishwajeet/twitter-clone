/*
  Developed by Bishwajeet Parhi
  GitHub: https://github.com/2002Bishwajeet
  Twitter: https://twitter.com/biswa_20p
  Feel free to improve the  twitter_clone Repo.
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:line_icons/line_icons.dart';
import 'package:twitter_clone/Widgets/Story_widget.dart';
import 'package:twitter_clone/Widgets/TweetWidget.dart';
import 'package:twitter_clone/models/getUserProfile.dart';
import 'package:twitter_clone/models/tweetModel.dart';
import 'package:twitter_clone/providers/story_provider.dart';
import 'package:twitter_clone/providers/tweet_provider.dart';
import 'package:twitter_clone/providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          centerTitle: true,
          elevation: 1,
          floating: true,
          title: Icon(
            LineIcons.twitter,
            size: 36,
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(LineIcons.star))],
        ),
        SliverToBoxAdapter(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Consumer(
              builder: (context, watch, _) {
                final AsyncValue<UserProfile> ref =
                    watch(getUserProfileDataProvider);
                final storiesdata = watch(storyDataProvider);

                return ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 8),
                  children: [
                    ref.when(
                        data: (data) => StoryWidget(
                              userData: data,
                              index: 0,
                            ),
                        loading: () => CircularProgressIndicator(),
                        error: (e, _) => CircleAvatar(
                              child: Text(e.toString()),
                            )),
                    storiesdata.when(
                        data: (data) {
                          return Row(
                              children: data
                                  .map((e) => StoryWidget(
                                        storyData: e,
                                      ))
                                  .toList());
                        },
                        loading: () => CircularProgressIndicator(),
                        error: (e, _) => CircularProgressIndicator())
                  ],
                );
              },
            ),
          ),
        ),
        Consumer(builder: (context, watch, _) {
          final tweetStream = watch(tweetStreamProvider);
          return tweetStream.when(
              data: (data) {
                if (data.docs.isEmpty)
                  return SliverToBoxAdapter(
                    child: Center(child: Text('It\'s Empty')),
                  );

                return SliverList(
                    delegate: SliverChildListDelegate(
                        data.docs.map((DocumentSnapshot document) {
                  return TweetWidget(
                    data: TweetModel.fromMap(
                        document.data() as Map<String, dynamic>),
                  );
                }).toList()));
              },
              loading: () => SliverToBoxAdapter(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: ListView.builder(
                          itemBuilder: (context, index) => ListTileShimmer(
                                isDarkMode: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? true
                                    : false,
                              )),
                    ),
                  ),
              error: (e, _trace) =>
                  SliverToBoxAdapter(child: Text(e.toString())));
        }),
      ],
    );
  }
}

/*
  Developed by Bishwajeet Parhi
  GitHub: https://github.com/2002Bishwajeet
  Twitter: https://twitter.com/biswa_20p
  Feel free to improve the  twitter_clone Repo.
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/models/getUserProfile.dart';
import 'package:twitter_clone/pages/createStoryPage.dart';
import 'package:twitter_clone/providers/story_provider.dart';
import 'package:twitter_clone/providers/user_provider.dart';
import 'package:twitter_clone/themes.dart';

class StoryWidget extends ConsumerWidget {
  // final String twitterId;
  // final String imageUrl;
  final int index;
  StoryWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final ImagePicker _picker = ImagePicker();

  Future<String?> pickImage(ImagePicker picker) async {
    // TODO: Find why camera is not working
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    print(image);

    return image!.path;
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    String? url = watch(imageUrlProvider);
    return InkWell(
      onTap: () async {
        url = await pickImage(_picker);
        if (url == null) {
          return;
        } else
          Navigator.of(context).pushNamed(CreateStory.routename);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Stack(
          children: [
            // TODO: Delete this Approach and make a better one when you implement the feature.
            Consumer(
              builder: (context, watch, _) {
                final AsyncValue<UserProfile> ref =
                    watch(getUserProfileDataProvider);
                return CircleAvatar(
                    radius: 30,
                    backgroundColor: index == 0
                        ? Colors.transparent
                        : TwitterTheme.blueTColor,
                    child: ref.when(
                      data: (data) => CircleAvatar(
                        radius: 27,
                        backgroundImage: data.avatarUrl.contains('assets')
                            ? AssetImage(data.avatarUrl)
                            : NetworkImage(data.avatarUrl) as ImageProvider,
                      ),
                      loading: () => CircleAvatar(
                        radius: 27,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/2811087/pexels-photo-2811087.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                      ),
                      error: (e, _) => CircleAvatar(
                        radius: 27,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/2811087/pexels-photo-2811087.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                      ),
                    ));
              },
            ),
            if (index == 0)
              Positioned(
                bottom: 2,
                right: 0,
                child: Consumer(
                  builder: (context, watch, _) {
                    return CircleAvatar(
                      backgroundColor: TwitterTheme.blueTColor,
                      radius: 10,
                      child: Icon(
                        Icons.add,
                        size: 18,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

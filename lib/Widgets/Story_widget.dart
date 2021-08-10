/*
  Developed by Bishwajeet Parhi
  GitHub: https://github.com/2002Bishwajeet
  Twitter: https://twitter.com/biswa_20p
  Feel free to improve the  twitter_clone Repo.
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/models/StoryModel.dart';
import 'package:twitter_clone/models/getUserProfile.dart';
import 'package:twitter_clone/pages/createStoryPage.dart';
import 'package:twitter_clone/providers/story_provider.dart';
import 'package:twitter_clone/themes.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel? storyData;
  final UserProfile? userData;

  final int? index;
  StoryWidget({
    Key? key,
    this.storyData,
    this.userData,
    this.index,
  }) : super(key: key);

  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImage(ImagePicker picker) async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    print(image);

    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: index == 0
            ? () async {
                final StateController<XFile?> provider =
                    context.read(imageUrlProvider);
                provider.state = await pickImage(_picker);
                if (provider.state == null) {
                  return;
                } else
                  Navigator.of(context).pushNamed(CreateStory.routename);
              }
            : () {},
        child: Stack(
          children: [
            storyData != null
                ? CircleAvatar(
                    radius: 30,
                    backgroundColor: index == 0
                        ? Colors.transparent
                        : TwitterTheme.blueTColor,
                    child: CircleAvatar(
                      radius: 27,
                      backgroundImage: storyData!.profileUrl.contains('assets')
                          ? AssetImage(storyData!.profileUrl)
                          : CachedNetworkImageProvider(storyData!.profileUrl)
                              as ImageProvider,
                    ),
                  )
                : CircleAvatar(
                    radius: 30,
                    backgroundColor: index == 0
                        ? Colors.transparent
                        : TwitterTheme.blueTColor,
                    child: CircleAvatar(
                      radius: 27,
                      backgroundImage: userData!.avatarUrl.contains('assets')
                          ? AssetImage(userData!.avatarUrl)
                          : CachedNetworkImageProvider(userData!.avatarUrl)
                              as ImageProvider,
                    ),
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


  // final AsyncValue<UserProfile> ref =
  //                   watch(getUserProfileDataProvider);
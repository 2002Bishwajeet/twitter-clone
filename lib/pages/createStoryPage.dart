import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/models/StoryModel.dart';
import 'package:twitter_clone/providers/story_provider.dart';

class CreateStory extends ConsumerWidget {
  static final routename = '/createStory';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final XFile? file = watch(imageUrlProvider).state;
    final Stories provider = watch(storyProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
              onPressed: () async {
                await provider.createStory(file!.path, file.name).whenComplete(
                    () => ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Story Posted'))));

                Navigator.of(context).pop();
              },
              child: Text('Post')),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: FileImage(File(file!.path)))),
      ),
    );
  }
}

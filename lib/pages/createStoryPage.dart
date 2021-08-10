import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/providers/story_provider.dart';

class CreateStory extends ConsumerWidget {
  static final routename = '/createStory';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final XFile? file = watch(imageUrlProvider).state;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          TextButton(onPressed: () {}, child: Text('Post')),
        ],
      ),
      body: Stack(
        children: [Image.file(File(file!.path))],
      ),
    );
  }
}

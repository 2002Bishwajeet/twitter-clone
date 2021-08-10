import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/models/StoryModel.dart';

final stroryProvider = Provider<Stories>((ref) {
  return Stories();
});

final imageUrlProvider = StateProvider<XFile?>((ref) {
  return;
});

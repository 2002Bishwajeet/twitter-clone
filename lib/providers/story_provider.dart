import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/StoryModel.dart';

final stroryProvider = Provider<Stories>((ref) {
  return Stories();
});

final imageUrlProvider = Provider<String?>((ref) {
  return;
});

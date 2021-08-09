import 'dart:convert';

/*
  Developed by Bishwajeet Parhi
  GitHub: https://github.com/2002Bishwajeet
  Twitter: https://twitter.com/biswa_20p
  Feel free to improve the  twitter_clone Repo.
*/

class StoryModel {
  final String name;
  final String id;
  final String imgUrl;
  StoryModel({
    required this.name,
    required this.id,
    required this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'imgUrl': imgUrl,
    };
  }

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      name: map['name'],
      id: map['id'],
      imgUrl: map['imgUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryModel.fromJson(String source) =>
      StoryModel.fromMap(json.decode(source));
}

class StoryItemModel {
  final String handle;
  final String profilePicture;
  final String id;
  final String picture;

  StoryItemModel({
    required this.handle,
    required this.profilePicture,
    required this.id,
    required this.picture,
  });

  Map<String, dynamic> toMap() {
    return {
      'handle': handle,
      'profilePicture': profilePicture,
      'id': id,
      'picture': picture,
    };
  }

  factory StoryItemModel.fromMap(Map<String, dynamic> map) {
    return StoryItemModel(
      handle: map['handle'],
      profilePicture: map['profilePicture'],
      id: map['id'],
      picture: map['picture'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryItemModel.fromJson(String source) =>
      StoryItemModel.fromMap(json.decode(source));
}

class Stories {
  
}
 
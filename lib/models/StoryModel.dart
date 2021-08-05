/*
  Developed by Bishwajeet Parhi
  GitHub: https://github.com/2002Bishwajeet
  Twitter: https://twitter.com/biswa_20p
  Feel free to improve the  twitter_clone Repo.
*/

import 'dart:convert';

class Stories {
  final String name;
  final String id;
  final String imgUrl;
  Stories({
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

  factory Stories.fromMap(Map<String, dynamic> map) {
    return Stories(
      name: map['name'],
      id: map['id'],
      imgUrl: map['imgUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Stories.fromJson(String source) =>
      Stories.fromMap(json.decode(source));
}

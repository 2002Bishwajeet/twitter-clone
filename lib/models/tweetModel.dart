
class TweetModel {
  final String imgUrl;
  final String name;
  final String handle;
  final int likes;
  final int retweets;
  final int comments;
  final DateTime createdAt;
  TweetModel({
    required this.imgUrl,
    required this.name,
    required this.handle,
    required this.likes,
    required this.retweets,
    required this.comments,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'imgUrl': imgUrl,
      'name': name,
      'handle': handle,
      'likes': likes,
      'retweets': retweets,
      'comments': comments,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory TweetModel.fromMap(Map<String, dynamic> map) {
    return TweetModel(
      imgUrl: map['imgUrl'],
      name: map['name'],
      handle: map['handle'],
      likes: map['likes'],
      retweets: map['retweets'],
      comments: map['comments'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

}

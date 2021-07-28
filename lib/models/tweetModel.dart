class TweetModel {
  final String url;
  final String name;
  final String handle;
  final int likes;
  final int retweets;
  final int comments;
  final DateTime createdAt;
  TweetModel({
    required this.url,
    required this.name,
    required this.handle,
    required this.likes,
    required this.retweets,
    required this.comments,
    required this.createdAt,
  });
}

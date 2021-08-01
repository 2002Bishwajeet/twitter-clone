import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String name;
  final String handle;
  final int followers;
  final int following;
  final String avatarUrl;
  UserProfile({
    required this.name,
    required this.handle,
    required this.followers,
    required this.following,
    required this.avatarUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'handle': handle,
      'followers': followers,
      'following': following,
      'avatarUrl': avatarUrl,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      name: map['name'],
      handle: map['handle'],
      followers: map['followers'],
      following: map['following'],
      avatarUrl: map['avatarUrl'],
    );
  }
}

class GetUserProfileData {
  FirebaseFirestore profileData = FirebaseFirestore.instance;
  final String profileId;

  GetUserProfileData(this.profileData, this.profileId);

  Future<UserProfile> getprofileData() async {
    final data = await profileData.collection('users').doc(profileId).get();

    return UserProfile.fromMap(data.data() as Map<String, dynamic>);

    // print(data.data());
    // print(data.data());
  }

  List<UserProfile> twitterUsers = [];
}

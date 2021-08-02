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
      'twitterHandle': handle,
      'followers': followers,
      'following': following,
      'profilePicure': avatarUrl,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      name: map['name'],
      handle: map['twitterHandle'],
      followers: map['followers'],
      following: map['following'],
      avatarUrl: map['profilePicure'],
    );
  }
}

class GetUserProfileData {
  FirebaseFirestore profileData = FirebaseFirestore.instance;
  final String profileId;

  GetUserProfileData(this.profileData, this.profileId);

  Future<UserProfile> getprofileData() async {
    final data = await profileData.collection('users').doc(profileId).get();

    // print(data.data() as Map<String, dynamic>);
    // print(
    // '${UserProfile.fromMap(data.data() as Map<String, dynamic>)} from futureprofile');
    return UserProfile.fromMap(data.data() as Map<String, dynamic>);
  }

  List<UserProfile> twitterUsers = [];
}

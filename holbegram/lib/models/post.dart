import 'package:cloud_firestore/cloud_firestore.dart';

class Posts {
  final String caption;
  final String uid;
  final String username;
  final List likes;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;

  Posts({
    required this.caption,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      caption: json['caption'],
      uid: json['uid'],
      username: json['username'],
      likes: List.from(json['likes']),
      postId: json['postId'],
      datePublished: (json['datePublished'] as Timestamp).toDate(),
      postUrl: json['postUrl'],
      profImage: json['profImage'],
    );
  }

  Map<String, dynamic> toJson() => {
        'caption': caption,
        'uid': uid,
        'username': username,
        'likes': likes,
        'postId': postId,
        'datePublished': datePublished,
        'postUrl': postUrl,
        'profImage': profImage,
      };
}

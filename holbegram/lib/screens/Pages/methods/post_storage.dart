import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holbegram/screens/auth/methods/user_storage.dart'; // Import uploadImageToStorage

class PostStorage {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Upload Post Method
  Future<String> uploadPost(
    String caption,
    String uid,
    String username,
    String profImage,
    Uint8List image,
  ) async {
    try {
      // Upload image to storage and get the URL
      String imageUrl = await StorageMethods().uploadImageToStorage(true, 'posts', image);

      // Generate a unique post ID
      String postId = _firestore.collection('posts').doc().id;

      // Prepare the post data
      Map<String, dynamic> postData = {
        'caption': caption,
        'uid': uid,
        'username': username,
        'profImage': profImage,
        'postId': postId,
        'postUrl': imageUrl,
        'datePublished': DateTime.now(),
        'likes': [],
      };

      // Save the post data to Firestore
      await _firestore.collection('posts').doc(postId).set(postData);

      return "Ok";
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch (e) {
      throw Exception("Failed to delete post: $e");
    }
  }
}

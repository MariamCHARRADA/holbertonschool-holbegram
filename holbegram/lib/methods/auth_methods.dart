import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:typed_data';
import 'package:holbegram/models/user.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Login method
  Future<String> login({
    required String email,
    required String password,
  }) async {
    String result = "An error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        result = "success";
      } else {
        result = "Please fill all the fields";
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  // Sign Up method
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    Uint8List? file,
  }) async {
    String result = "An error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        // Create user with email and password
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        User? user = userCredential.user;

        if (user != null) {
          // Create a new Users object
          Users users = Users(
            uid: user.uid,
            email: email,
            username: username,
            bio: "",
            photoUrl: "",
            followers: [],
            following: [],
            posts: [],
            saved: [],
            searchKey: username[0].toLowerCase(),
          );

          // Save the user data in Firestore
          await _firestore.collection("users").doc(user.uid).set(users.toJson());

          result = "success";
        }
      } else {
        result = "Please fill all the fields";
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }
}

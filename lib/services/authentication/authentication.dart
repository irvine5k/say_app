import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:say_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Firestore _firestore = Firestore.instance;

  FirebaseUser loggedInUser;

  bool isLoading = false;

  Future<void> createUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    isLoading = true;

    try {
      final newUser = _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (newUser != null) Navigator.pushNamed(context, ChatScreen.id);

      isLoading = false;
    } catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> sendMessage(String message) async {
    try {
      getCurrentUser();
      _firestore
          .collection('messages')
          .document()
          .setData({'text': message, 'sender': loggedInUser.email});
    } catch (e) {}
  }

  // void messagesStream() async {
  //   await for(var snapshot in _firestore.collection('messages').snapshots()){
  //     snapshot.documents
  //   }
  // }

  Future<void> signInUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      final newUser = _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      if (newUser != null) Navigator.pushNamed(context, ChatScreen.id);
    } catch (e) {
      throw Exception(e.message);
    }
  }

  void getCurrentUser() async {
    try {
      final user = await _firebaseAuth.currentUser();

      if (user != null) loggedInUser = user;
    } catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> signWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      final FirebaseUser user =
          await _firebaseAuth.signInWithCredential(credential);

      return user;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw Exception(e.message);
    }
  }

  Stream<FirebaseUser> get onAuthStateChanged =>
      _firebaseAuth.onAuthStateChanged;
}

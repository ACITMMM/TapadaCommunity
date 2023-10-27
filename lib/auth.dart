import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

void cacheCredential(UserCredential credential) async {
  final user = credential.user;
  if (user != null) {
    debugPrint('User registered with UID: ${user.uid}');
  }

  final email = user?.email ?? "";
  if (email != "") {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cachedEmail', email);
  }
}

Future<UserCredential> signInWithEmailAndPassword(
    {required String email, required String password}) async {
  UserCredential credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  cacheCredential(credential);
  return credential;
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? account = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? auth = await account?.authentication;

  // Create a new credential
  final OAuthCredential googleAuthCredential = GoogleAuthProvider.credential(
    accessToken: auth?.accessToken,
    idToken: auth?.idToken,
  );

  // Once signed in, cache the credential
  UserCredential credential = await FirebaseAuth.instance.signInWithCredential(
    googleAuthCredential,
  );
  cacheCredential(credential);

  return credential;
}

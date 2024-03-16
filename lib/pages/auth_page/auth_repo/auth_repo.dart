import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> registerUser(String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      log("Error while register");
    }
    return null;
  }

  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      log("success");
      log(credential.user.toString());
      return credential.user;
    } catch (e) {
      log("Error while login");
    }
    return null;
  }
}

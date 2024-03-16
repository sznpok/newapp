import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthRepo {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference? dbRef;

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

  kycSetup(String name, String fatherName, String motherName, int age,
      int citizenNumber) async {
    dbRef = FirebaseDatabase.instance.ref().child("Person");
    Map<String, dynamic> people = {
      "name": name,
      "fatherName": fatherName,
      "motherName": motherName,
      "age": age,
      "citizenshipNo": citizenNumber
    };
    await dbRef!.push().set(people);
  }
}

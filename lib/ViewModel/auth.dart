import 'package:adminpanel_hardwarepro/View/Widgets/show_message.dart';
import 'package:adminpanel_hardwarepro/View/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final auth = FirebaseAuth.instance;

  Future<String> login(email, password, context, toPage) async {
    try {
      // showLoadingIndicator(context, "Loading...");
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      
  
      Future.delayed(const Duration(seconds: 5));
       showSuccessMessage(context, "Login successful");
         Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => toPage), (route) => false);

      return credential.user!.uid;
    } catch (e) {
      return customeShowDiolog("$e", context);
    }
  }


  signOutFromMAil(context) async {
    showLoadingIndicator(context, "Removing credential");
    await FirebaseAuth.instance.signOut();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>  LoginScreen()),
          (route) => false);
    });
  }
}

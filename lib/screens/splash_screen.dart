
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instagram/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _hasCheckedAuth = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkAuthState();
  }

  Future<void> _checkAuthState() async {
    if (_hasCheckedAuth) return; // Skip if already checked
    _hasCheckedAuth = true;

    // Simulate splash screen delay (optional)
    await Future.delayed(const Duration(seconds: 1));

    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      if (currentUser.emailVerified) {
        // User is logged in and email is verified
        Get.offAllNamed(MyRoutes.bottomNav); // Replace '/home' with your home page route
      }
    } else {
      // User is not logged in
      Get.offAllNamed(MyRoutes.login); // Replace '/login' with your login page route
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/instagram.png",
              height: 120,
              width: 350,
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/utils/routes.dart';

class AuthController extends GetxController with WidgetsBindingObserver{
  static AuthController instance = Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this); // Register lifecycle observer
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this); // Remove lifecycle observer
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // App is resumed; check email verification
      checkEmailVerification();
    }
  }


  Future<void> registerUser(String email, String password, VoidCallback toHome) async {
    try {
      isLoading.value = true;

      // Create the user
      await _auth.createUserWithEmailAndPassword(email: email, password: password);

      // Send email verification
      await sendEmailVerification();

      Get.snackbar(
        "Success",
        "Registration successful! Please verify your email and return to the app.",
        snackPosition: SnackPosition.TOP,
      );

      // Optionally navigate the user to a waiting screen for email verification
     // Get.toNamed(MyRoutes.waitingForEmailVerification);

    } catch (e) {
      Get.snackbar(
        "Error",
        "An error occurred during registration: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }


  // Send email verification
  Future<void> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Check email verification when app resumes
  Future<void> checkEmailVerification() async {
    try {
      final user = _auth.currentUser;

      if (user != null) {
        await user.reload(); // Refresh user data
        final isVerified = user.emailVerified; // Get the updated email verification status

        if (isVerified) {
          Get.snackbar(
            "Verified",
            "Email verified! Redirecting to home page.",
            snackPosition: SnackPosition.TOP,
          );
          Get.offAllNamed(MyRoutes.bottomNav); // Navigate to home screen
        } else {
          Get.snackbar(
            "Not Verified",
            "Please verify your email by clicking on the link sent to your email address.",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "An error occurred while checking email verification: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }



  // Method to listen for email verification
  // void listenForEmailVerification(VoidCallback toHome) {
  //   final user = _auth.currentUser;
  //
  //   if (user == null) return;
  //
  //   // Listen to changes in authentication state
  //   _auth.authStateChanges().listen((firebaseUser) async {
  //     if (firebaseUser != null) {
  //       await firebaseUser.reload(); // Refresh user data
  //       if (firebaseUser.emailVerified) {
  //         // Stop listening and navigate to home
  //         Get.snackbar(
  //           "Verified",
  //           "Email verified! Redirecting to home page.",
  //           snackPosition: SnackPosition.TOP,
  //         );
  //         toHome();
  //       }
  //     }
  //   });
  // }


  // Login user
  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;

      // Attempt to sign in the user
      UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // Check if the user's email is verified
      if (userCredential.user?.emailVerified ?? false) {
        Get.snackbar("Success", "Login successful!");
        Get.offAllNamed(MyRoutes.bottomNav); // Navigate to next page
      } else {
        Get.snackbar("Error", "Please verify your email before logging in.");
        await _auth.signOut(); // Log out the unverified user
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication errors
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", "No user found with this email.");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Incorrect password.");
      } else {
        Get.snackbar("Error", "Something went wrong: ${e.message}");
      }
    } catch (e) {
      // Handle any other exceptions
      Get.snackbar("Error", "An unexpected error occurred: ${e.toString()}");
    } finally {
      // Ensure loading state is reset
      isLoading.value = false;
    }
  }


  // Sign out user
  Future<void> signOut() async {
    await _auth.signOut();
    Get.snackbar("Success", "You have logged out.");
  }
}
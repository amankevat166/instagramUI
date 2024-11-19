import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram/widgets/ui_helper.dart';

class ForgotPasswordController extends GetxController {

  var isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendPasswordResetEmail(BuildContext context,String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        "Success",
        "Password reset email sent successfully!",
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      UiHelper.alertDialog(context, "Error", e.toString());
    }
  }
}
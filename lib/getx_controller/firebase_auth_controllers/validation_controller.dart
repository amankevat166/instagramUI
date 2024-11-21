import 'package:get/get.dart';

class ValidationController extends GetxController {
  String? validateEmail(String? email) {
    if (!GetUtils.isEmail(email!)) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password!.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }
}

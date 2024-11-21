import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instagram/getx_controller/firebase_auth_controllers/forgot_password_controller.dart';
import 'package:instagram/getx_controller/firebase_auth_controllers/validation_controller.dart';
import 'package:instagram/utils/routes.dart';
import 'package:instagram/widgets/ui_helper.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final forgotPassController = Get.put(ForgotPasswordController());
  final validationController = Get.put(ValidationController());

  void forgotPass(String email) {
    forgotPassController.sendPasswordResetEmail(context, email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 343,
              decoration: BoxDecoration(
                border: Border.all(
                    color: VxContextExtensions(context).theme.primaryColorDark),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    validationController.validateEmail(value!),
                decoration: InputDecoration(
                  hintText: "Email",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintStyle: context.displaySmall,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => forgotPassController.isLoading.value
                  ? CircularProgressIndicator()
                  : UiHelper.elevatedButton(
                      context: context,
                      callback: () async {
                        final email = _emailController.text.trim();
                        if (email.isEmpty) {
                          UiHelper.alertDialog(
                              context, "Forgot pass", "Email can't be Empty");
                        } else {
                          forgotPass(email);
                        }
                      },
                      text: "Reset"),
            ),
            SizedBox(height: 20,),
            UiHelper.elevatedButton(
                context: context,
                callback: () => Get.offAllNamed(MyRoutes.login),
                text: "Back"),
          ],
        ),
      ),
    );
  }
}

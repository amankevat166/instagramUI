import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/firebase/firebase_auth/auth_controller.dart';
import 'package:instagram/firebase/firebase_auth/validation_controller.dart';
import 'package:instagram/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/ui_helper.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  final authController = Get.put(AuthController());
  final validationController = Get.put(ValidationController());

  Future<void> registerSuccess(String email,String pass) async {

    if (validationController.validateEmail(email) == null &&
        validationController.validatePassword(pass) == null) {
      await authController.registerUser(email, pass,()=>Get.offAllNamed(MyRoutes.home));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "Instagram"
                .text
                .textStyle(GoogleFonts.satisfy())
                .color(VxContextExtensions(context).theme.primaryColorDark)
                .bold
                .xl4
                .make(),
            SizedBox(
              height: 20,
            ),
            UiHelper.customTextField(
              context: context,
              text: "Username",
              controller: _userNameController,
              toHide: false,
              textInput: TextInputType.text,

            ),
            SizedBox(
              height: 20,
            ),
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
            Container(
              height: 50,
              width: 343,
              decoration: BoxDecoration(
                border: Border.all(
                    color: VxContextExtensions(context).theme.primaryColorDark),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: _passController,
                obscureText: true,
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    validationController.validatePassword(value!),
                decoration: InputDecoration(
                  hintText: "Password",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintStyle: context.displaySmall,
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Obx(
              () => authController.isLoading.value
                  ? const CircularProgressIndicator()
                  : UiHelper.elevatedButton(
                      context: context,
                      callback: () {
                        final email = _emailController.text.trim();
                        final pass = _passController.text.trim();
                        if(email.isEmpty || pass.isEmpty){
                          UiHelper.alertDialog(context, "Register", "Email and password can't be empty");
                        }
                        else {
                          registerSuccess(email,pass);
                        }
                      },
                      text: "Register"),
            ),
            const SizedBox(
              height: 20,
            ),

            UiHelper.richText(
                context: context,
                text1: "Already have an account? ",
                text2: "Sign In",
                callback: () => Get.offAllNamed(MyRoutes.login)),
          ],
        ),
      ),
    );
  }
}

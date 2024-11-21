import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/getx_controller/firebase_auth_controllers/auth_controller.dart';
import 'package:instagram/getx_controller/firebase_auth_controllers/validation_controller.dart';
import 'package:instagram/utils/routes.dart';
import 'package:instagram/widgets/ui_helper.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passController = TextEditingController();

  final authController = Get.put(AuthController());

  final validationController = Get.put(ValidationController());

  Future<void> loginSuccess(String email,String pass) async {

    if (validationController.validateEmail(email) == null &&
        validationController.validatePassword(pass) == null) {
      await authController.loginUser(email, pass,);
    }
  }
  void toPass(){
    Get.offAllNamed(MyRoutes.forgotPass);
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
            const SizedBox(
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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: toPass,
                      child: "forgot password?".text.medium.blue500.make()),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => authController.isLoading.value
                  ? CircularProgressIndicator()
                  : UiHelper.elevatedButton(
                      context: context,
                      callback: () async {
                        final email = _emailController.text.trim();
                        final pass = _passController.text.trim();
                        if(email.isEmpty || pass.isEmpty){
                          UiHelper.alertDialog(context, "login", "Email and password can't be Empty");
                        }
                        else{
                          loginSuccess(email, pass);
                        }
                      },
                      text: "Login"),
            ),
            SizedBox(
              height: 20,
            ),
            UiHelper.richText(
                context: context,
                text1: "Don't have an account? ",
                text2: "Sign Up",
                callback: () =>
                    Navigator.pushNamed(context, MyRoutes.register)),
          ],
        ),
      ),
    );
  }
}

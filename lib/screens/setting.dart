
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instagram/getx_controller/firebase_auth_controllers/auth_controller.dart';
import 'package:instagram/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class Setting extends StatelessWidget {
   Setting({super.key});

  final authController = Get.put(AuthController());

  void logOut(){
    authController.signOut();
    Get.offAllNamed(MyRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.offAllNamed(MyRoutes.bottomNav), icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: logOut,
                child: "Logout".text.color(Colors.red).lg.make().pOnly(left: 20)),
          ],
        ),
      ),
    );
  }
}

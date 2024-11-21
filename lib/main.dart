import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:instagram/getx_controller/firebase_auth_controllers/firebase_methods.dart';
import 'package:instagram/screens/splash_screen.dart';
import 'package:instagram/themes/theme.dart';
import 'package:instagram/utils/routes.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize GetX controller
  Get.put(FirebaseMethods());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,

      home: const SplashScreen(),
      getPages: MyRoutes.routes,

      // routes: {
      //   MyRoutes.login: (context) =>Login(),
      //   MyRoutes.register: (context) => Register(),
      //   MyRoutes.home: (context) => HomeScreen(),
      //   MyRoutes.bottomNav: (context) => BottomNavBar(),
      //   MyRoutes.message: (context) => Message(),
      // },
    );
  }
}



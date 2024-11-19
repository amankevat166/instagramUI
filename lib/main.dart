import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:instagram/screens/heart.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/login.dart';
import 'package:instagram/screens/message.dart';
import 'package:instagram/screens/profile.dart';
import 'package:instagram/screens/register.dart';
import 'package:instagram/screens/search.dart';
import 'package:instagram/screens/splash_screen.dart';
import 'package:instagram/themes/theme.dart';
import 'package:instagram/utils/routes.dart';
import 'package:instagram/widgets/bottom_nav_bar.dart';

import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

      home: SplashScreen(),
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



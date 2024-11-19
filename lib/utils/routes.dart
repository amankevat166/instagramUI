import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:instagram/screens/forgot_password.dart';
import 'package:instagram/screens/heart.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/login.dart';
import 'package:instagram/screens/message.dart';
import 'package:instagram/screens/profile.dart';
import 'package:instagram/screens/register.dart';
import 'package:instagram/screens/splash_screen.dart';
import 'package:instagram/widgets/bottom_nav_bar.dart';

class MyRoutes{

  static const splash = "/splash";
  static const login = "/login";
  static const register = "/register";
  static const home = "/home";
  static const bottomNav = "/bottomNav";
  static const message = "/message";
  static const heart = "/heart";
  static const profile = "/profile";
  static const forgotPass = "/forgotPass";

  static final routes = [
    GetPage(name:MyRoutes.splash , page: () => SplashScreen()),
    GetPage(name:MyRoutes.login , page: () => Login()),
    GetPage(name:MyRoutes.register , page: () => Register()),
    GetPage(name:MyRoutes.home , page: () => HomeScreen()),
    GetPage(name:MyRoutes.bottomNav , page: () => BottomNavBar()),
    GetPage(name:MyRoutes.message , page: () => Message()),
    GetPage(name:MyRoutes.heart , page: () => Heart()),
    GetPage(name:MyRoutes.profile , page: () => Profile()),
    GetPage(name:MyRoutes.forgotPass , page: () => ForgotPassword()),
  ];
}
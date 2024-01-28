import 'package:blue_crew_chat/Screens/Auth/login_screen.dart';
import 'package:blue_crew_chat/Screens/chat_screen.dart';
import 'package:blue_crew_chat/Screens/home_screen.dart';
import 'package:blue_crew_chat/Screens/profile_screen.dart';
import 'package:blue_crew_chat/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'constants.dart';
import 'models/chat-user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: kOxBlue));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => {
      _initializeFirebase(),
      runApp(const MyApp()),
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:'/SplashScreen',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/LogInScreen', page: () => LoginScreen()),
        GetPage(name: '/SplashScreen', page: () => SplashScreen()),
        GetPage(name: '/ProfileScreen', page: () => ProfileScreen()),

      ],
    );
  }
}


_initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
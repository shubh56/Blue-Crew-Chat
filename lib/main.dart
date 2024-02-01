import 'package:blue_crew_chat/Screens/AdviceToPatient.dart';
import 'package:blue_crew_chat/Screens/Auth/login_screen.dart';
import 'package:blue_crew_chat/Screens/UploadReportPatient.dart';
import 'package:blue_crew_chat/Screens/bottom_bar.dart';
import 'package:blue_crew_chat/Screens/chat_screen.dart';
import 'package:blue_crew_chat/Screens/chat_home_screen.dart';
import 'package:blue_crew_chat/Screens/chatbotFileUpload.dart';
import 'package:blue_crew_chat/Screens/doctor_home_screen.dart';
import 'package:blue_crew_chat/Screens/onboarding_screen_two.dart';
import 'package:blue_crew_chat/Screens/onboarding_screen_one.dart';
import 'package:blue_crew_chat/Screens/onboarding_three_screen.dart';
import 'package:blue_crew_chat/Screens/pharmacy_screen.dart';
import 'package:blue_crew_chat/Screens/profile_screen.dart';
import 'package:blue_crew_chat/Screens/splash_screen.dart';
import 'package:blue_crew_chat/bmii_calculator/screens/input_page.dart';
import 'package:blue_crew_chat/bmii_calculator/screens/results_page.dart';
import 'package:blue_crew_chat/chatbot.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'ImageOCR.dart';
import 'Screens/doctor_bottom_bar.dart';
import 'Screens/onboarding_four_screen.dart';
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
        GetPage(name: '/BottomBar', page: () => BottomBar()),
        GetPage(name: '/ChatScreen', page: () => ChatHomeScreen()),
        GetPage(name: '/LogInScreen', page: () => LoginScreen()),
        GetPage(name: '/SplashScreen', page: () => SplashScreen()),
        GetPage(name: '/ProfileScreen', page: () => ProfileScreen()),
        GetPage(name: '/OnboardingOne', page: () => OnboardingOneScreen()),
        GetPage(name: '/OnboardingTwo', page: () => OnboardingTwoScreen()),
        GetPage(name: '/OnboardingThree', page: () => OnboardingThreeScreen()),
        GetPage(name: '/OnboardingFour',page: () => OnboardingFourScreen()),
        GetPage(name: '/DoctorBottomBar', page: () => DoctorBottomBar()),
        GetPage(name: '/DoctorHomeScreen', page: () => DoctorHomeScreen()),
        GetPage(name: '/DoctorImageOCR', page: () => DoctorImageOCR()),
        GetPage(name: '/ChatBot', page: () => ChatBot()),
        GetPage(name: '/PharmacyScreen', page: () => PharmacyScreen()),
        GetPage(name: '/UploadReportScreen', page: () => UploadReportPatient()),
        GetPage(name: '/AdviceToPatient', page: () => AdviceToPatient()),
        GetPage(name: '/AdviceToPatient', page: () => AdviceToPatient()),
        GetPage(name: '/BMIInputPage', page: () => InputPage()),
        GetPage(name: '/BMIResultPage', page: () => ResultsPage()),
        GetPage(name: '/BotFileUpload', page: () => ChatBotFileUpload()),
        GetPage(name: '/BotQuestionAnswer', page: () => ChatBot()),




      ],
    );
  }
}


_initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
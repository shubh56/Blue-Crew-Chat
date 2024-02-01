import 'dart:async';
import 'dart:math' as math;
import 'package:blue_crew_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'Auth/authentication.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller =
  AnimationController(vsync: this, duration: Duration(seconds: 20))
    ..repeat();

  @override
  void initState(){
    Timer(const Duration(seconds: 8),(){
      if(Auth.authInstance.currentUser==null){
        _controller.dispose();
        Get.offAllNamed('/LogInScreen');
      }
      else{
        _controller.dispose();
        Get.offAllNamed('/BottomBar');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOxBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              child: Image.asset(
                'images/img_thumbs_up2.png',
                height: Get.height * 0.2,
                width: Get.width * 0.4,
                color: kSeaSalt
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
              width: Get.height * 0.4,
            ),
            Text(
              'MediBuddy',
              style: TextStyle(
                fontFamily: 'WorkSans',
                fontSize: Get.height * 0.03,
                color: kSeaSalt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// import 'dart:math' as math;
//
// class _FooPageState extends State<FooPage> with SingleTickerProviderStateMixin{
//   late final AnimationController _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (_, child) {
//             return Transform.rotate(
//               angle: _controller.value * 2 * math.pi,
//               child: child,
//             );
//           },
//           child: FlutterLogo(size: 200),
//         ),
//       ),
//     );
//   }
// }

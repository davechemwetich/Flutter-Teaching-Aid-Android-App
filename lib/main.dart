import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectx/inroduction/introduction.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Image.asset('images/splash.png'),
          backgroundColor: Colors.grey,
          nextScreen: OnBoardingPage(),
          splashTransition: SplashTransition.rotationTransition,
        ));
  }
}

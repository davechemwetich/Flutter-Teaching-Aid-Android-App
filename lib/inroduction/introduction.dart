import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

import 'package:projectx/mainscreen/main_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final List<Introduction> list = [
    Introduction(
      title: 'CBC Learning kit',
      subTitle: 'Educational Application dedicated to CBC children.',
      imageUrl: 'images/giftest.gif',
    ),
    Introduction(
      title: '',
      subTitle: 'Teach children many things Using Artificial Intelegence.',
      imageUrl: 'images/giftest.gif',
    ),
    Introduction(
      title: '',
      subTitle: 'Lets get started and lerning new and amazing',
      imageUrl: 'images/giftest.gif',
    ),
    Introduction(
      title: 'Finish',
      subTitle: 'click the skip button to navigate to the main screen',
      imageUrl: 'images/giftest.gif',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}

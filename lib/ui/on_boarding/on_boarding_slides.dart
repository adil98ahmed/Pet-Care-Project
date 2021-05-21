import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:pet_care/ui/authentication/auth_ways.dart';
import 'package:pet_care/widgets/PageViewModel.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          IntroViewsFlutter(
            pages,
            onTapDoneButton: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AuthenticationScreen(),
                ),
                (route) => false,
              );
            },
            showSkipButton: false,
            doneText: Text(
              "Skip",
            ),
            pageButtonsColor: AppTheme.appDark,
            pageButtonTextStyles: new TextStyle(
              fontSize: 16.0,
              fontFamily: "Co",
            ),
          ),
        ],
      ),
    );
  }
}

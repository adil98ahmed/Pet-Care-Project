import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/ui/on_boarding/on_boarding_slides.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => OnBoardingScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppTheme.appSecondary,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 3),
        child: Image.asset(
          'assets/images/catLogo.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

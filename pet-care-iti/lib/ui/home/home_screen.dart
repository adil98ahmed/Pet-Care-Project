import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/models/doctor_model.dart';
import 'package:pet_care/models/user_model.dart';
import 'package:pet_care/ui/grooming/grooming_screen.dart';
import 'package:pet_care/ui/markets/market_screen.dart';
import 'package:pet_care/ui/pharmacies/pharmacy_screen.dart';
import 'package:pet_care/ui/trainers/trainers_screen.dart';
import 'package:pet_care/ui/veterinarian/veterinarian_screen.dart';

class HomeScreen extends StatelessWidget {
  final user;
  final double _elevation = 5;

  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var name;
    if (user.runtimeType == Doctor) {
      name = user.firstName;
    } else if (user.runtimeType == UserModel) {
      name = user.name;
    } else {
      name = user.name;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: deviceData.size.height * 0.05,
                child: TextField(
                  style: TextStyle(
                      color: AppTheme.headLine1Color,
                      fontSize: 16,
                      fontFamily: 'Co'),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      size: 30.0,
                      color: AppTheme.appDark,
                    ),
                  ),
                ),
              ),
              Text.rich(TextSpan(
                  text: 'What are you \nlooking for, ',
                  style: TextStyle(
                      color: AppTheme.headLine1Color,
                      fontFamily: 'Co',
                      fontSize: 30),
                  children: <InlineSpan>[
                    TextSpan(
                      text: name,
                      style: TextStyle(
                          color: AppTheme.appDark,
                          fontSize: 28,
                          fontFamily: 'Co'),
                    )
                  ])),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 5,
                        top: 10,
                        child: Container(
                          height: 110,
                          width: 110,
                          child: Material(
                            borderRadius: BorderRadius.circular(57.5),
                            elevation: _elevation,
                            shadowColor: Colors.black26,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MarketScreen(
                                                currentUser: user)),
                                      );
                                    },
                                    child: Image.asset(
                                      'assets/images/pet-shop.png',
                                      height: 50,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Stores',
                                    style: TextStyle(
                                        color: AppTheme.headLine1Color,
                                        fontSize: 14,
                                        fontFamily: 'Co'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: 10,
                        child: Container(
                          height: 110,
                          width: 110,
                          child: Material(
                            borderRadius: BorderRadius.circular(57.5),
                            elevation: _elevation,
                            shadowColor: Colors.black26,
                            child: Container(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                GroomingScreen(
                                                    currentUser: user)),
                                      );
                                    },
                                    child: Image.asset(
                                      'assets/images/bath.png',
                                      height: 50,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Grooming',
                                    style: TextStyle(
                                        color: AppTheme.headLine1Color,
                                        fontSize: 14,
                                        fontFamily: 'Co'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Container(
                            height: 140,
                            width: 140,
                            child: Material(
                              borderRadius: BorderRadius.circular(70),
                              elevation: _elevation,
                              shadowColor: Colors.black26,
                              child: Container(
                                padding: EdgeInsets.all(25),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VeterinarianView()),
                                        );
                                      },
                                      child: Image.asset(
                                        'assets/images/veter.png',
                                        height: 60,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Veterinary',
                                      style: TextStyle(
                                          color: AppTheme.headLine1Color,
                                          fontSize: 14,
                                          fontFamily: 'Co'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5,
                        bottom: 50,
                        child: SizedBox(
                          height: 110,
                          width: 110,
                          child: Material(
                            borderRadius: BorderRadius.circular(57.5),
                            elevation: _elevation,
                            shadowColor: Colors.black26,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PharmacyScreen(
                                                    currentUser: user)),
                                      );
                                    },
                                    child: Image.asset(
                                      'assets/images/pharmacy.png',
                                      height: 50,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Pharmacies',
                                    style: TextStyle(
                                        color: AppTheme.headLine1Color,
                                        fontSize: 14,
                                        fontFamily: 'Co'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        bottom: 50,
                        child: SizedBox(
                          height: 110,
                          width: 110,
                          child: Material(
                            borderRadius: BorderRadius.circular(57.5),
                            elevation: _elevation,
                            shadowColor: Colors.black26,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TrainersScreen(
                                                    currentUser: user)),
                                      );
                                    },
                                    child: Image.asset(
                                      'assets/images/dog.png',
                                      height: 50,
                                    ),
                                  ),
                                  Text(
                                    'Training',
                                    style: TextStyle(
                                        color: AppTheme.headLine1Color,
                                        fontSize: 14,
                                        fontFamily: 'Co'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

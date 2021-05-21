import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:pet_care/colors/style.dart';

final pages = [
  PageViewModel(
    pageColor: AppTheme.appSecondary,
    iconColor: null,
    bubbleBackgroundColor: AppTheme.appDark,
    title: Container(),
    body: Column(
      children: <Widget>[
        Text(
          'Welcome to DR.Vet',
          style: TextStyle(fontFamily: "Co"),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'All types of services for your pet in one place, instantly searchable',
          style: TextStyle(
              color: Colors.black54, fontFamily: "Co", fontSize: 16.0),
        ),
      ],
    ),
    mainImage: Image.asset(
      'assets/images/1.png',
      alignment: Alignment.center,
    ),
    textStyle: TextStyle(color: Colors.black),
  ),
  PageViewModel(
    pageColor: AppTheme.appSecondary,
    iconColor: null,
    bubbleBackgroundColor: AppTheme.appDark,
    title: Container(),
    body: Column(
      children: <Widget>[
        Text(
          'Proven Experts',
          style: TextStyle(fontFamily: "Co"),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'You can easily find the needed specialist with an advanced search',
          style: TextStyle(
              color: Colors.black54, fontSize: 16.0, fontFamily: "Co"),
        ),
      ],
    ),
    mainImage: Image.asset(
      'assets/images/2.png',
      alignment: Alignment.center,
    ),
    textStyle: TextStyle(
      color: Colors.black,
      fontFamily: "Co",
    ),
  ),
  PageViewModel(
    pageColor: AppTheme.appSecondary,
    iconColor: null,
    bubbleBackgroundColor: AppTheme.appDark,
    title: Container(),
    body: Column(
      children: <Widget>[
        Text(
          'All about your pet is here',
          style: TextStyle(fontFamily: "Co"),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'The application stores useful information about the pet and sends it to the vet',
          style: TextStyle(
              color: Colors.black54, fontFamily: "Co", fontSize: 16.0),
        ),
      ],
    ),
    mainImage: Image.asset(
      'assets/images/3.png',
      alignment: Alignment.center,
    ),
    textStyle: TextStyle(
      color: Colors.black,
      fontFamily: "Co",
    ),
  ),
];

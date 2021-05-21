import 'package:flutter/material.dart';

class GroomingPlaceWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: List<Widget>.generate(8, (int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 95,
            width: 95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/grooming.jpg"))),
          ),
        );
      }).toList(),
    );
  }
}

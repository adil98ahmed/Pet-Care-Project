import 'package:flutter/material.dart';
import 'package:pet_care/widgets/custom_raised_btn.dart';

class SpecialCard extends CustomRaisedButton {
  SpecialCard({
    @required String text,
    Color color,
    Color txtColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        super(
          child: Opacity(
            opacity: 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.alarm_rounded,
                  color: Colors.white,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: txtColor,
                      fontSize: 15.0,
                      fontFamily: "Co",
                      fontWeight: FontWeight.bold),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Icon(Icons.alarm_rounded),
                )
              ],
            ),
          ),
          color: color,
          onPressed: onPressed,
          borderRadius: 25.0,
        );
}

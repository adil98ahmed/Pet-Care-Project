import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'appointment-btn.dart';

class AppointmentPast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Icon(
            Icons.watch_later,
            size: 150,
            color: Colors.grey.shade200,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'No appointments yet',
            style:
                TextStyle(fontSize: 18, color: Colors.grey, fontFamily: 'Co'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: 50),
            child: AppointmentBtn(
              padding: EdgeInsets.symmetric(horizontal: 50),
              text: 'Find a specialist',
              color: AppTheme.appDark,
              txtColor: Colors.white,
              onPressed: () => print(1),
            ),
          ),
        ],
      ),
    );
  }
}

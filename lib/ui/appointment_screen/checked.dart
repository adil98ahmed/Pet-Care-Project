import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/ui/appointment_screen/appointment-btn.dart';
import 'package:pet_care/ui/appointment_screen/appointment-card.dart';

class AppointmentChecked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.kAppointmentCheckedBg,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 50,
              left: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/check.png',
                  height: 100,
                ),
                SizedBox(
                  height: 90,
                ),
                Text(
                  'Your appointment \n has been booked',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Co",
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Petrenko Julia will be waiting for you and your pet ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontFamily: "Co",
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SpecialCard(
                  text: 'Wed 17 Oct at 10:00 am',
                  txtColor: Colors.white,
                  onPressed: () {},
                  color: AppTheme.appDark,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    Text(
                      'Add appointment to calendar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontFamily: "Co",
                        fontSize: 15.0,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                AppointmentBtn(
                  text: 'Go to my appointments',
                  txtColor: Colors.white,
                  color: AppTheme.appPrimary,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

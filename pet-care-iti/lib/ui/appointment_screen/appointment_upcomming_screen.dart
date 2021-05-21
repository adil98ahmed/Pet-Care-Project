import 'package:flutter/material.dart';
import 'appointments_booking_card.dart';

class AppointmentUpcomming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return BookingCard();
        });
  }
}

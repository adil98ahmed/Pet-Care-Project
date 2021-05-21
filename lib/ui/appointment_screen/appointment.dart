import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/widgets/app_appBar.dart';

import 'appointment_past_screen.dart';
import 'appointment_upcomming_screen.dart';

class Appointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: AppTheme.bgMain,
        appBar: AppAppBar(
          title: 'Appointments',
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 45),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(50)),
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: AppTheme.headLine1Color,
                    indicator: BoxDecoration(
                      color: AppTheme.appDark,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepOrange.shade100,
                          blurRadius: 10.0,
                          spreadRadius: 1,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    tabs: [
                      Tab(
                        child: Text(
                          'Upcoming',
                          style: TextStyle(
                            fontFamily: 'Co',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Past',
                          style: TextStyle(
                            fontFamily: 'Co',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            AppointmentUpcomming(),
            AppointmentPast(),
          ],
        ),
      ),
    );
  }
}

// class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const AppAppBar({
//     Key key,
//   }) : preferredSize = const Size.fromHeight(60);

//   @override
//   final Size preferredSize;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(
//         'Appointments',
//         style: Theme.of(context).textTheme.headline2,
//       ),
//       backgroundColor: Colors.white,
//       elevation: 10,
//       shadowColor: Colors.black12,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.horizontal(
//           right: Radius.circular(30),
//           left: Radius.circular(30),
//         ),
//       ),
//       centerTitle: true,

//     );
//   }
// }

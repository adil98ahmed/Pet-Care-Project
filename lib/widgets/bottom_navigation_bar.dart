import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/ui/appointment_screen/appointment.dart';
import 'package:pet_care/ui/home/home_screen.dart';
import 'package:pet_care/ui/profile/profile_view.dart';

class BottomNav extends StatefulWidget {
  final user;

  const BottomNav({Key key, this.user}) : super(key: key);
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedBarItem = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeScreen(
        user: widget.user,
      ),
      Appointments(),
      ProfileView(
        user: widget.user,
      ),
    ];
    return Scaffold(
      backgroundColor: AppTheme.bgMain,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[50],
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _selectedBarItem = value;
          });
        },
        currentIndex: _selectedBarItem,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              title: Text(
                'Search',
                style: TextStyle(fontFamily: 'Co'),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.access_time_sharp,
              ),
              title: Text(
                'Appointments',
                style: TextStyle(fontFamily: 'Co'),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              title: Text(
                'Profile',
                style: TextStyle(fontFamily: 'Co'),
              )),
        ],
      ),
      body: _pages[_selectedBarItem],
    );
  }
}

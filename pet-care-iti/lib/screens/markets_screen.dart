import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/widgets/app_appBar.dart';
import 'package:pet_care/widgets/market_items.dart';

class Markets extends StatefulWidget {
  @override
  _MarketsState createState() => _MarketsState();
}

class _MarketsState extends State<Markets> {
  int _selectedBarItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgMain,
      appBar: AppAppBar(
        title: 'Markets',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            MarketItem(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_time_sharp,
            ),
            // activeIcon: Icon(Icons.access_time_sharp),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

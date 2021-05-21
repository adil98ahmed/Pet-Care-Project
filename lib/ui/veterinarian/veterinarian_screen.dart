import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/ui/veterinarian/specialists_screen.dart';
import 'package:pet_care/widgets/appBar.dart';
import 'package:pet_care/widgets/veterinarian_item.dart';

class VeterinarianView extends StatefulWidget {
  @override
  _VeterinarianViewState createState() => _VeterinarianViewState();
}

class _VeterinarianViewState extends State<VeterinarianView>
    with TickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(130),
      //     child: Stack(
      //       children: [
      //         AppBar(
      //           backgroundColor: Colors.white,
      //           leading: InkWell(
      //             onTap: () => Navigator.pop(context),
      //             child: Icon(
      //               Icons.arrow_back_rounded,
      //               color: Colors.grey,
      //             ),
      //           ),
      //           shadowColor: Colors.grey[300],
      //           shape: ContinuousRectangleBorder(
      //             borderRadius: BorderRadius.only(
      //                 bottomLeft: Radius.circular(80),
      //                 bottomRight: Radius.circular(80)),
      //           ),
      //           elevation: 0,
      //           actions: [
      //             Padding(
      //               padding: const EdgeInsets.only(right: 16),
      //               child: Row(
      //                 children: [
      //                   Icon(
      //                     Icons.location_on_outlined,
      //                     color: AppTheme.appDark,
      //                     size: 20,
      //                   ),
      //                   Text(
      //                     'Map',
      //                     style: TextStyle(
      //                       color: AppTheme.appDark,
      //                       fontFamily: 'Co',
      //                       fontSize: 14,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //           title: buildTabbar(),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(top: 100, right: 16, left: 16),
      //           child: Container(
      //             height: 40,
      //             child: TextField(
      //                 controller: TextEditingController(),
      //                 cursorColor: AppTheme.appDark,
      //                 style: TextStyle(
      //                   color: Colors.black87,
      //                   fontSize: 14.0,
      //                   fontFamily: 'Co',
      //                 ),
      //                 decoration: InputDecoration(
      //                     fillColor: Colors.grey[200],
      //                     filled: true,
      //                     contentPadding: EdgeInsets.symmetric(vertical: 5),
      //                     focusedBorder: OutlineInputBorder(
      //                         borderSide: BorderSide(
      //                       color: AppTheme.appDark,
      //                       width: 1.0,
      //                     )),
      //                     enabledBorder: OutlineInputBorder(
      //                         borderSide: BorderSide(
      //                       color: Colors.grey[200],
      //                       width: 1.0,
      //                     )),
      //                     hintText: 'Veterinarian',
      //                     hintStyle: TextStyle(
      //                       color: AppTheme.headLine1Color,
      //                       fontSize: 14.0,
      //                       fontFamily: 'Co',
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                     prefixIcon: Icon(
      //                       Icons.search,
      //                       color: AppTheme.headLine1Color,
      //                     ))),
      //           ),
      //         ),
      //       ],
      //     )),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.grey,
            ),
          ),
          evaluation: 0.5,
          title: "Pet Veterinarians",
        ),
      ),

      body: buildExpandedTabBarView(),
    );
  }

  buildTabbar() {
    return Container(
      height: 33,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff002E5F).withOpacity(0.14),
          ),
          borderRadius: BorderRadius.circular(50),
          color: Colors.white),
      child: TabBar(
          isScrollable: true,
          controller: controller,
          unselectedLabelColor: AppTheme.bgMain,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: AppTheme.appDark),
          tabs: [
            Tab(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 3),
                child: Text(
                  'Specialists',
                  style: TextStyle(
                    fontFamily: 'Co',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Tab(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 3),
                child: Text(
                  'Clinics',
                  style: TextStyle(
                    fontFamily: 'Co',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
    );
  }

  buildExpandedTabBarView() {
    return TabBarView(
      controller: controller,
      children: <Widget>[
        SpecialistScreen(),
        VeterinarianItem(),
      ],
    );
  }
}

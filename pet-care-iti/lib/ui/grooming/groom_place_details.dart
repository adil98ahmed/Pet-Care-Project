import 'package:flutter/material.dart';
import 'package:pet_care/models/petServicesModel.dart';
import 'package:pet_care/widgets/googleMap.dart';

class GroomPlaceDetails extends StatelessWidget {
  final PetServices petServices;

  const GroomPlaceDetails({Key key, this.petServices}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[200],
                        offset: Offset(5.0, 5.0),
                        blurRadius: 5,
                        spreadRadius: 5),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.grey[100],
                          child: Icon(
                            Icons.location_on_rounded,
                            color: Colors.grey[600],
                            size: 18,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            petServices.address,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontFamily: 'Co',
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        height: 170,
                        child: GoogleMapWidget(
                          petServices: petServices,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[200],
                        offset: Offset(5.0, 5.0),
                        blurRadius: 5,
                        spreadRadius: 5),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.grey[100],
                      child: Icon(
                        Icons.phone_android,
                        color: Colors.grey[600],
                        size: 18,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        petServices.phone,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontFamily: 'Co',
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[200],
                        offset: Offset(5.0, 5.0),
                        blurRadius: 5,
                        spreadRadius: 5),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.grey[100],
                      child: Icon(
                        Icons.alarm,
                        color: Colors.grey[600],
                        size: 18,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'Opens everyday from 12:00 Pm to 2:00 Am',
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontFamily: 'Co',
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

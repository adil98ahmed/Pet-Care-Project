import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_care/ui/appointment_screen/appointment-btn.dart';

class ShowBottomSheet extends StatefulWidget {
  @override
  _ShowBottomSheetState createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.bgMain,
        body: Builder(
          builder: (context) => Center(
            child: AppointmentBtn(
              text: 'See Available Time',
              txtColor: Colors.white,
              color: AppTheme.appPrimary,
              onPressed: () {
                setState(() {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 20,
                                    color: Colors.white,
                                    spreadRadius: 5)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Opacity(
                                    opacity: 0.0,
                                    child: Icon(Icons.alarm_rounded),
                                  ),
                                  Text(
                                    'Booking Information',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontFamily: "Co",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.close),
                                    color: AppTheme.appPrimary,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100.00,
                                    height: 100.00,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                        image: ExactAssetImage(
                                            'assets/images/cat.jpg'),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Petrenko Julia',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontFamily: "Co",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Veterinarian',
                                        style: TextStyle(
                                          color: AppTheme.appPrimary,
                                          fontSize: 15.0,
                                          fontFamily: "coRegCoular",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 15,
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          Text(
                                            '125 Ratings',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12.0,
                                              fontFamily: "Co",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.0,
                                      fontFamily: "Co",
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Wed 17 Oct ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontFamily: "Co",
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          //Show Calender
                                          Navigator.pop(context);
                                        },
                                        icon:
                                            const Icon(Icons.arrow_forward_ios),
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Chip(
                                      label: Text(
                                        '9:00',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontFamily: "Co",
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Chip(
                                      backgroundColor: Colors.grey[100],
                                      label: Text(
                                        '9:30',
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 18.0,
                                          fontFamily: "Co",
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Chip(
                                      backgroundColor: AppTheme.appPrimary,
                                      label: Text(
                                        '10:00',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: "Co",
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Chip(
                                      label: Text(
                                        '12:00',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontFamily: "Co",
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Chip(
                                      backgroundColor: Colors.grey[100],
                                      label: Text(
                                        '12:45',
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 18.0,
                                          fontFamily: "Co",
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Chip(
                                      label: Text(
                                        '13:00',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontFamily: "Co",
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Chip(
                                      label: Text(
                                        '15:30',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontFamily: "Co",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '\$20',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontFamily: "Co",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '/first visit',
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 15.0,
                                          fontFamily: "Co",
                                        ),
                                      ),
                                    ],
                                  ),
                                  AppointmentBtn(
                                    text: '        Book           ',
                                    txtColor: Colors.white,
                                    color: AppTheme.appPrimary,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                });
              },
            ),
          ),
        ));
  }
}

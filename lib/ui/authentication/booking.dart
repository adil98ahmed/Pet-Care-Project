import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_care/models/doctor_model.dart';
import 'package:pet_care/ui/authentication/authentication-provider.dart';
import 'package:pet_care/widgets/calender.dart';
import 'package:pet_care/widgets/googleMap.dart';
import 'package:provider/provider.dart';

class Booking extends StatefulWidget {
  final Doctor d;
  Booking(this.d);
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  Doctor doctor = Doctor();
  @override
  void initState() {
    doctor = widget.d;
    print("------****************-------------");
    print(doctor.toJson());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<AuthenticationProvider>(
      create: (context) => AuthenticationProvider(),
      child: Consumer<AuthenticationProvider>(
        builder: (context, authProv, child) => Stack(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .70,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        child: Container(
                            color: Color(0xFF2e2b43),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .55,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.network(
                                doctor.profilePic,
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                              ),
                            )),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .45,
                        left: 15,
                        right: 15,
                        child: Card(
                          elevation: 8,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.22,
                            child: ListView(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 20, 15, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${doctor.firstName}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Co',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 5),
                                            child: Text('${doctor.specialist}',
                                                style: TextStyle(
                                                    fontFamily: 'Co',
                                                    color: Color(0xFFc25e3c),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 5),
                                            child: Text(
                                              '${doctor.yearsOfExp} years of experience',
                                              style: TextStyle(
                                                  fontFamily: 'Co',
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.mobileAlt,
                                                color: Colors.black54,
                                              ),
                                              Text(
                                                "  \$ ${doctor.price}",
                                                style: TextStyle(
                                                  fontFamily: 'Co',
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Card(
                                            elevation: 8,
                                            color: Color(0xFFc25e3c),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 30, 20, 30),
                                              child: Text(
                                                doctor.rate.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Co',
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                          ),
                                          // Padding(
                                          //   padding: const EdgeInsets.fromLTRB(
                                          //       0, 10, 0, 0),
                                          //   child: Text(
                                          //     "${doctor.reviews.length} reviwes",
                                          //     style: TextStyle(
                                          //         fontSize: 10,
                                          //         fontWeight: FontWeight.bold),
                                          //   ),
                                          // )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Text(
                                  'a verified review ',
                                  style: TextStyle(
                                      color: Colors.black38, fontFamily: 'Co'),
                                ),
                              ),
                              RatingBar.builder(
                                onRatingUpdate: (ratig) {
                                  print(ratig);
                                },
                                itemCount: 5,
                                initialRating: doctor.rate + 2.0,
                                itemSize: 20,
                                itemBuilder: (context, _) {
                                  return Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 10,
                                  );
                                },
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(''),
                              Text(
                                'view all ${doctor.reviews.length} reviews',
                                style: TextStyle(
                                    color: Color(0xFFc25e3c),
                                    fontFamily: 'Co',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 3,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CalenderWidget(doctor),
                      ),
                    ),
                  ),
                ),
                Container(
                    height: 500,
                    width: 500,
                    child: GoogleMapWidget(doctor: doctor)),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

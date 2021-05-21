import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_care/widgets/googleMap.dart';

class PharmacyDetails extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<PharmacyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
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
                      child: Image.asset(
                        "assets/images/main_imgs/Pharmacy.jpg",
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
                          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pharmacy Name',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    child: Text('Location',
                                        style: TextStyle(
                                            color: Color(0xFFc25e3c),
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.mobileAlt,
                                        color: Colors.black54,
                                      ),
                                      Text(
                                        "  01159130853",
                                        style: TextStyle(
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
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 30, 20, 30),
                                      child: Text(
                                        "4.5",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      "125 reviwes",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
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
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(
                          'a verified review ',
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                      RatingBar.builder(
                        onRatingUpdate: (ratig) {
                          print(ratig);
                        },
                        itemCount: 5,
                        initialRating: 3,
                        itemSize: 20,
                        itemBuilder: (context, _) {
                          return Icon(
                            Icons.star,
                            color: Color(0xccc25e3c),
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
                        'view all 125 reviews',
                        style: TextStyle(
                            color: Color(0xFFc25e3c),
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
                child: Column(
                  children: [
                    //CalenderWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(height: 500, width: 500, child: GoogleMapWidget()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey))),
            child: Text(
              'Products',
              style: TextStyle(
                  color: Color(0xFFc25e3c),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .90,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Product Name',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "         20\$",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                            Text(
                              "\nsmall description about this product up to 150 char",
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: MediaQuery.of(context).size.width * .9,
                            height: 250,
                            child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset(
                                    "assets/images/main_imgs/pharmacy_product.jpg"))),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    ));
  }
}

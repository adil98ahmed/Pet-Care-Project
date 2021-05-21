import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_care/colors/style.dart';

import 'appointment-btn.dart';

class BookingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        shadowColor: Colors.black12,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://firebasestorage.googleapis.com/v0/b/pet-care-29230.appspot.com/o/doctors%2Fnabrawy.jpg?alt=media&token=bba15f99-6819-4a22-a236-4c494b12e6fe"))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ahmed Elnabrawy',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppTheme.headLine1Color,
                              fontFamily: 'Co',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Veterinarian',
                          style: TextStyle(
                              color: AppTheme.appDark,
                              fontFamily: 'Co',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            RatingBar(
                              initialRating: 4.7,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              ignoreGestures: true,
                              itemSize: 14,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                full: Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                half: Icon(
                                  Icons.star,
                                  color: Colors.black12,
                                ),
                                empty: Icon(
                                  Icons.star,
                                  color: Colors.black12,
                                ),
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '2 Reviews',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontFamily: 'Co',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 11,
                                      backgroundColor: Colors.grey[100],
                                      child: Center(
                                        child: Icon(
                                          Icons.payment_rounded,
                                          color: Colors.grey[600],
                                          size: 17,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '\$220',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontFamily: 'Co',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 140,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.wallet_travel,
                            size: 20,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Veterinary clinic "Alden-Vet"',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Co',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '141 N Union Ave, Los Angeles, CA',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Co',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.access_time_rounded,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Wed 9 Sep — 10:30 am',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Co',
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppointmentBtn(
                      onPressed: () => print(1),
                      text: 'Edit',
                      txtColor: Colors.white,
                      color: AppTheme.appDark,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: AppointmentBtn(
                      onPressed: () => print(1),
                      text: 'Cancel',
                      txtColor: AppTheme.headLine1Color,
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

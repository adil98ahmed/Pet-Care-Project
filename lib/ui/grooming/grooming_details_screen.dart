import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/models/petServicesModel.dart';
import 'package:pet_care/models/user_model.dart';
import 'package:pet_care/ui/grooming/groom_place_details.dart';
import 'package:pet_care/ui/grooming/grooming_provider.dart';
import 'package:pet_care/ui/grooming/pet_groom_service.dart';
import 'package:pet_care/ui/grooming/review_screen.dart';
import 'package:pet_care/widgets/auth_input_widget.dart';
import 'package:provider/provider.dart';

class GroomingDetailScreen extends StatefulWidget {
  final PetServices petService;
  final UserModel currentUser;

  const GroomingDetailScreen({Key key, this.petService, this.currentUser})
      : super(key: key);
  @override
  _GroomingDetailScreenState createState() => _GroomingDetailScreenState();
}

class _GroomingDetailScreenState extends State<GroomingDetailScreen>
    with TickerProviderStateMixin {
  TextEditingController reviewController = TextEditingController();
  TabController controller;
  double rate;
  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => PetGroomingProvider(),
        child: Consumer<PetGroomingProvider>(
          builder: (context, groomingProv, _) => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .59,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        child: Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .48,
                            child: Image.network(
                              widget.petService.picture,
                              fit: BoxFit.cover,
                            )),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .39,
                        left: 10,
                        right: 10,
                        child: Card(
                          elevation: 3,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.petService.name,
                                    style: TextStyle(
                                        color: AppTheme.headLine1Color,
                                        fontFamily: 'Co',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.petService.serviceName ==
                                                'grooming'
                                            ? 'Pet Groomer'
                                            : widget.petService.serviceName ==
                                                    'training'
                                                ? 'Pet Trainer'
                                                : widget.petService
                                                            .serviceName ==
                                                        'pharmacy'
                                                    ? 'Pet Pharmacy'
                                                    : 'Pet Store',
                                        style: TextStyle(
                                            color: AppTheme.appDark,
                                            fontFamily: 'Co',
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Expanded(
                                        child: Text(
                                          widget.petService.address,
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
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          RatingBar(
                                            initialRating:
                                                widget.petService.rate,
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
                                            widget.petService.reviews.length
                                                    .toString() +
                                                ' Reviews',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontFamily: 'Co',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            showModalBottomSheet(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                backgroundColor: Colors.white,
                                                context: context,
                                                builder: (context) {
                                                  return Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        30),
                                                                topRight: Radius
                                                                    .circular(
                                                                        30)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              blurRadius: 20,
                                                              color:
                                                                  Colors.white,
                                                              spreadRadius: 5)
                                                        ]),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Opacity(
                                                              opacity: 0.0,
                                                              child: Icon(Icons
                                                                  .alarm_rounded),
                                                            ),
                                                            Text(
                                                              'Add Review',
                                                              style: TextStyle(
                                                                  color: AppTheme
                                                                      .headLine1Color,
                                                                  fontSize:
                                                                      20.0,
                                                                  fontFamily:
                                                                      "Co",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            IconButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              icon: const Icon(
                                                                  Icons.close),
                                                              color: AppTheme
                                                                  .appDark,
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 25,
                                                        ),
                                                        RatingBar(
                                                          initialRating: 0,
                                                          direction:
                                                              Axis.horizontal,
                                                          allowHalfRating: true,
                                                          itemSize: 50,
                                                          itemCount: 5,
                                                          ratingWidget:
                                                              RatingWidget(
                                                            full: Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            half: Icon(
                                                              Icons.star,
                                                              color: Colors
                                                                  .black12,
                                                            ),
                                                            empty: Icon(
                                                              Icons.star,
                                                              color: Colors
                                                                  .black12,
                                                            ),
                                                          ),
                                                          onRatingUpdate:
                                                              (rating) {
                                                            print(rating);
                                                            rate = rating;
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        AuthInput(
                                                          controller:
                                                              reviewController,
                                                          suffixIcon: Icon(
                                                            Icons.star_border,
                                                            color: Colors.grey,
                                                          ),
                                                          label: "Review",
                                                        ),
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Review review = Review(
                                                                review:
                                                                    reviewController
                                                                        .text,
                                                                rate: rate,
                                                                userImg: widget
                                                                    .currentUser
                                                                    .img,
                                                                userName: widget
                                                                    .currentUser
                                                                    .name);
                                                            groomingProv.addReview(
                                                                widget
                                                                    .petService,
                                                                review,
                                                                widget
                                                                    .petService
                                                                    .serviceName,
                                                                widget
                                                                    .petService
                                                                    .id);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            height: 50,
                                                            width: 250,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppTheme
                                                                  .appDark,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                'Add',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Co'),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                });
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: AppTheme.appDark,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 11,
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 17,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Add Review',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Co',
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                buildTabbar(),
                buildExpandedTabBarView()
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildTabbar() {
    return Container(
      height: 33,
      child: TabBar(
          indicatorWeight: 2.5,
          labelColor: AppTheme.headLine1Color,
          indicatorColor: AppTheme.appDark,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Co',
            fontSize: 14,
          ),
          isScrollable: true,
          controller: controller,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(
              child: Text(
                'Reviews',
              ),
            ),
            Tab(
              child: Text(
                widget.petService.serviceName == 'grooming'
                    ? 'Services'
                    : widget.petService.serviceName == 'training'
                        ? 'Services'
                        : widget.petService.serviceName == 'pharmacy'
                            ? 'Products'
                            : 'Products',
              ),
            ),
            Tab(
              child: Text(
                'Details',
              ),
            ),
          ]),
    );
  }

  buildExpandedTabBarView() {
    return Container(
      height: 330,
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: <Widget>[
          ReviewScreen(
            reviews: widget.petService.reviews,
          ),
          PetGroomService(
            petServices: widget.petService.services,
            role: widget.petService.serviceName,
          ),
          GroomPlaceDetails(
            petServices: widget.petService,
          ),
        ],
      ),
    );
  }
}

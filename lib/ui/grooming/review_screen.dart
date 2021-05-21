import 'package:flutter/material.dart';
import 'package:pet_care/widgets/review_widget.dart';
import 'package:pet_care/models/petServicesModel.dart';

class ReviewScreen extends StatefulWidget {
  final List<Review> reviews;

  const ReviewScreen({Key key, this.reviews}) : super(key: key);
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.reviews.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return ReviewWidget(
            review: widget.reviews[index],
          );
        });
  }
}

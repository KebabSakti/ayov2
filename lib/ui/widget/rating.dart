import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  final double initialRating;
  final double itemSize;
  final bool ignoreGestures;
  final EdgeInsets itemPadding;
  final Function onRatingUpdate;

  Rating(
    this.initialRating, {
    this.itemSize = 12,
    this.ignoreGestures = true,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 2.0),
    this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: initialRating,
      itemSize: itemSize,
      allowHalfRating: true,
      ignoreGestures: ignoreGestures,
      itemPadding: itemPadding,
      ratingWidget: RatingWidget(
        empty: Icon(
          Icons.star_rounded,
          color: Colors.grey,
        ),
        half: Icon(
          Icons.star_half_rounded,
          color: Colors.amber,
        ),
        full: Icon(
          Icons.star_rounded,
          color: Colors.amber,
        ),
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}

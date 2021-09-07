import 'package:ayov2/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyData extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;

  EmptyData({this.mainAxisAlignment = MainAxisAlignment.center});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        SvgPicture.asset(
          NO_DATA,
          width: 200,
        ),
        SizedBox(height: 20),
        Text(
          NO_DATA_MESSAGE,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

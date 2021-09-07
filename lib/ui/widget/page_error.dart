import 'package:ayov2/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageError extends StatelessWidget {
  final VoidCallback onPressed;
  final MainAxisAlignment mainAxisAlignment;

  PageError(
      {@required this.onPressed,
      this.mainAxisAlignment = MainAxisAlignment.center});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        SvgPicture.asset(
          ERROR,
          width: 300,
        ),
        SizedBox(height: 20),
        Text(
          ERROR_MESSAGE,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 10),
        FlatButton(
          color: Colors.redAccent,
          child: Text('Coba Lagi'),
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: onPressed,
        )
      ],
    );
  }
}

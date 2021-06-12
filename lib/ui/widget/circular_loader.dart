import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  final double height;
  final double width;
  final double strokeWidth;
  final Color backgroundColor;
  final Color circularColor;

  CircularLoader({
    this.height = 30,
    this.width = 30,
    this.strokeWidth = 3,
    this.backgroundColor,
    this.circularColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        strokeWidth: 3,
        backgroundColor: backgroundColor ?? Colors.grey[100],
        valueColor: AlwaysStoppedAnimation<Color>(
            circularColor ?? Theme.of(context).primaryColor),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProductDeliveryType extends StatelessWidget {
  final String name;
  final Color color;

  ProductDeliveryType({
    @required this.name,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1,
          color: color,
        ),
      ),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 8,
          color: color,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

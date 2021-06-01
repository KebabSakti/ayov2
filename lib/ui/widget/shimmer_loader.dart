import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  final double radius;
  final double width;
  final double height;

  ShimmerLoader({
    this.radius = 0,
    this.width = double.infinity,
    this.height = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: Shimmer.fromColors(
        period: Duration(
          milliseconds: 700,
        ),
        baseColor: Colors.grey[200],
        highlightColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
        ),
      ),
    );
  }
}

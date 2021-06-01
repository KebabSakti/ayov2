import 'package:flutter/material.dart';

class StaticSearchField extends StatelessWidget {
  final double borderRadius;
  final Color color;
  final String text;
  final Function onTap;

  StaticSearchField({
    this.borderRadius = 20,
    this.text = 'Cari di sini',
    this.color,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          color: color ?? Colors.grey[50],
          height: 35,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: Colors.grey[400],
                size: 20,
              ),
              SizedBox(width: 4),
              Text(
                text,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

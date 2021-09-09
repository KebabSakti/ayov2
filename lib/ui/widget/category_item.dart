import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  final Widget icon;
  final String name;
  final VoidCallback onTap;

  CategoryItem({
    @required this.icon,
    @required this.name,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(25),
          child: Ink(
            width: (Get.size.width - 50) / 4,
            height: (Get.size.width - 50) / 4,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(25),
            ),
            child: icon,
          ),
          onTap: onTap,
        ),
        SizedBox(height: 6),
        Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}

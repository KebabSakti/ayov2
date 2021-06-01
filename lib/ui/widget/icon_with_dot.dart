import 'package:flutter/material.dart';

class IconWithDot extends StatelessWidget {
  final Icon icon;
  final bool showDot;

  IconWithDot({@required this.icon, this.showDot = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        icon,
        (showDot)
            ? Positioned(
                right: 0,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}

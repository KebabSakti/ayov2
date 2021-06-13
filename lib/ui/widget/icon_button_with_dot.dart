import 'package:flutter/material.dart';

class IconButtonWithDot extends StatelessWidget {
  final Icon icon;
  final int value;
  final VoidCallback onPressed;

  IconButtonWithDot(
    this.icon, {
    this.value = 0,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    String mValue = (value <= 99) ? '$value' : '99';
    return IconButton(
      onPressed: onPressed,
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.all(0),
      iconSize: 30,
      icon: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: icon,
          ),
          (value == 0)
              ? SizedBox.shrink()
              : Positioned(
                  right: 4,
                  top: 15,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Center(
                      child: Text(
                        '$mValue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

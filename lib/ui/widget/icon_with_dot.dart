import 'package:flutter/material.dart';

class IconWithDot extends StatelessWidget {
  final Icon icon;
  final int value;

  IconWithDot(
    this.icon, {
    this.value = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: icon,
        ),
        (value > 0)
            ? Positioned(
                right: 20,
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
                      '$value',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}

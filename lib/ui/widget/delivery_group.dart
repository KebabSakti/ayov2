import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/util.dart';
import 'package:flutter/material.dart';

class DeliveryGroup extends StatelessWidget {
  final Color color;
  final VoidCallback helpButton;
  final VoidCallback timeButton;
  final String name;
  final String distance;
  final String price;
  final String time;

  DeliveryGroup({
    @required this.color,
    @required this.helpButton,
    @required this.name,
    @required this.distance,
    @required this.price,
    @required this.time,
    this.timeButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductDeliveryType(
                color: color,
                name: name,
              ),
              GestureDetector(
                child: Icon(
                  Icons.help_rounded,
                  color: Colors.grey[600],
                  size: 20,
                ),
                onTap: helpButton,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jarak',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                distance,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ongkir',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                Utility().currency(price),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jam Kirim',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4),
                  (timeButton == null)
                      ? SizedBox.shrink()
                      : GestureDetector(
                          onTap: () {},
                          child: Text(
                            'ubah',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

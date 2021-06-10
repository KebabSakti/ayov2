import 'package:ayov2/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScannerPointBar extends StatelessWidget {
  final VoidCallback onQrTap;
  final VoidCallback onCoinTap;
  final int coin;

  ScannerPointBar({
    @required this.onQrTap,
    @required this.onCoinTap,
    this.coin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Ink(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.grey[200]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: onQrTap,
                  icon: SvgPicture.asset(QR_ICON, width: 20),
                ),
                Text(
                  'scan qr',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '$coin',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.amber,
                  ),
                ),
                IconButton(
                  onPressed: onCoinTap,
                  icon: SvgPicture.asset(COIN_ICON, width: 25),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

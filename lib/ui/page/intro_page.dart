import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IntroPage extends GetView<IntroPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SvgPicture.asset(
                LOGO,
                width: 130,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularLoader(
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text('Lagi siap-siap..')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: PageError(
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}

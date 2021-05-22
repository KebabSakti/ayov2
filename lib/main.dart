import 'package:ayov2/config/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx/getx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      theme: appTheme,
      initialRoute: '/',
      initialBinding: GlobalBinding(),
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
      showPerformanceOverlay: false,
      getPages: AppRoute.routes,
    );
  }
}

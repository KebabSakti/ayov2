import 'package:ayov2/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomePageController _homePageController = Get.find();
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('LOGOUT'),
          onPressed: _homePageController.signOutButton,
        ),
      ),
    );
  }
}

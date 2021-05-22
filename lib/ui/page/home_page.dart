import 'package:ayov2/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () async {
                  await controller.linkToFacebookAuth();
                },
                child: Text('Link to facebook'),
              ),
              RaisedButton(
                onPressed: () {
                  controller.signOutButton();
                },
                child: Text('Logout'),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Show Dialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

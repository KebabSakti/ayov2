import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AyoDialog {
  void close() {
    if (Get.isDialogOpen) Get.back();
  }

  void loading({String text = "Loading..", bool dismissible = false}) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async {
          if (dismissible) Get.back();
          return false;
        },
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Row(
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
              SizedBox(width: 20),
              Text(
                text,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: dismissible,
    );
  }

  void error(
    String text, {
    String buttonText = '',
    VoidCallback onPressed,
    bool dismissible = false,
  }) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async {
          if (dismissible) Get.back();
          return false;
        },
        child: AlertDialog(
          titlePadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.solidTimesCircle,
                    color: Colors.white,
                    size: 60,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Error',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          content: Container(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                (onPressed != null)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlatButton(
                              onPressed: onPressed,
                              color: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                buttonText,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: dismissible,
    );
  }

  void success(
    String text, {
    String buttonText = '',
    VoidCallback onPressed,
    bool dismissible = false,
  }) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async {
          if (dismissible) Get.back();
          return false;
        },
        child: AlertDialog(
          titlePadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.solidCheckCircle,
                    color: Colors.white,
                    size: 60,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Success',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          content: Container(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                (onPressed != null)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlatButton(
                              onPressed: onPressed,
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                buttonText,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: dismissible,
    );
  }

  void show(
    String text, {
    String buttonText = '',
    String headingText = '',
    Color color,
    IconData headingIcon,
    bool dismissible = false,
    Function onPressed,
  }) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async {
          if (dismissible) Get.back();
          return false;
        },
        child: AlertDialog(
          titlePadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    headingIcon,
                    color: Colors.white,
                    size: 60,
                  ),
                  SizedBox(height: 10),
                  Text(
                    headingText,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          content: Container(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                (onPressed != null)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlatButton(
                              onPressed: onPressed,
                              color: color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                buttonText,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: dismissible,
    );
  }
}

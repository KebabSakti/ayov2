import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Fcm {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Future registerNotificationChannel() async {
    MethodChannel _channel =
        MethodChannel('com.ayobelanja.ayov2/default_channel');

    Map<String, String> _channelMap = {
      "id": "DEFAULT_NOTIFICATION_CHANNEL",
      "name": "Default Notification",
      "description": "Handle all notification in the app",
    };

    try {
      await _channel.invokeMethod('createNotificationChannel', _channelMap);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<String> token() async {
    return await _firebaseMessaging.getToken();
  }

  void handleMessageEvent({
    @required Function onMessage,
    @required Function onLaunch,
    @required Function onResume,
  }) async {
    _firebaseMessaging.configure(
      onMessage: onMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }
}

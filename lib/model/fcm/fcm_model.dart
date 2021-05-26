enum FcmEvent { onMessage, onLaunch, onResume }

class FcmModel {
  FcmEvent event;
  Map<String, dynamic> payload;

  FcmModel({this.event, this.payload});
}

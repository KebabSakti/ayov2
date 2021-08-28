import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DeliveryDetailPageController extends GetxController {
  final PanelController panelController = PanelController();
  final Completer<GoogleMapController> _completer = Completer();

  LatLng _myLocation =
      LatLng(-0.49732531314209866, 117.14187383609166); //Samarinda
  GoogleMapController _mapController;

  void onCameraMoveStarted() {
    panelController.close();
  }

  void onCameraMove(CameraPosition cameraPosition) {}

  void onCameraIdle() {
    panelController.open();
  }

  void onMapCreated(GoogleMapController controller) async {
    _completer.complete(controller);

    _mapController = await _completer.future;

    _deviceLocation();
  }

  void _deviceLocation() async {
    Position _position = await Geolocator.getCurrentPosition();

    LatLng _newPosition = LatLng(
      _position.latitude,
      _position.longitude,
    );

    CameraPosition _cameraPosition = CameraPosition(
      target: _newPosition,
      zoom: 16,
    );

    _mapController
        ?.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));

    _myLocation = _newPosition;
  }

  void deviceLocationButton() {
    _deviceLocation();
  }

  CameraPosition initialCamera() {
    return CameraPosition(target: _myLocation, zoom: 12.0);
  }
}

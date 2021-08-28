import 'package:ayov2/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DeliveryDetailPage extends GetView<DeliveryDetailPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.grey[700],
        ),
        actions: [
          IconButton(
            onPressed: controller.deviceLocationButton,
            icon: Icon(
              Icons.my_location_rounded,
              color: Colors.blue,
              size: 25,
            ),
          ),
        ],
      ),
      body: SlidingUpPanel(
        controller: controller.panelController,
        parallaxEnabled: true,
        minHeight: Get.size.height * 0.2,
        maxHeight: Get.size.height * 0.5,
        header: Container(
          width: Get.size.width,
          alignment: Alignment.center,
          child: Icon(
            Icons.drag_handle_rounded,
            color: Colors.grey[400],
            size: 30,
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        body: Stack(
          children: [
            GoogleMap(
              mapToolbarEnabled: false,
              rotateGesturesEnabled: false,
              tiltGesturesEnabled: false,
              zoomControlsEnabled: false,
              compassEnabled: false,
              initialCameraPosition: controller.initialCamera(),
              onCameraMoveStarted: controller.onCameraMoveStarted,
              onCameraMove: controller.onCameraMove,
              onCameraIdle: controller.onCameraIdle,
              onMapCreated: controller.onMapCreated,
            ),
            Center(
              child: ClipOval(
                child: Container(
                  height: 10,
                  width: 10,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
            ),
            Center(
              child: Transform.translate(
                offset: Offset(0, -12),
                child: Icon(
                  Icons.place_rounded,
                  color: Colors.redAccent,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        panel: Container(
          child: Center(
            child: Text('PANEL'),
          ),
        ),
      ),
    );
  }
}

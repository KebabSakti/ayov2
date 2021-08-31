import 'package:ayov2/getx/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapPage extends GetView<MapPageController> {
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
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SizedBox.fromSize(
              size: Size(35, 35),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(
                    Icons.my_location_rounded,
                    color: Colors.grey[700],
                    size: 20,
                  ),
                  onPressed: controller.deviceLocationButton,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SlidingUpPanel(
        controller: controller.panelController,
        parallaxEnabled: true,
        // parallaxOffset: 0.5,
        minHeight: Get.size.height * 0.25,
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
              padding: EdgeInsets.only(bottom: Get.size.height * 0.2),
              mapToolbarEnabled: false,
              rotateGesturesEnabled: false,
              tiltGesturesEnabled: false,
              zoomControlsEnabled: false,
              compassEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
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
        panel: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            children: [
              Container(
                height: (Get.size.height * 0.25) - 30,
                width: double.infinity,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

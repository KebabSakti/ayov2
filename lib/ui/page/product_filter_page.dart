import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductFilterPage extends GetView<ProductFilterPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pilihan'),
        actions: [
          IconButton(
            onPressed: () {
              controller.filterModel(ProductFilterModel());
            },
            icon: Icon(FontAwesomeIcons.timesCircle),
          ),
        ],
      ),
      body: Obx(() {
        return ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
              title: Text(
                'Paling laris',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: SizedBox(
                width: 50.0,
                height: 25.0,
                child: FlutterSwitch(
                  width: 50.0,
                  height: 25.0,
                  toggleSize: 20.0,
                  borderRadius: 30.0,
                  showOnOff: false,
                  activeColor: Colors.green,
                  value: controller.filterModel.value.highSell,
                  onToggle: (value) {
                    controller.filterModel(
                        controller.filterModel.value.copyWith(highSell: value));
                  },
                ),
              ),
            ),
            Divider(height: 1),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
              title: Text(
                'Lagi diskon',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: SizedBox(
                width: 50.0,
                height: 25.0,
                child: FlutterSwitch(
                  width: 50.0,
                  height: 25.0,
                  toggleSize: 20.0,
                  borderRadius: 30.0,
                  showOnOff: false,
                  activeColor: Colors.green,
                  value: controller.filterModel.value.discount,
                  onToggle: (value) {
                    controller.filterModel(
                        controller.filterModel.value.copyWith(discount: value));
                  },
                ),
              ),
            ),
            Divider(height: 1),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
              title: Text(
                'Trending',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: SizedBox(
                width: 50.0,
                height: 25.0,
                child: FlutterSwitch(
                  width: 50.0,
                  height: 25.0,
                  toggleSize: 20.0,
                  borderRadius: 30.0,
                  showOnOff: false,
                  activeColor: Colors.green,
                  value: controller.filterModel.value.highView,
                  onToggle: (value) {
                    controller.filterModel(
                        controller.filterModel.value.copyWith(highView: value));
                  },
                ),
              ),
            ),
            Divider(height: 1),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
              title: Text(
                'Popular',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: SizedBox(
                width: 50.0,
                height: 25.0,
                child: FlutterSwitch(
                  width: 50.0,
                  height: 25.0,
                  toggleSize: 20.0,
                  value: controller.filterModel.value.highSearch,
                  borderRadius: 30.0,
                  showOnOff: false,
                  activeColor: Colors.green,
                  onToggle: (value) {
                    controller.filterModel(controller.filterModel.value
                        .copyWith(highSearch: value));
                  },
                ),
              ),
            ),
            Divider(height: 1),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amber,
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '4 ke atas',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              trailing: SizedBox(
                width: 50.0,
                height: 25.0,
                child: FlutterSwitch(
                  width: 50.0,
                  height: 25.0,
                  toggleSize: 20.0,
                  borderRadius: 30.0,
                  showOnOff: false,
                  activeColor: Colors.green,
                  value: controller.filterModel.value.highRatingValue,
                  onToggle: (value) {
                    controller.filterModel(controller.filterModel.value
                        .copyWith(highRatingValue: value));
                  },
                ),
              ),
            ),
            Divider(height: 1),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
              title: Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.amber,
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Banyak Poin',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              trailing: SizedBox(
                width: 50.0,
                height: 25.0,
                child: FlutterSwitch(
                  width: 50.0,
                  height: 25.0,
                  toggleSize: 20.0,
                  borderRadius: 30.0,
                  showOnOff: false,
                  activeColor: Colors.green,
                  value: controller.filterModel.value.highPoint,
                  onToggle: (value) {
                    controller.filterModel(controller.filterModel.value
                        .copyWith(highPoint: value));
                  },
                ),
              ),
            ),
            Divider(height: 1),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              title: Text(
                'Jenis Pengiriman',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Wrap(
                  spacing: 10,
                  children: [
                    ProductFilterItem(
                      child: Text(
                        'LANGSUNG',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      selected: (controller.filterModel.value.deliveryType ==
                          'LANGSUNG'),
                      onSelected: (value) {
                        controller.filterModel(controller.filterModel.value
                            .copyWith(
                                deliveryType: (controller
                                            .filterModel.value.deliveryType ==
                                        'LANGSUNG')
                                    ? ''
                                    : 'LANGSUNG'));
                      },
                    ),
                    ProductFilterItem(
                      child: Text(
                        'TERJADWAL',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      selected: (controller.filterModel.value.deliveryType ==
                          'TERJADWAL'),
                      onSelected: (value) {
                        controller.filterModel(controller.filterModel.value
                            .copyWith(
                                deliveryType: (controller
                                            .filterModel.value.deliveryType ==
                                        'TERJADWAL')
                                    ? ''
                                    : 'TERJADWAL'));
                      },
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 1),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              title: Text(
                'Urutkan',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Wrap(
                  spacing: 10,
                  children: [
                    ProductFilterItem(
                      child: Text(
                        'Harga Termurah',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      selected:
                          (controller.filterModel.value.productPrice == 'asc'),
                      onSelected: (value) {
                        controller.filterModel(controller.filterModel.value
                            .copyWith(
                                productPrice: (controller
                                            .filterModel.value.productPrice ==
                                        'asc')
                                    ? ''
                                    : 'asc'));
                      },
                    ),
                    ProductFilterItem(
                      child: Text(
                        'Harga Termahal',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      selected:
                          (controller.filterModel.value.productPrice == 'desc'),
                      onSelected: (value) {
                        controller.filterModel(controller.filterModel.value
                            .copyWith(
                                productPrice: (controller
                                            .filterModel.value.productPrice ==
                                        'desc')
                                    ? ''
                                    : 'desc'));
                      },
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 1),
            Padding(
              padding: EdgeInsets.all(15),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: FlatButton(
                  onPressed: controller.back,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'Tampilkan Produk',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProductViewSection extends StatelessWidget {
  final SearchPageController controller;

  SearchProductViewSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Terakhir dilihat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 18),
        SizedBox(
          height: 60,
          child: Obx(() {
            return ListView.builder(
              itemCount: (controller.loadingPage.value)
                  ? 5
                  : controller.searchPageModel.value.productViews.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                //loading
                if (controller.loadingPage.value) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: (index >= 0 && index != 4) ? 10 : 0,
                    ),
                    child: ShimmerLoader(
                      radius: 10,
                      width: (Get.size.width - 30) / 5,
                    ),
                  );
                }

                //if record exist
                if (controller.searchPageModel.value.productViews.length > 0) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: (index >= 0 &&
                              index !=
                                  (controller.searchPageModel.value.productViews
                                          .length -
                                      1))
                          ? 10
                          : 0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: controller.searchPageModel.value
                            .productViews[index].productCover,
                        fit: BoxFit.cover,
                        width: (Get.size.width - 30) / 5,
                        height: 60,
                      ),
                    ),
                  );
                }

                //default empty
                return (index == 0)
                    ? Text('Tidak ada data')
                    : SizedBox.shrink();
              },
            );
          }),
        ),
      ],
    );
  }
}

import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePopularProductSection extends StatelessWidget {
  final HomePageController controller;

  HomePopularProductSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SectionHeading(
              heading: 'Paling Laris',
              onPressed: () {
                controller
                    .routeToProductPage(ProductFilterModel(highSell: true));
              },
            ),
            SizedBox(height: 15),
            Obx(() {
              return SizedBox(
                height: 280,
                child: ListView.builder(
                  itemCount: (controller.loading.value)
                      ? 2
                      : controller.homePageModel.productPopularModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return (controller.loading.value)
                        ? Padding(
                            padding: EdgeInsets.only(
                              right: (index >= 0 && index != 1) ? 10 : 0,
                            ),
                            child: ShimmerLoader(
                              radius: 15,
                              width: (Get.size.width - 40) / 2,
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                              right: (index >= 0 &&
                                      index !=
                                          (controller.homePageModel
                                                  .productPopularModel.length -
                                              1))
                                  ? 10
                                  : 0,
                            ),
                            child: ProductItem(
                              onTap: () {
                                controller.routeToProductDetailPage(controller
                                    .homePageModel.productPopularModel[index]);
                              },
                              product: controller
                                  .homePageModel.productPopularModel[index],
                            ),
                          );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

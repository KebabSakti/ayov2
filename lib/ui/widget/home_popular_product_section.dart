import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
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
              StateModel<HomePageModel> home = controller.home();

              if (home.state == States.loading) {
                return SizedBox(
                  height: 280,
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: (index >= 0 && index != 1) ? 10 : 0,
                        ),
                        child: ShimmerLoader(
                          radius: 15,
                          width: (Get.size.width - 70) / 2,
                        ),
                      );
                    },
                  ),
                );
              }

              if (home.data.productPopularModel.length > 0) {
                List<ProductModel> products = home.data.productPopularModel;

                return SizedBox(
                  height: 280,
                  child: ListView.builder(
                    itemCount: products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: (index >= 0 && index != (products.length - 1))
                              ? 10
                              : 0,
                        ),
                        child: ProductItem(
                          onTap: () {
                            controller
                                .routeToProductDetailPage(products[index]);
                          },
                          product: products[index],
                        ),
                      );
                    },
                  ),
                );
              }

              return SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}

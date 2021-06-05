import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';

class HomeProductSection extends StatelessWidget {
  final HomePageController controller;

  HomeProductSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 10.0;
    var _mainAxisSpacing = 10.0;
    var _screenWidth = Get.size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var _cellHeight = 510 / 2;
    var _aspectRatio = _width / _cellHeight;

    return SliverStickyHeader(
      header: Material(
        color: Colors.white,
        child: SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ProductFilter(productFilterModel: controller.filterModel),
            )),
      ),
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: Obx(() {
              return Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: (controller.loading.value ||
                            controller.loadingFilter.value)
                        ? 2
                        : controller.productPaginate.value.products.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _crossAxisCount,
                      crossAxisSpacing: _crossAxisSpacing,
                      mainAxisSpacing: _mainAxisSpacing,
                      childAspectRatio: _aspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      return (controller.loading.value ||
                              controller.loadingFilter.value)
                          ? ShimmerLoader(radius: 15)
                          : ProductItem(
                              onTap: () {},
                              product: controller
                                  .productPaginate.value.products[index],
                            );
                    },
                  ),
                  (!controller.loadingPagination.value)
                      ? SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Center(
                            child: Text('Loading..'),
                          ),
                        ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

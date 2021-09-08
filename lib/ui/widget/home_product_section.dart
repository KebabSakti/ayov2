import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
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
    var _cellHeight = 620 / 2;
    var _aspectRatio = _width / _cellHeight;

    return SliverStickyHeader(
      header: Material(
        color: Colors.white,
        child: SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ProductFilter(
                productFilterModel: controller.filterModel,
                onFilterTap: controller.routeToFilterPage,
              ),
            )),
      ),
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: Obx(() {
              final StateModel<ProductPaginateModel> product =
                  controller.product();

              if (product.state == States.loading) {
                return Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _crossAxisCount,
                        crossAxisSpacing: _crossAxisSpacing,
                        mainAxisSpacing: _mainAxisSpacing,
                        childAspectRatio: _aspectRatio,
                      ),
                      itemBuilder: (context, index) {
                        return ShimmerLoader(radius: 15);
                      },
                    ),
                  ],
                );
              }

              if (product.state == States.empty) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: EmptyData(),
                );
              }

              if (product.state == States.error) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: PageError(
                    onPressed: () {},
                  ),
                );
              }

              if (product.data.products.length > 0) {
                List<ProductModel> products = product.data.products;

                return Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _crossAxisCount,
                        crossAxisSpacing: _crossAxisSpacing,
                        mainAxisSpacing: _mainAxisSpacing,
                        childAspectRatio: _aspectRatio,
                      ),
                      itemBuilder: (context, index) {
                        return ProductItem(
                          onTap: () {
                            controller
                                .routeToProductDetailPage(products[index]);
                          },
                          product: products[index],
                        );
                      },
                    ),
                    (product.state == States.paging)
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: CircularLoader(),
                          )
                        : SizedBox.shrink(),
                  ],
                );
              }

              return SizedBox.shrink();
            }),
          ),
        ),
      ),
    );
  }
}

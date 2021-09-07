import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:ayov2/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';

class ProductPage extends GetWidget<ProductPageController> {
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

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 30,
            padding: EdgeInsets.only(left: 8),
            visualDensity: VisualDensity.compact,
            icon: IconWithDot(
              Icon(Icons.shopping_bag_rounded),
            ),
          ),
          IconButton(
            onPressed: () {},
            iconSize: 30,
            padding: EdgeInsets.only(right: 8, left: 0),
            icon: IconWithDot(
              Icon(Icons.account_circle_rounded),
            ),
          ),
        ],
        title: StaticSearchField(
          onTap: controller.routeToSearchPage,
          text: controller.filterModel.value.keyword ?? 'mau belanja apa kak ?',
        ),
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              controller.loadFilteredProduct();
            },
            child: CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverStickyHeader(
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
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: Obx(() {
                          if (controller.pageState().state == States.loading) {
                            return GridView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: _crossAxisCount,
                                crossAxisSpacing: _crossAxisSpacing,
                                mainAxisSpacing: _mainAxisSpacing,
                                childAspectRatio: _aspectRatio,
                              ),
                              itemBuilder: (context, index) {
                                return ShimmerLoader(radius: 15);
                              },
                            );
                          }

                          if (controller.pageState().state == States.empty) {
                            return Container(
                              height: Get.size.height - 150,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: EmptyData(),
                            );
                          }

                          if (controller.pageState().state == States.error) {
                            return Container(
                              height: Get.size.height - 150,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: PageError(
                                onPressed: controller.loadFilteredProduct,
                              ),
                            );
                          }

                          if (controller.pageState().data.products.length > 0) {
                            return Column(
                              children: [
                                GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .pageState()
                                      .data
                                      .products
                                      .length,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: _crossAxisCount,
                                    crossAxisSpacing: _crossAxisSpacing,
                                    mainAxisSpacing: _mainAxisSpacing,
                                    childAspectRatio: _aspectRatio,
                                  ),
                                  itemBuilder: (context, index) {
                                    return ProductItem(
                                      onTap: () {
                                        controller.routeToProductDetailPage(
                                            controller
                                                .pageState()
                                                .data
                                                .products[index]);
                                      },
                                      product: controller
                                          .pageState()
                                          .data
                                          .products[index],
                                    );
                                  },
                                ),
                                (controller.pageState().state == States.paging)
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 3,
                                            backgroundColor: Colors.grey[100],
                                            valueColor: AlwaysStoppedAnimation<
                                                    Color>(
                                                Theme.of(context).primaryColor),
                                          ),
                                        ),
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
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 5,
                bottom: 5,
              ),
              child: ScrollTopButton(
                tag: Utility().randomString(10),
                scrollController: controller.scrollController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

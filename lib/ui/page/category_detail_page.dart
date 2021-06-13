import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoryDetailPage extends GetView<CategoryDetailPageController> {
  @override
  Widget build(BuildContext context) {
    List<BannerSecondaryModel> bannerSecondaries = controller
        .pageModel.bannerSecondaries
        .where((model) =>
            model.categoryId == controller.pageModel.category.categoryId)
        .toList();

    List<SubCategoryModel> subCategories = controller.pageModel.subCategories
        .where((model) =>
            model.categoryId == controller.pageModel.category.categoryId)
        .toList();

    var _crossAxisSpacing = 10.0;
    var _mainAxisSpacing = 10.0;
    var _screenWidth = Get.size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var _cellHeight = 570 / 2;
    var _aspectRatio = _width / _cellHeight;

    return Scaffold(
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              controller.loadFilteredProduct();
            },
            child: CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverAppBar(
                  expandedHeight: Get.size.height / 2.5,
                  pinned: true,
                  titleSpacing: 0,
                  actions: [
                    IconButtonWithDot(
                      Icon(Icons.notifications_rounded),
                      value: 22,
                      onPressed: () {},
                    ),
                    IconButton(
                      onPressed: () {},
                      iconSize: 30,
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.only(right: 12, left: 0),
                      icon: Icon(Icons.account_circle_rounded),
                    ),
                  ],
                  title: StaticSearchField(
                    onTap: controller.routeToSearchPage,
                    text: 'mau belanja apa kak?',
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      child: ImageSlider(
                        itemCount: bannerSecondaries.length,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                            onTap: () {
                              print(index);
                            },
                            child: CachedNetworkImage(
                              imageUrl:
                                  bannerSecondaries[index].bannerSecondaryImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              placeholder: (context, url) {
                                return ShimmerLoader();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeading(
                          heading: controller.pageModel.category.categoryName,
                        ),
                        SizedBox(height: 15),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: List<Widget>.from(
                            subCategories.map(
                              (item) => Material(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(15),
                                child: InkWell(
                                  onTap: () {
                                    controller.routeToProductPage(
                                        ProductFilterModel(
                                            subCategory: item.subCategoryId));
                                  },
                                  borderRadius: BorderRadius.circular(15),
                                  child: Ink(
                                    width: (Get.size.width - 60) / 4,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.network(
                                            item.subCategoryImage,
                                            width: 30,
                                            height: 30,
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            item.subCategoryName,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 8),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 8,
                    color: Colors.grey[100],
                  ),
                ),
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
                          return Column(
                            children: [
                              GridView.builder(
                                shrinkWrap: true,
                                itemCount: (controller.loadingFilter.value)
                                    ? 2
                                    : controller
                                        .productPaginate.value.products.length,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: _crossAxisCount,
                                  crossAxisSpacing: _crossAxisSpacing,
                                  mainAxisSpacing: _mainAxisSpacing,
                                  childAspectRatio: _aspectRatio,
                                ),
                                itemBuilder: (context, index) {
                                  return (controller.loadingFilter.value)
                                      ? ShimmerLoader(radius: 15)
                                      : ProductItem(
                                          onTap: () {},
                                          product: controller.productPaginate
                                              .value.products[index],
                                        );
                                },
                              ),
                              (!controller.loadingPagination.value)
                                  ? SizedBox.shrink()
                                  : Padding(
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
                                    ),
                            ],
                          );
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
                tag: 'CATEGORY_DETAIL_PAGE',
                scrollController: controller.scrollController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

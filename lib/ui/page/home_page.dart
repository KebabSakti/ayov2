import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/bundle/bundle_model.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GetBuilder(
      init: HomePageController(),
      builder: (HomePageController controller) {
        return Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                controller.refresh();
              },
              child: CustomScrollView(
                controller: controller.homePageScrollController,
                slivers: [
                  HomeAppbarSection(controller: controller),
                  SliverToBoxAdapter(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Get.theme.dividerColor),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Ink(
                              height: 50,
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(QR_ICON, width: 20),
                                      SizedBox(width: 10),
                                      Text('scan qr'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 1,
                            color: Get.theme.dividerColor,
                          ),
                          Expanded(
                            child: Ink(
                              height: 50,
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('0 Point'),
                                      SizedBox(width: 10),
                                      SvgPicture.asset(COIN_ICON, width: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  HomeCategorySectionNew(controller: controller),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 8,
                      color: Colors.grey[100],
                    ),
                  ),
                  HomeVoucherSection(controller: controller),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 8,
                      color: Colors.grey[100],
                    ),
                  ),
                  HomePopularProductSection(controller: controller),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 8,
                      color: Colors.grey[100],
                    ),
                  ),
                  HomeMostSearchSection(controller: controller),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 8,
                      color: Colors.grey[100],
                    ),
                  ),
                  SliverList(
                    delegate:
                        SliverChildBuilderDelegate((context, indexBundle) {
                      return Obx(() {
                        if (controller.home().state == States.loading) {
                          return ShimmerLoader(height: 300);
                        }

                        if (controller.home().data.bundles.length > 0) {
                          BundleModel bundle =
                              controller.home().data.bundles[indexBundle];

                          List<ProductModel> products = bundle.products;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: SectionHeading(
                                  heading: bundle.bundleName,
                                  onPressed: () {},
                                ),
                              ),
                              Ink(
                                height: 300,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      bundle.bundleBackground,
                                    ),
                                  ),
                                ),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      width: (Get.size.width - 70) / 2,
                                      padding: EdgeInsets.only(right: 10),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.contain,
                                        imageUrl: bundle.bundleImage,
                                      ),
                                    ),
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            right: (index >= 0 &&
                                                    index != products.length)
                                                ? 10
                                                : 0,
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              ProductModel product =
                                                  products[index];

                                              return ProductItem(
                                                onTap: () {
                                                  controller
                                                      .routeToProductDetailPage(
                                                          product);
                                                },
                                                product: product,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Ink(
                                        width: (Get.size.width - 70) / 2,
                                        decoration: BoxDecoration(
                                          color:
                                              Get.theme.colorScheme.background,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.chevron_right_rounded,
                                              size: 60,
                                              color: Get.theme.primaryColor,
                                            ),
                                            SizedBox(height: 5),
                                            Text('Lihat Semua'),
                                          ],
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 8,
                                color: Colors.grey[100],
                              ),
                            ],
                          );
                        }

                        return SizedBox.shrink();
                      });
                    }, childCount: 3),
                  ),
                  // SliverToBoxAdapter(
                  //   child: Container(
                  //     height: 8,
                  //     color: Colors.grey[100],
                  //   ),
                  // ),
                  HomeProductSection(controller: controller),
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
                  tag: 'HOME_PAGE',
                  scrollController: controller.homePageScrollController,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

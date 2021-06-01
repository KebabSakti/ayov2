import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
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
        return Obx(
          () {
            return Stack(
              children: [
                RefreshIndicator(
                  onRefresh: () async {
                    controller.init();
                  },
                  child: CustomScrollView(
                    controller: controller.homePageScrollController,
                    slivers: [
                      SliverAppBar(
                        expandedHeight: Get.size.height / 2.5,
                        pinned: true,
                        titleSpacing: 0,
                        actions: [
                          IconButton(
                            onPressed: () {},
                            iconSize: 30,
                            padding: EdgeInsets.only(left: 8),
                            visualDensity: VisualDensity.compact,
                            icon: IconWithDot(
                              showDot: true,
                              icon: Icon(Icons.shopping_bag_rounded),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            iconSize: 30,
                            padding: EdgeInsets.only(right: 8, left: 0),
                            icon: IconWithDot(
                              icon: Icon(Icons.account_circle_rounded),
                            ),
                          ),
                        ],
                        title: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: StaticSearchField(
                            onTap: () {},
                            text: 'mau belanja apa kak?',
                          ),
                        ),
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            child: (controller.loading.value)
                                ? ShimmerLoader()
                                : ImageSlider(
                                    itemCount: controller.homePageModel
                                        .bannerPrimaryModel.length,
                                    itemBuilder: (_, int index) {
                                      BannerPrimaryModel model = controller
                                          .homePageModel
                                          .bannerPrimaryModel[index];

                                      return GestureDetector(
                                        onTap: () {
                                          print(index);
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl: model.bannerPrimaryImage,
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
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              ScannerPointBar(
                                onQrTap: () {},
                                onCoinTap: () {},
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Kategori',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Lihat Semua',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        color: Get.theme.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 150,
                                child: ListView.builder(
                                  itemCount: 2,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right:
                                            (index >= 0 && index != 1) ? 10 : 0,
                                      ),
                                      child: (controller.loading.value)
                                          ? ShimmerLoader(
                                              radius: 15,
                                              width: (Get.size.width - 30) / 2,
                                            )
                                          : Material(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: InkWell(
                                                onTap: () {},
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Ink(
                                                  width:
                                                      (Get.size.width - 30) / 2,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.network(
                                                          controller
                                                              .homePageModel
                                                              .categoryModel[
                                                                  index]
                                                              .categoryImage,
                                                          width: 60,
                                                          height: 60,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          controller
                                                              .homePageModel
                                                              .categoryModel[
                                                                  index]
                                                              .categoryName,
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[800],
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                    );
                                  },
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
                      SliverToBoxAdapter(
                        child: Container(height: 200),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

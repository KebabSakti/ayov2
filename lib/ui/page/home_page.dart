import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
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
                          bottom: BorderSide(
                            color: Colors.grey[100],
                            width: 2,
                          ),
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
                                      Text(
                                        'scan qr',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 2,
                            color: Colors.grey[100],
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
                                      Text(
                                        '0 Point',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[800],
                                        ),
                                      ),
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
                  SliverToBoxAdapter(
                    child: Ink(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: Obx(() {
                        return (controller.loading())
                            ? Wrap(
                                children: List<Widget>.generate(
                                    8,
                                    (index) => Ink(
                                          width: (Get.size.width - 20) / 4,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ShimmerLoader(
                                                    width: 55,
                                                    height: 55,
                                                    radius: 100,
                                                  ),
                                                  SizedBox(height: 6),
                                                  ShimmerLoader(
                                                    width: 40,
                                                    height: 10,
                                                    radius: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                              )
                            : Wrap(
                                children: controller.homePageModel.categoryModel
                                    .asMap()
                                    .map((index, item) {
                                      return MapEntry(
                                        index,
                                        Builder(
                                          builder: (context) {
                                            if (index < 8) {
                                              return Ink(
                                                width:
                                                    (Get.size.width - 20) / 4,
                                                child: InkWell(
                                                  onTap: () {
                                                    if (index == 7) {
                                                      controller.allCategory();
                                                    } else {
                                                      controller.categoryOnClick(
                                                          controller
                                                              .homePageModel
                                                              .categoryModel[
                                                                  index]
                                                              .categoryId);
                                                    }
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10),
                                                    child: Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  Center(
                                                                    child: Ink(
                                                                      width: 55,
                                                                      height:
                                                                          55,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: (index ==
                                                                                7)
                                                                            ? Colors.grey[100]
                                                                            : Colors.green[50],
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          Radius.circular(
                                                                              100),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned
                                                                      .fill(
                                                                    child:
                                                                        Center(
                                                                      child: (index ==
                                                                              7)
                                                                          ? Icon(
                                                                              Icons.more_horiz_rounded,
                                                                              color: Colors.green,
                                                                              size: 40,
                                                                            )
                                                                          : SvgPicture
                                                                              .network(
                                                                              item.categoryImage,
                                                                              width: 40,
                                                                              height: 40,
                                                                              placeholderBuilder: (context) => ShimmerLoader(
                                                                                width: 40,
                                                                                height: 40,
                                                                                radius: 40,
                                                                              ),
                                                                            ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 6),
                                                          Text(
                                                            (index == 7)
                                                                ? 'Semua'
                                                                : item
                                                                    .categoryName,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            return SizedBox.shrink();
                                          },
                                        ),
                                      );
                                    })
                                    .values
                                    .toList(),
                              );
                      }),
                    ),
                  ),
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

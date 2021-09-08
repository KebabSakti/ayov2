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

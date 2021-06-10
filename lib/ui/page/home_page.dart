import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
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
                  HomeCategorySection(controller: controller),
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

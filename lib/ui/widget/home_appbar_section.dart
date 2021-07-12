import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppbarSection extends StatelessWidget {
  final HomePageController controller;

  HomeAppbarSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: Get.size.height / 2.5,
      pinned: true,
      titleSpacing: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: IconButtonWithDot(
            Icon(Icons.notifications_rounded),
            value: 22,
            onPressed: () {},
          ),
        ),
      ],
      title: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: StaticSearchField(
          onTap: controller.routeToSearchPage,
          text: 'mau belanja apa kak?',
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Obx(() {
          return Container(
            child: (controller.loading.value)
                ? ShimmerLoader()
                : ImageSlider(
                    itemCount:
                        controller.homePageModel.bannerPrimaryModel.length,
                    itemBuilder: (_, int index) {
                      return GestureDetector(
                        onTap: () {
                          print(index);
                        },
                        child: CachedNetworkImage(
                          imageUrl: controller.homePageModel
                              .bannerPrimaryModel[index].bannerPrimaryImage,
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
          );
        }),
      ),
    );
  }
}

import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/banner/banner_primary_model.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppbarSection extends StatelessWidget {
  final HomePageController controller;

  HomeAppbarSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: Get.size.height / 3.5,
      pinned: true,
      titleSpacing: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Obx(() {
            return IconButtonWithDot(
              Icon(Icons.shopping_cart_rounded),
              value: controller.cartController.cartQtyTotal.value,
              onPressed: () {
                controller.routeToCartPage();
              },
            );
          }),
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
          StateModel home = controller.home();

          if (home.state == States.loading) {
            return ShimmerLoader();
          }

          if (home.state == States.error) {
            return Container(
              color: Colors.grey[100],
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.report_problem_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  SizedBox(height: 5),
                  Text(
                    ERROR_MESSAGE,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          }

          if (home.data.bannerPrimaryModel.length > 0) {
            List<BannerPrimaryModel> banners = home.data.bannerPrimaryModel;

            return Container(
              child: ImageSlider(
                itemCount: banners.length,
                itemBuilder: (_, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (banners[index].bannerPrimaryLink != null)
                        controller
                            .sliderOnClick(banners[index].bannerPrimaryLink);
                    },
                    child: CachedNetworkImage(
                      imageUrl: banners[index].bannerPrimaryImage,
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
          }

          return SizedBox.shrink();
        }),
      ),
    );
  }
}

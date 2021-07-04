import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeVoucherSection extends StatelessWidget {
  final HomePageController controller;

  HomeVoucherSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SectionHeading(heading: 'Voucher Belanja'),
            SizedBox(height: 15),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var images = [
                    'https://image.freepik.com/free-vector/discount-social-media-banner-sale-liquid-background_92715-50.jpg',
                    'https://image.freepik.com/free-vector/abstract-colorful-big-sale-banner_23-2148345098.jpg',
                    'https://image.freepik.com/free-vector/end-season-summer-sale-horizontal-banner_23-2148633748.jpg',
                  ];

                  return Padding(
                    padding: EdgeInsets.only(
                      right: (index >= 0 && index != 2) ? 10 : 0,
                    ),
                    child: Obx(
                      () {
                        return (controller.loading.value)
                            ? ShimmerLoader(
                                radius: 15,
                                width: Get.size.width - 60,
                              )
                            : Material(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(15),
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(15),
                                  child: Ink(
                                    width: Get.size.width - 60,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl: images[index],
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            ShimmerLoader(
                                          radius: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

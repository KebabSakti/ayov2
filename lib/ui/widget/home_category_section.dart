import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeCategorySection extends StatelessWidget {
  final HomePageController controller;

  HomeCategorySection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            ScannerPointBar(
              onQrTap: controller.qrScanner,
              onCoinTap: () {},
            ),
            SizedBox(height: 20),
            SectionHeading(
              heading: 'Kategori',
              onPressed: controller.routeToCategoryPage,
            ),
            SizedBox(height: 15),
            Obx(() {
              StateModel<HomePageModel> home = controller.home();

              if (home.state == States.loading) {
                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: (index >= 0 && index != 1) ? 10 : 0),
                        child: ShimmerLoader(
                          radius: 15,
                          width: (Get.size.width - 40) / 2,
                        ),
                      );
                    },
                  ),
                );
              }

              if (home.data.categoryModel.length > 0) {
                List<CategoryModel> categories = home.data.categoryModel;

                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right:
                                (index >= 0 && index != (categories.length - 1))
                                    ? 10
                                    : 0),
                        child: Material(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                            onTap: () {
                              controller
                                  .routeToCategoryDetailPage(categories[index]);
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Ink(
                              width: (Get.size.width - 40) / 2,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.network(
                                    categories[index].categoryImage,
                                    width: 60,
                                    height: 60,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    categories[index].categoryName,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }

              return SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}

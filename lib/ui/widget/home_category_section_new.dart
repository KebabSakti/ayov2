import 'package:ayov2/getx/controller/controller.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeCategorySectionNew extends StatelessWidget {
  final HomePageController controller;

  HomeCategorySectionNew({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Ink(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Obx(() {
          StateModel<HomePageModel> home = controller.home();

          if (home.state == States.loading) {
            return Wrap(
              children: List<Widget>.generate(
                  8,
                  (index) => Ink(
                        width: (Get.size.width - 20) / 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
            );
          }

          if (home.data.categoryModel.length > 0) {
            List<CategoryModel> categories = home.data.categoryModel;

            return Wrap(
              children: categories
                  .asMap()
                  .map((index, item) {
                    return MapEntry(
                      index,
                      Builder(
                        builder: (context) {
                          if (index < 8) {
                            return Ink(
                              width: (Get.size.width - 20) / 4,
                              child: InkWell(
                                onTap: () {
                                  if (index == 7) {
                                    controller.allCategory();
                                  } else {
                                    controller.categoryOnClick(item.categoryId);
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Center(
                                                  child: Ink(
                                                    width: 55,
                                                    height: 55,
                                                    decoration: BoxDecoration(
                                                      color: (index == 7)
                                                          ? Colors.grey[100]
                                                          : Colors.green[50],
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(100),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: Center(
                                                    child: (index == 7)
                                                        ? Icon(
                                                            Icons
                                                                .more_horiz_rounded,
                                                            color: Colors.green,
                                                            size: 40,
                                                          )
                                                        : SvgPicture.network(
                                                            item.categoryImage,
                                                            width: 40,
                                                            height: 40,
                                                            placeholderBuilder:
                                                                (context) =>
                                                                    ShimmerLoader(
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
                                              : item.categoryName,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 10),
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
          }

          return SizedBox.shrink();
        }),
      ),
    );
  }
}

import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMostSearchSection extends StatelessWidget {
  final HomePageController controller;

  HomeMostSearchSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 10.0;
    var _mainAxisSpacing = 10.0;
    var _screenWidth = Get.size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var _cellHeight = (150 / 2) - 1;
    var _aspectRatio = _width / _cellHeight;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SectionHeading(heading: 'Pencarian Terbanyak'),
            SizedBox(height: 15),
            SizedBox(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _crossAxisCount,
                    crossAxisSpacing: _crossAxisSpacing,
                    mainAxisSpacing: _mainAxisSpacing,
                    childAspectRatio: _aspectRatio,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      StateModel<HomePageModel> home = controller.home();

                      if (home.state == States.loading) {
                        return ShimmerLoader(radius: 15);
                      }

                      if (home.data.mostSearch.length > 0) {
                        List<SearchModel> searches = home.data.mostSearch;

                        return Material(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(15),
                            child: Ink(
                              width: (Get.size.width - 40) / 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: searches[index].searchImage,
                                      fit: BoxFit.cover,
                                      width: _width / 3,
                                      height: double.infinity,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              searches[index].searchKeyword,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              searches[index]
                                                      .searchCount
                                                      .toString() +
                                                  ' pencarian',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                                color: Get.theme.primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                      return SizedBox.shrink();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

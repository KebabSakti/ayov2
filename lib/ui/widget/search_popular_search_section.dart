import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPopularSearchSection extends StatelessWidget {
  final SearchPageController controller;

  SearchPopularSearchSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pencarian populer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Obx(() {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: (controller.loadingPage.value)
                ? 5
                : controller.searchPageModel.value.popularSearches.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (controller.loadingPage.value) {
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.all(0),
                  leading: ShimmerLoader(
                    radius: 10,
                    height: 45,
                    width: 60,
                  ),
                  title: ShimmerLoader(
                    radius: 6,
                    height: 15,
                  ),
                  subtitle: ShimmerLoader(
                    radius: 6,
                    height: 15,
                  ),
                );
              }

              if (controller.searchPageModel.value.popularSearches.length > 0) {
                return ListTile(
                  onTap: () {},
                  dense: true,
                  contentPadding: EdgeInsets.all(0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: controller.searchPageModel.value
                          .popularSearches[index].searchImage,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 60,
                    ),
                  ),
                  title: Text(
                    controller.searchPageModel.value.popularSearches[index]
                        .searchKeyword,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.grey[800],
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text(
                    '${controller.searchPageModel.value.popularSearches[index].searchCount} pencarian',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                );
              }

              return (index == 0) ? Text('Tidak ada data') : SizedBox.shrink();
            },
          );
        }),
      ],
    );
  }
}

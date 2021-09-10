import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchHistoriesSection extends StatelessWidget {
  final SearchPageController controller;

  SearchHistoriesSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Terakhir dicari',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        Obx(() {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: (controller.loadingPage.value)
                ? 5
                : controller.searchPageModel.value.searchHistories.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (controller.loadingPage.value) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ShimmerLoader(
                    height: 20,
                    radius: 6,
                  ),
                );
              }

              if (controller.searchPageModel.value.searchHistories.length > 0) {
                return ListTile(
                  onTap: () {
                    controller.routeToProductPage(ProductFilterModel(
                        keyword: controller.searchPageModel.value
                            .searchHistories[index].searchKeyword));
                  },
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  leading: Icon(
                    Icons.history_rounded,
                    color: Get.theme.colorScheme.onSecondary,
                  ),
                  title: Text(
                    controller.searchPageModel.value.searchHistories[index]
                        .searchKeyword,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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

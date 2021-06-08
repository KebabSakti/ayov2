import 'package:ayov2/getx/getx.dart';
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
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Obx(() {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: (controller.loadingPage.value)
                ? 5
                : controller.searchPageModel.searchHistories.length,
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

              if (controller.searchPageModel.searchHistories.length > 0) {
                return Row(
                  children: [
                    Icon(
                      Icons.history_rounded,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 10),
                    Text(
                      controller
                          .searchPageModel.searchHistories[index].searchKeyword,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      visualDensity: VisualDensity.compact,
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
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

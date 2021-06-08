import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: Colors.grey[800]),
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 38,
              width: double.infinity,
              color: Colors.grey[100],
              child: TextField(
                controller: controller.searchField,
                autofocus: true,
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                cursorColor: Colors.grey[600],
                cursorWidth: 1,
                decoration: InputDecoration(
                  hintText: 'Cari di sini',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 4),
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.grey[400],
                    size: 20,
                  ),
                  suffixIcon: Obx(() => (controller.keyword.value.length == 0)
                      ? SizedBox.shrink()
                      : IconButton(
                          onPressed: controller.clearSearchField,
                          constraints: BoxConstraints(),
                          iconSize: 20,
                          icon: Icon(
                            Icons.close_rounded,
                            color: Colors.grey[400],
                          ),
                        )),
                  prefixIconConstraints: BoxConstraints(minWidth: 40),
                ),
                onSubmitted: (value) {},
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.keyword.value.length > 0) {
          return CustomScrollView(
            slivers: [
              (controller.searchResultModel.value.keywords.length > 0)
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (controller.searchResultModel.value.keywords.length >
                            0) {
                          return ListTile(
                            onTap: () {},
                            visualDensity: VisualDensity.compact,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            title: Text(
                              controller.searchResultModel.value.keywords[index]
                                  .searchKeyword,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14),
                            ),
                          );
                        }

                        return SizedBox.shrink();
                      },
                          childCount: controller
                              .searchResultModel.value.keywords.length),
                    )
                  : SliverToBoxAdapter(),
              (controller.searchResultModel.value.products.length > 0)
                  ? SliverPadding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      sliver: SliverToBoxAdapter(
                        child: Text(
                          'Produk Terkait',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : SliverToBoxAdapter(),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (controller.searchResultModel.value.products.length > 0) {
                    return ListTile(
                      onTap: () {},
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 6,
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          imageUrl: controller.searchResultModel.value
                              .products[index].productCover,
                          fit: BoxFit.cover,
                          height: 40,
                          width: 40,
                          placeholder: (_, __) => ShimmerLoader(
                            radius: 4,
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                      title: Text(
                        controller.searchResultModel.value.products[index]
                            .productName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                    );
                  }

                  return SizedBox.shrink();
                },
                    childCount:
                        controller.searchResultModel.value.products.length),
              ),
            ],
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            controller.loadPageData();
          },
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(15),
            children: [
              SearchProductViewSection(controller: controller),
              SizedBox(height: 20),
              SearchHistoriesSection(controller: controller),
              SizedBox(height: 15),
              SearchPopularSearchSection(controller: controller),
            ],
          ),
        );
      }),
    );
  }
}

import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoryPage extends GetView<CategoryPageContrller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Kategori'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: ListView.builder(
                itemCount: controller.categoryPageModel.value.categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.active(controller.categoryPageModel.value
                          .categories[index].categoryId);
                    },
                    child: Obx(() {
                      return Container(
                        color: (controller.active.value ==
                                controller.categoryPageModel.value
                                    .categories[index].categoryId)
                            ? Colors.white
                            : Colors.transparent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Column(
                          children: [
                            SvgPicture.network(
                              controller.categoryPageModel.value
                                  .categories[index].categoryImage,
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(height: 5),
                            Text(
                              controller.categoryPageModel.value
                                  .categories[index].categoryName,
                              // maxLines: 2,
                              // overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 8),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Obx(() {
                List<SubCategoryModel> subCategories = controller
                    .categoryPageModel.value.subCategories
                    .where((item) => item.categoryId == controller.active.value)
                    .toList();

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            SvgPicture.network(
                              subCategories[index].subCategoryImage,
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(height: 10),
                            Text(
                              subCategories[index].subCategoryName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: subCategories.length,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

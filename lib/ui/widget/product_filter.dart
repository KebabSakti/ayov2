import 'package:ayov2/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductFilter extends StatelessWidget {
  final String tag;
  final Function onFilter;

  ProductFilter({
    @required this.tag,
    @required this.onFilter,
  });

  @override
  Widget build(BuildContext context) {
    final ProductFilterController controller =
        Get.put(ProductFilterController(onFilter), tag: tag);
    return SizedBox(
      height: 35,
      child: Obx(() {
        var filters =
            controller.filters.where((item) => item.tag == 'filter').toList();
        return ListView.builder(
          shrinkWrap: true,
          itemCount: filters.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right:
                      (index >= 0 && index != (filters.length - 1)) ? 10 : 0),
              child: ChoiceChip(
                backgroundColor: Colors.grey[200],
                selectedColor: Colors.green.withOpacity(0.5),
                elevation: 0,
                pressElevation: 0,
                selected: filters[index].value,
                onSelected: (value) {
                  controller.onFilterSelected(
                    filters[index].copyWith(value: value),
                  );
                },
                label: Text(
                  controller.filters[index].name,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

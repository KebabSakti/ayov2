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
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.only(right: (index >= 0 && index != 19) ? 10 : 0),
            child: ChoiceChip(
              backgroundColor: Colors.grey[200],
              selected: index == 0 ? true : false,
              selectedColor: Colors.green.withOpacity(0.5),
              elevation: 0,
              pressElevation: 0,
              label: Text(
                'Pilihan $index',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              onSelected: (value) {},
            ),
          );
        },
      ),
    );
  }
}

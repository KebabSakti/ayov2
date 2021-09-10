import 'package:ayov2/const/const.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductFilter extends StatelessWidget {
  final Rx<ProductFilterModel> productFilterModel;
  final VoidCallback onFilterTap;

  ProductFilter({
    @required this.productFilterModel,
    @required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        children: [
          SizedBox(
            width: 50,
            height: 33,
            child: Ink(
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.background,
                borderRadius: BorderRadius.circular(25),
              ),
              child: InkWell(
                onTap: onFilterTap,
                borderRadius: BorderRadius.circular(25),
                child: Icon(
                  Icons.tune_rounded,
                  color: Get.theme.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                ProductFilterItem(
                  selected: productFilterModel.value.highSell,
                  child: Text('Paling Laris'),
                  onSelected: (value) {
                    productFilterModel(
                        productFilterModel.value.copyWith(highSell: value));
                  },
                ),
                SizedBox(width: 10),
                ProductFilterItem(
                  selected: productFilterModel.value.discount,
                  child: Text('Lagi Diskon'),
                  onSelected: (value) {
                    productFilterModel(
                        productFilterModel.value.copyWith(discount: value));
                  },
                ),
                SizedBox(width: 10),
                ProductFilterItem(
                  selected: productFilterModel.value.highRatingValue,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text('4 ke atas'),
                    ],
                  ),
                  onSelected: (value) {
                    productFilterModel(productFilterModel.value
                        .copyWith(highRatingValue: value));
                  },
                ),
                SizedBox(width: 10),
                ProductFilterItem(
                  selected: productFilterModel.value.highPoint,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        COIN_ICON,
                        width: 15,
                        height: 15,
                      ),
                      SizedBox(width: 4),
                      Text('Banyak Poin'),
                    ],
                  ),
                  onSelected: (value) {
                    productFilterModel(
                        productFilterModel.value.copyWith(highPoint: value));
                  },
                ),
                SizedBox(width: 10),
                ProductFilterItem(
                  selected: productFilterModel.value.highView,
                  child: Text('Trending'),
                  onSelected: (value) {
                    productFilterModel(
                        productFilterModel.value.copyWith(highView: value));
                  },
                ),
                SizedBox(width: 10),
                ProductFilterItem(
                  selected: productFilterModel.value.highSearch,
                  child: Text('Populer'),
                  onSelected: (value) {
                    productFilterModel(
                        productFilterModel.value.copyWith(highSearch: value));
                  },
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

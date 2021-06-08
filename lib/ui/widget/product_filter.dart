import 'package:ayov2/const/const.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: InkWell(
                onTap: onFilterTap,
                borderRadius: BorderRadius.circular(25),
                child: Icon(
                  FontAwesomeIcons.slidersH,
                  size: 16,
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
                  child: Text(
                    'Paling Laris',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  onSelected: (value) {
                    productFilterModel(
                        productFilterModel.value.copyWith(highSell: value));
                  },
                ),
                SizedBox(width: 10),
                ProductFilterItem(
                  selected: productFilterModel.value.discount,
                  child: Text(
                    'Lagi Diskon',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
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
                      Text(
                        '4 ke atas',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
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
                      Text(
                        'Banyak Poin',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
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
                  child: Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  onSelected: (value) {
                    productFilterModel(
                        productFilterModel.value.copyWith(highView: value));
                  },
                ),
                SizedBox(width: 10),
                ProductFilterItem(
                  selected: productFilterModel.value.highSearch,
                  child: Text(
                    'Populer',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
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

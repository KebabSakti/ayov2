import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductFilter extends StatelessWidget {
  final Rx<ProductFilterModel> productFilterModel;

  ProductFilter({@required this.productFilterModel});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        children: [
          SizedBox(
            width: 50,
            height: 35,
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: InkWell(
                onTap: () {},
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
                  selected: productFilterModel.value.palingLaris,
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
                        productFilterModel.value.copyWith(palingLaris: value));
                  },
                ),
                SizedBox(width: 10),
                ProductFilterItem(
                  selected: productFilterModel.value.lagiDiskon,
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
                        productFilterModel.value.copyWith(lagiDiskon: value));
                  },
                ),
                SizedBox(width: 10),
                ProductFilterItem(
                  selected: productFilterModel.value.ratingEmpat,
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
                    productFilterModel(
                        productFilterModel.value.copyWith(ratingEmpat: value));
                  },
                ),
                SizedBox(width: 10),
                ProductFilterItem(
                  selected: productFilterModel.value.banyakCoin,
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.amber,
                        size: 18,
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
                        productFilterModel.value.copyWith(banyakCoin: value));
                  },
                ),
                SizedBox(width: 10),
                ProductFilterItem(
                  selected: productFilterModel.value.trending,
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
                        productFilterModel.value.copyWith(trending: value));
                  },
                ),
                SizedBox(width: 10),
                ProductFilterItem(
                  selected: productFilterModel.value.populer,
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
                        productFilterModel.value.copyWith(populer: value));
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

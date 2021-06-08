import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final Function onTap;

  ProductItem({@required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[50],
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Ink(
          width: (Get.size.width - 40) / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: product.productCover,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250 / 2,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          product.productName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        (double.parse(product.productDiscount) == 0)
                            ? SizedBox.shrink()
                            : Text(
                                Utility().currency(product.productPrice),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[400],
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                        Text(
                          Utility().currency(product.productFinalPrice),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ),
                        Spacer(),
                        Rating(double.parse(product.productRatingValue)),
                        Spacer(),
                        ProductDeliveryType(
                          name: 'PENGIRIMAN ${product.productDeliveryType}',
                          color: (product.productDeliveryType == 'LANGSUNG')
                              ? Colors.green
                              : Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

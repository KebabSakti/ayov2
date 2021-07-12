import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CartPageController(),
      builder: (CartPageController controller) {
        return (controller.cartController.cartItems.length ==
                0) //if cart is empty
            ? SizedBox.shrink()
            : RefreshIndicator(
                onRefresh: () async {},
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      title: Text(
                        'Keranjang',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShimmerLoader(
                                  height: 80,
                                  width: 80,
                                  radius: 10,
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(controller
                                          .cartController
                                          .cartItems[index]
                                          .product
                                          .productName),
                                      Row(
                                        children: [],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                            childCount:
                                controller.cartController.cartItems.length),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}

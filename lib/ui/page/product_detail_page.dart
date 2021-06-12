import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductDetailPage extends GetWidget<ProductDetailPageControlller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: Get.size.height / 2.5,
                pinned: true,
                titleSpacing: 0,
                centerTitle: true,
                title: Obx(() {
                  return (controller.loading.value)
                      ? Text(controller.productModel.productName)
                      : Text(controller.pageModel.product.productName);
                }),
                actions: [
                  IconButton(
                    onPressed: () {},
                    iconSize: 30,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    visualDensity: VisualDensity.compact,
                    icon: IconWithDot(
                      showDot: true,
                      icon: Icon(Icons.shopping_basket_rounded),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    child: Obx(() {
                      return (controller.loading.value)
                          ? ShimmerLoader()
                          : CachedNetworkImage(
                              imageUrl:
                                  controller.pageModel.product.productCover,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              placeholder: (context, url) {
                                return ShimmerLoader();
                              },
                            );
                    }),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Obx(() {
                    return (controller.loading.value)
                        ? MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: 5,
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10),
                              itemBuilder: (context, index) {
                                return ShimmerLoader(
                                  height: 15,
                                  radius: 6,
                                );
                              },
                            ),
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Utility().currency(controller
                                                      .pageModel
                                                      .product
                                                      .productFinalPrice) +
                                                  ' ( ${controller.pageModel.product.productUnit} )',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 6,
                                                    vertical: 4,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.amberAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: Text(
                                                    '9% OFF',
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 6),
                                                Text(
                                                  Utility().currency(controller
                                                      .pageModel
                                                      .product
                                                      .productPrice),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey[400],
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Obx(() {
                                          return (controller
                                                  .loadingFavourite.value)
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: CircularLoader(
                                                    width: 25,
                                                    height: 25,
                                                  ),
                                                )
                                              : IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .addProductFavourite(
                                                            controller
                                                                .product
                                                                .value
                                                                .productId);
                                                  },
                                                  icon: Icon(
                                                    Icons.favorite_rounded,
                                                    color: (controller
                                                                .product
                                                                .value
                                                                .productFavourite ==
                                                            0)
                                                        ? Colors.grey[400]
                                                        : Colors.red,
                                                    size: 30,
                                                  ),
                                                );
                                        }),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      controller.pageModel.product.productName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          controller
                                              .pageModel.product.productPoint
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.amber,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        SvgPicture.asset(
                                          COIN_ICON,
                                          width: 20,
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                            right: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                color: Colors.grey[200],
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: (double.parse(controller
                                                            .pageModel
                                                            .product
                                                            .productRatingValue) >
                                                        0)
                                                    ? Colors.amber
                                                    : Colors.grey[400],
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '${controller.pageModel.product.productRatingValue}',
                                                style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '(${controller.pageModel.product.productRatingCount})',
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                color: Colors.grey[200],
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Dilihat',
                                                style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '(${controller.pageModel.product.productView})',
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Terjual',
                                                style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '(${controller.pageModel.product.productSold})',
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    ProductDeliveryType(
                                      name:
                                          'PENGIRIMAN ${controller.pageModel.product.productDeliveryType}',
                                      color: (controller.pageModel.product
                                                  .productDeliveryType ==
                                              'LANGSUNG')
                                          ? Colors.green
                                          : Colors.amber,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                  }),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 8,
                  color: Colors.grey[100],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Obx(() {
                    return (controller.loading.value)
                        ? MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: 3,
                              physics: NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10),
                              itemBuilder: (context, index) {
                                return ShimmerLoader(
                                  height: 15,
                                  radius: 6,
                                );
                              },
                            ),
                          )
                        : Column(
                            children: [
                              SectionHeading(heading: 'Deskripsi Produk'),
                              SizedBox(height: 15),
                              ExpandablePanel(
                                collapsed: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller
                                          .pageModel.product.productDescription,
                                      softWrap: true,
                                      maxLines: 6,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                    ),
                                    (controller.pageModel.product
                                                .productDescription.length >
                                            100)
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: ExpandableButton(
                                              child: Text(
                                                "Lihat Detail",
                                                style: TextStyle(
                                                  color: Get.theme.primaryColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                  ],
                                ),
                                expanded: Text(
                                  controller
                                      .pageModel.product.productDescription,
                                  softWrap: true,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          );
                  }),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 8,
                  color: Colors.grey[100],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Obx(() {
                    if (controller.loading.value) {
                      return MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: 3,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            return ShimmerLoader(
                              height: 15,
                              radius: 6,
                            );
                          },
                        ),
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeading(
                          onPressed: () {},
                          heading: 'Ulasan Pembeli',
                        ),
                        SizedBox(height: 15),
                        Builder(
                          builder: (context) {
                            if (controller.pageModel.reviews.length > 0) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: (double.parse(controller
                                                    .pageModel
                                                    .product
                                                    .productRatingValue) >
                                                0)
                                            ? Colors.amberAccent
                                            : Colors.grey[400],
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        (double.parse(controller
                                                    .pageModel
                                                    .product
                                                    .productRatingValue) >
                                                0)
                                            ? controller.pageModel.product
                                                .productRatingValue
                                            : '0',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'dari ${controller.pageModel.product.productRatingCount} ulasan',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Rating(double.parse(controller.pageModel
                                          .product.productRatingValue)),
                                      SizedBox(width: 4),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.grey[800],
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'oleh ',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Kebab',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  ExpandablePanel(
                                    collapsed: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.pageModel.reviews[0]
                                              .ratingProductComment,
                                          softWrap: true,
                                          maxLines: 6,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.justify,
                                        ),
                                        (controller
                                                    .pageModel
                                                    .reviews[0]
                                                    .ratingProductComment
                                                    .length >
                                                100)
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 6),
                                                child: ExpandableButton(
                                                  child: Text(
                                                    "Lihat Detail",
                                                    style: TextStyle(
                                                      color: Get
                                                          .theme.primaryColor,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox.shrink(),
                                      ],
                                    ),
                                    expanded: Text(
                                      controller.pageModel.reviews[0]
                                          .ratingProductComment,
                                      softWrap: true,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Text('Tidak ada data');
                          },
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 8,
                  color: Colors.grey[100],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                    bottom: 70,
                  ),
                  child: Column(
                    children: [
                      Obx(() {
                        return SectionHeading(
                          heading: 'Produk Terkait',
                          onPressed: (controller.loading.value) ? null : () {},
                        );
                      }),
                      SizedBox(height: 15),
                      Obx(() {
                        return SizedBox(
                          height: 265,
                          child: ListView.builder(
                            itemCount: (controller.loading.value)
                                ? 2
                                : controller.pageModel.relatedProducts.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return (controller.loading.value)
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        right:
                                            (index >= 0 && index != 1) ? 10 : 0,
                                      ),
                                      child: ShimmerLoader(
                                        radius: 15,
                                        width: (Get.size.width - 40) / 2,
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(
                                        right: (index >= 0 &&
                                                index !=
                                                    (controller
                                                            .pageModel
                                                            .relatedProducts
                                                            .length -
                                                        1))
                                            ? 10
                                            : 0,
                                      ),
                                      child: ProductItem(
                                        onTap: () {
                                          controller.routeToProductDetailPage(
                                              controller.pageModel.product);
                                        },
                                        product: controller
                                            .pageModel.relatedProducts[index],
                                      ),
                                    );
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              color: Colors.grey[50],
              child: Ink(
                height: 56,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(() {
                        return Ink(
                          color: (controller.loading.value)
                              ? Colors.grey
                              : Colors.green,
                          child: InkWell(
                            onTap: (controller.loading.value) ? null : () {},
                            child: Center(
                              child: Text(
                                'Beli Langsung',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Ink(
                              child: Obx(() {
                                return InkWell(
                                  onTap:
                                      (controller.loading.value) ? null : () {},
                                  child: Center(
                                    child: Icon(
                                      Icons.remove_rounded,
                                      color: (controller.loading.value)
                                          ? Colors.grey
                                          : Colors.red,
                                      size: 30,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          Expanded(
                            child: Obx(() {
                              return (controller.loading.value)
                                  ? Center(
                                      child: CircularLoader(
                                        width: 25,
                                        height: 25,
                                      ),
                                    )
                                  : TextField(
                                      controller: controller.qtyField,
                                      cursorColor: Colors.grey[600],
                                      cursorWidth: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      onSubmitted: (value) {},
                                    );
                            }),
                          ),
                          Expanded(
                            child: Ink(
                              child: Obx(() {
                                return InkWell(
                                  onTap:
                                      (controller.loading.value) ? null : () {},
                                  child: Center(
                                    child: Icon(
                                      Icons.add_rounded,
                                      color: (controller.loading.value)
                                          ? Colors.grey
                                          : Colors.green,
                                      size: 30,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
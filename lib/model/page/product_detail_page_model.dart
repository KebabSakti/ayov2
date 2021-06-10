import 'package:ayov2/model/model.dart';

class ProductDetailPageModel {
  ProductModel product;
  List<RatingProductModel> reviews;
  List<ProductModel> relatedProducts;

  ProductDetailPageModel({
    this.product,
    this.reviews = const [],
    this.relatedProducts = const [],
  });

  ProductDetailPageModel copyWith({
    ProductModel product,
    List<RatingProductModel> reviews,
    List<ProductModel> relatedProducts,
  }) =>
      ProductDetailPageModel(
        product: product ?? this.product,
        reviews: reviews ?? this.reviews,
        relatedProducts: relatedProducts ?? this.relatedProducts,
      );
}

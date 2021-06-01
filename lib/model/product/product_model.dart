import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(nullable: true)
class ProductModel {
  @JsonKey(name: 'category_id', nullable: false)
  String categoryId;
  @JsonKey(name: 'sub_category_id', nullable: false)
  String subCategoryId;
  @JsonKey(name: 'product_id', nullable: false)
  String productId;
  @JsonKey(name: 'product_is_exclusive', nullable: true)
  int productIsExclusive;
  @JsonKey(name: 'product_delivery_type', nullable: true)
  String productDeliveryType;
  @JsonKey(name: 'product_deeplin', nullable: true)
  String productDeeplink;
  @JsonKey(name: 'product_name', nullable: true)
  String productName;
  @JsonKey(name: 'product_description', nullable: true)
  String productDescription;
  @JsonKey(name: 'product_cover', nullable: true)
  String productCover;
  @JsonKey(name: 'product_prive', nullable: true)
  double productPrice;
  @JsonKey(name: 'product_point', nullable: true)
  int productPoint;
  @JsonKey(name: 'product_view', nullable: true)
  int productView;
  @JsonKey(name: 'product_sold', nullable: true)
  int productSold;
  @JsonKey(name: 'product_search', nullable: true)
  int productSearch;
  @JsonKey(name: 'product_rating_count', nullable: true)
  int productRatingCount;
  @JsonKey(name: 'product_rating_value', nullable: true)
  double productRatingValue;
  @JsonKey(name: 'product_active', nullable: true)
  int productActive;

  ProductModel({
    this.categoryId,
    this.subCategoryId,
    this.productId,
    this.productIsExclusive,
    this.productDeliveryType,
    this.productDeeplink,
    this.productName,
    this.productDescription,
    this.productCover,
    this.productPrice,
    this.productPoint,
    this.productView,
    this.productSold,
    this.productSearch,
    this.productRatingCount,
    this.productRatingValue,
    this.productActive,
  });

  ProductModel copyWith({
    String categoryId,
    String subCategoryId,
    String productId,
    int productIsExclusive,
    String productDeliveryType,
    String productDeeplink,
    String productName,
    String productDescription,
    String productCover,
    double productPrice,
    int productPoint,
    int productView,
    int productSold,
    int productSearch,
    int productRatingCount,
    double productRatingValue,
    int productActive,
  }) =>
      ProductModel(
        categoryId: categoryId ?? this.categoryId,
        subCategoryId: subCategoryId ?? this.subCategoryId,
        productId: productId ?? this.productId,
        productIsExclusive: productIsExclusive ?? this.productIsExclusive,
        productDeliveryType: productDeliveryType ?? this.productDeliveryType,
        productDeeplink: productDeeplink ?? this.productDeeplink,
        productName: productName ?? this.productName,
        productDescription: productDescription ?? this.productDescription,
        productCover: productCover ?? this.productCover,
        productPrice: productPrice ?? this.productPrice,
        productPoint: productPoint ?? this.productPoint,
        productView: productView ?? this.productView,
        productSold: productSold ?? this.productSold,
        productSearch: productSearch ?? this.productSearch,
        productRatingCount: productRatingCount ?? this.productRatingCount,
        productRatingValue: productRatingValue ?? this.productRatingValue,
        productActive: productActive ?? this.productActive,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

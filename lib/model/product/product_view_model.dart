import 'package:json_annotation/json_annotation.dart';

part 'product_view_model.g.dart';

@JsonSerializable(nullable: true)
class ProductViewModel {
  ProductViewModel({
    this.customerId,
    this.productId,
    this.productViewId,
    this.productViewCount,
    this.productCover,
  });

  @JsonKey(name: 'customer_id', nullable: false)
  String customerId;
  @JsonKey(name: 'product_id', nullable: false)
  String productId;
  @JsonKey(name: 'product_view_id', nullable: false)
  String productViewId;
  @JsonKey(name: 'product_view_count', nullable: true)
  int productViewCount;
  @JsonKey(name: 'product_cover', nullable: true)
  String productCover;

  ProductViewModel copyWith({
    String customerId,
    String productId,
    String productViewId,
    int productViewCount,
    DateTime createdAt,
    DateTime updatedAt,
    String productCover,
  }) =>
      ProductViewModel(
        customerId: customerId ?? this.customerId,
        productId: productId ?? this.productId,
        productViewId: productViewId ?? this.productViewId,
        productViewCount: productViewCount ?? this.productViewCount,
        productCover: productCover ?? this.productCover,
      );

  factory ProductViewModel.fromJson(Map<String, dynamic> json) =>
      _$ProductViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductViewModelToJson(this);
}

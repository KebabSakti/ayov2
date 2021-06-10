import 'package:json_annotation/json_annotation.dart';

part 'rating_product_model.g.dart';

@JsonSerializable(nullable: true)
class RatingProductModel {
  RatingProductModel({
    this.customerId,
    this.productId,
    this.ratingProductId,
    this.ratingProductValue,
    this.ratingProductComment,
    this.customerName,
  });

  @JsonKey(name: 'customer_id', nullable: false)
  String customerId;
  @JsonKey(name: 'product_id', nullable: false)
  String productId;
  @JsonKey(name: 'rating_product_id', nullable: false)
  String ratingProductId;
  @JsonKey(name: 'rating_product_value', nullable: true)
  String ratingProductValue;
  @JsonKey(name: 'rating_product_comment', nullable: true)
  String ratingProductComment;
  @JsonKey(name: 'customer_name', nullable: true)
  String customerName;

  RatingProductModel copyWith({
    String customerId,
    String productId,
    String ratingProductId,
    String ratingProductValue,
    String ratingProductComment,
    String customerName,
  }) =>
      RatingProductModel(
        customerId: customerId ?? this.customerId,
        productId: productId ?? this.productId,
        ratingProductId: ratingProductId ?? this.ratingProductId,
        ratingProductValue: ratingProductValue ?? this.ratingProductValue,
        ratingProductComment: ratingProductComment ?? this.ratingProductComment,
        customerName: customerName ?? this.customerName,
      );

  factory RatingProductModel.fromJson(Map<String, dynamic> json) =>
      _$RatingProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingProductModelToJson(this);
}

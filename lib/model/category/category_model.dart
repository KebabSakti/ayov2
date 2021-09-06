import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(nullable: true)
class CategoryModel {
  @JsonKey(name: 'category_id', nullable: false)
  String categoryId;
  @JsonKey(name: 'category_name', nullable: true)
  String categoryName;
  @JsonKey(name: 'category_image', nullable: true)
  String categoryImage;
  @JsonKey(name: 'category_view', nullable: true)
  int categoryView;
  @JsonKey(name: 'category_depplink', nullable: true)
  String categoryDeeplink;
  @JsonKey(name: 'category_active', nullable: true)
  int categoryActive;
  @JsonKey(name: 'category_order', nullable: true)
  int categoryOrder;
  @JsonKey(name: 'category_group', nullable: true)
  String categoryGroup;
  @JsonKey(name: 'category_description', nullable: true)
  String categoryDescription;

  CategoryModel({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.categoryView,
    this.categoryDeeplink,
    this.categoryActive,
    this.categoryGroup,
    this.categoryOrder,
    this.categoryDescription,
  });

  CategoryModel copyWith({
    String categoryId,
    String categoryName,
    String categoryImage,
    int categoryView,
    String categoryDeeplink,
    int categoryActive,
    int categoryOrder,
    String categoryGroup,
    String categoryDescription,
  }) =>
      CategoryModel(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        categoryImage: categoryImage ?? this.categoryImage,
        categoryView: categoryView ?? this.categoryView,
        categoryDeeplink: categoryDeeplink ?? this.categoryDeeplink,
        categoryActive: categoryActive ?? this.categoryActive,
        categoryGroup: categoryGroup ?? this.categoryGroup,
        categoryOrder: categoryOrder ?? this.categoryOrder,
        categoryDescription: categoryDescription ?? this.categoryDescription,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

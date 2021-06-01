import 'package:json_annotation/json_annotation.dart';

part 'sub_category_model.g.dart';

@JsonSerializable(nullable: true)
class SubCategoryModel {
  @JsonKey(name: 'category_id', nullable: false)
  String categoryId;
  @JsonKey(name: 'sub_category_id', nullable: false)
  String subCategoryId;
  @JsonKey(name: 'sub_category_name', nullable: true)
  String subCategoryName;
  @JsonKey(name: 'sub_category_image', nullable: true)
  String subCategoryImage;
  @JsonKey(name: 'sub_category_view', nullable: true)
  int subCategoryView;
  @JsonKey(name: 'sub_category_deeplink', nullable: true)
  String subCategoryDeeplink;
  @JsonKey(name: 'sub_category_active', nullable: true)
  int subCategoryActive;

  SubCategoryModel({
    this.categoryId,
    this.subCategoryName,
    this.subCategoryImage,
    this.subCategoryView,
    this.subCategoryDeeplink,
    this.subCategoryActive,
  });

  SubCategoryModel copyWith({
    String categoryId,
    String categoryName,
    String categoryImage,
    int categoryView,
    String categoryDeeplink,
    int categoryActive,
  }) =>
      SubCategoryModel(
        categoryId: categoryId ?? this.categoryId,
        subCategoryName: categoryName ?? this.subCategoryName,
        subCategoryImage: categoryImage ?? this.subCategoryImage,
        subCategoryView: categoryView ?? this.subCategoryView,
        subCategoryDeeplink: categoryDeeplink ?? this.subCategoryDeeplink,
        subCategoryActive: categoryActive ?? this.subCategoryActive,
      );

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);
}

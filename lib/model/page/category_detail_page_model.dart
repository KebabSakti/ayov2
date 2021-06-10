import 'package:ayov2/model/category/category_model.dart';
import 'package:ayov2/model/category/sub_category_model.dart';
import 'package:ayov2/model/model.dart';

class CategoryDetailPageModel {
  CategoryModel category;
  BannerPrimaryModel bannerPrimary;
  List<BannerSecondaryModel> bannerSecondaries;
  List<SubCategoryModel> subCategories;

  CategoryDetailPageModel({
    this.category,
    this.bannerPrimary,
    this.bannerSecondaries = const [],
    this.subCategories = const [],
  });

  CategoryDetailPageModel copyWith({
    CategoryModel category,
    BannerPrimaryModel bannerPrimary,
    List<BannerSecondaryModel> bannerSecondaries,
    List<SubCategoryModel> subCategories,
  }) =>
      CategoryDetailPageModel(
        category: category ?? this.category,
        bannerPrimary: bannerPrimary ?? this.bannerPrimary,
        bannerSecondaries: bannerSecondaries ?? this.bannerSecondaries,
        subCategories: subCategories ?? this.subCategories,
      );
}

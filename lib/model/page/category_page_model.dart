import 'package:ayov2/model/category/category_model.dart';
import 'package:ayov2/model/category/sub_category_model.dart';

class CategoryPageModel {
  List<CategoryModel> categories;
  List<SubCategoryModel> subCategories;

  CategoryPageModel({
    this.categories = const [],
    this.subCategories = const [],
  });

  CategoryPageModel copyWith({
    List<CategoryModel> categories,
    List<SubCategoryModel> subCategories,
  }) =>
      CategoryPageModel(
        categories: categories ?? this.categories,
        subCategories: subCategories ?? this.subCategories,
      );
}

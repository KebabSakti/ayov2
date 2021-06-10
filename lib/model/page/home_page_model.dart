import 'package:ayov2/model/model.dart';

class HomePageModel {
  List<BannerPrimaryModel> bannerPrimaryModel;
  List<BannerSecondaryModel> bannerSecondaryModel;
  List<CategoryModel> categoryModel;
  List<SubCategoryModel> subCategoryModel;
  List<VoucherModel> voucherModel;
  List<ProductModel> productPopularModel;
  List<ProductModel> productModel;
  List<SearchModel> mostSearch;
  ProductPaginateModel productPaginateModel;

  HomePageModel({
    this.bannerPrimaryModel,
    this.bannerSecondaryModel,
    this.categoryModel,
    this.subCategoryModel,
    this.voucherModel,
    this.productPopularModel,
    this.productModel,
    this.mostSearch,
    this.productPaginateModel,
  });

  HomePageModel copyWith({
    List<BannerPrimaryModel> bannerPrimaryModel,
    List<BannerSecondaryModel> bannerSecondaryModel,
    List<CategoryModel> categoryModel,
    List<SubCategoryModel> subCategoryModel,
    List<VoucherModel> voucherModel,
    List<ProductModel> productPopularModel,
    List<ProductModel> productModel,
    List<SearchModel> mostSearch,
    ProductPaginateModel productPaginateModel,
  }) =>
      HomePageModel(
        bannerPrimaryModel: bannerPrimaryModel ?? this.bannerPrimaryModel,
        bannerSecondaryModel: bannerSecondaryModel ?? this.bannerSecondaryModel,
        categoryModel: categoryModel ?? this.categoryModel,
        subCategoryModel: subCategoryModel ?? this.subCategoryModel,
        voucherModel: voucherModel ?? this.voucherModel,
        productPopularModel: productPopularModel ?? this.productPopularModel,
        productModel: productModel ?? this.productModel,
        mostSearch: mostSearch ?? this.mostSearch,
        productPaginateModel: productPaginateModel ?? this.productPaginateModel,
      );
}

import 'package:ayov2/model/model.dart';

class HomePageModel {
  List<BannerPrimaryModel> bannerPrimaryModel;
  List<CategoryModel> categoryModel;
  List<VoucherModel> voucherModel;
  List<ProductModel> productPopularModel;
  List<ProductModel> productModel;
  List<SearchModel> mostSearch;
  ProductPaginateModel productPaginateModel;

  HomePageModel({
    this.bannerPrimaryModel,
    this.categoryModel,
    this.voucherModel,
    this.productPopularModel,
    this.productModel,
    this.mostSearch,
    this.productPaginateModel,
  });

  HomePageModel copyWith({
    List<BannerPrimaryModel> bannerPrimaryModel,
    List<CategoryModel> categoryModel,
    List<VoucherModel> voucherModel,
    List<ProductModel> productPopularModel,
    List<ProductModel> productModel,
    List<SearchModel> mostSearch,
    ProductPaginateModel productPaginateModel,
  }) =>
      HomePageModel(
        bannerPrimaryModel: bannerPrimaryModel ?? this.bannerPrimaryModel,
        categoryModel: categoryModel ?? this.categoryModel,
        voucherModel: voucherModel ?? this.voucherModel,
        productPopularModel: productPopularModel ?? this.productPopularModel,
        productModel: productModel ?? this.productModel,
        mostSearch: mostSearch ?? this.mostSearch,
        productPaginateModel: productPaginateModel ?? this.productPaginateModel,
      );
}

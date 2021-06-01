import 'package:ayov2/model/model.dart';

class HomePageModel {
  List<BannerPrimaryModel> bannerPrimaryModel;
  List<CategoryModel> categoryModel;
  List<VoucherModel> voucherModel;
  List<ProductModel> productPopularModel;
  List<ProductModel> productModel;

  HomePageModel({
    this.bannerPrimaryModel,
    this.categoryModel,
    this.voucherModel,
    this.productPopularModel,
    this.productModel,
  });

  HomePageModel copyWith({
    List<BannerPrimaryModel> bannerPrimaryModel,
    List<CategoryModel> categoryModel,
    List<VoucherModel> voucherModel,
    List<ProductModel> productPopularModel,
    List<ProductModel> productModel,
  }) =>
      HomePageModel(
        bannerPrimaryModel: bannerPrimaryModel ?? this.bannerPrimaryModel,
        categoryModel: categoryModel ?? this.categoryModel,
        voucherModel: voucherModel ?? this.voucherModel,
        productPopularModel: productPopularModel ?? this.productPopularModel,
        productModel: productModel ?? this.productModel,
      );
}

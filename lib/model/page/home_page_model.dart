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
  List<CartItemModel> cartItems;
  List<BundleModel> bundles;
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
    this.cartItems,
    this.bundles,
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
    List<CartItemModel> cartItems,
    List<BundleModel> bundles,
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
        cartItems: cartItems ?? this.cartItems,
        bundles: bundles ?? this.bundles,
        productPaginateModel: productPaginateModel ?? this.productPaginateModel,
      );
}

import 'dart:convert';

import 'package:ayov2/model/model.dart';
import 'package:ayov2/repo/repo.dart';

class AppPageData {
  final AppPageRepo _appPageRepo = AppPageRepo();

  Future<HomePageModel> home() async {
    var response = await _appPageRepo.home();

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    List<BannerPrimaryModel> bannerPrimaries = List<BannerPrimaryModel>.from(
      parsedData['data']['banner_primary'].map(
        (item) => BannerPrimaryModel.fromJson(item),
      ),
    );

    List<CategoryModel> categories = List<CategoryModel>.from(
      parsedData['data']['category'].map(
        (item) => CategoryModel.fromJson(item),
      ),
    );

    List<VoucherModel> vouchers = List<VoucherModel>.from(
      parsedData['data']['voucher'].map(
        (item) => VoucherModel.fromJson(item),
      ),
    );

    List<ProductModel> productPopulars = List<ProductModel>.from(
      parsedData['data']['product_popular'].map(
        (item) => ProductModel.fromJson(item),
      ),
    );

    List<ProductModel> products = List<ProductModel>.from(
      parsedData['data']['product'].map(
        (item) => ProductModel.fromJson(item),
      ),
    );

    return HomePageModel(
      bannerPrimaryModel: bannerPrimaries,
      categoryModel: categories,
      voucherModel: vouchers,
      productPopularModel: productPopulars,
      productModel: products,
    );
  }
}

import 'dart:convert';

import 'package:ayov2/model/model.dart';
import 'package:ayov2/repo/repo.dart';

class ProductData {
  final ProductRepo _productRepo = ProductRepo();

  Future<ProductPaginateModel> product(
    String urlQuery, {
    String deliveryType,
    String category,
    String subCategory,
    String productId,
    String keyword,
    bool discount,
    bool lowPrice,
    bool highPrice,
    bool highPoint,
    bool highView,
    bool highSell,
    bool highRatingCount,
    bool highRatingValue,
    bool highSearch,
  }) async {
    var response = await _productRepo.product(
      urlQuery,
      deliveryType: deliveryType,
      category: category,
      subCategory: subCategory,
      productId: productId,
      keyword: keyword,
      discount: discount,
      lowPrice: lowPrice,
      highPrice: highPrice,
      highPoint: highPoint,
      highView: highView,
      highSell: highSell,
      highRatingCount: highRatingCount,
      highRatingValue: highRatingValue,
      highSearch: highSearch,
    );

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    List<ProductModel> products = List<ProductModel>.from(
      await parsedData['data']['data'].map(
        (item) => ProductModel.fromJson(item),
      ),
    );

    PaginationModel paginateProduct =
        PaginationModel.fromJson(await parsedData['data']);

    //PRODUCT WITH PAGINATION DATA
    ProductPaginateModel productPaginateModel = ProductPaginateModel(
      products: products,
      pagination: paginateProduct,
    );

    return productPaginateModel;
  }
}

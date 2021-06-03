import 'package:ayov2/data/data.dart';
import 'package:ayov2/model/model.dart';

class Product {
  final ProductData _productData = ProductData();

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
    return await _productData.product(
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
  }
}

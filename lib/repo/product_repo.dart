import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/service/service.dart';
import 'package:get/get.dart';

class ProductRepo {
  final Network _network = Get.find();
  final AppPreference _appPreference = Get.find();

  Future<dynamic> product(
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
    var response = await _network.action(Methods.POST, PRODUCT_API + urlQuery,
        authToken: await _appPreference.getUserToken(),
        data: {
          "delivery_type": deliveryType,
          "category": category,
          "sub_category": subCategory,
          "product_id": productId,
          "keyword": keyword,
          "discount": discount,
          "low_price": lowPrice,
          "high_price": highPrice,
          "high_point": highPoint,
          "high_view": highView,
          "high_sell": highSell,
          "high_rating_count": highRatingCount,
          "high_rating_value": highRatingValue,
          "high_search": highSearch,
        });

    return response;
  }
}

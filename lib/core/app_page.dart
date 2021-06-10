import 'package:ayov2/data/data.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/cupertino.dart';

class AppPage {
  final AppPageData _appPageData = AppPageData();

  Future<HomePageModel> home() async {
    return await _appPageData.home();
  }

  Future<SearchPageModel> search() async {
    return await _appPageData.search();
  }

  Future<ProductDetailPageModel> product({@required String productId}) async {
    return await _appPageData.product(productId: productId);
  }
}

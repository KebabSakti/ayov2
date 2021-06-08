import 'dart:convert';

import 'package:ayov2/model/model.dart';
import 'package:ayov2/repo/repo.dart';
import 'package:flutter/material.dart';

class SearchData {
  final SearchRepo _searchRepo = SearchRepo();

  Future<SearchResultModel> search({@required String keywrod}) async {
    var response = await _searchRepo.search(keyword: keywrod);

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    List<SearchModel> keywords = List<SearchModel>.from(
      await parsedData['data']['keywords'].map(
        (item) => SearchModel.fromJson(item),
      ),
    );

    List<ProductModel> products = List<ProductModel>.from(
      await parsedData['data']['products'].map(
        (item) => ProductModel.fromJson(item),
      ),
    );

    return SearchResultModel(
      keywords: keywords,
      products: products,
    );
  }
}

import 'package:ayov2/data/data.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/material.dart';

class Search {
  final SearchData _searchData = SearchData();

  Future<SearchResultModel> search({@required String keyword}) async {
    return await _searchData.search(keywrod: keyword);
  }
}

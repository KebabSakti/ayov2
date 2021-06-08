import 'package:ayov2/model/model.dart';

class SearchResultModel {
  SearchResultModel({
    this.keywords = const [],
    this.products = const [],
  });

  List<SearchModel> keywords;
  List<ProductModel> products;

  SearchResultModel copyWith({
    List<SearchModel> keywords,
    List<ProductModel> products,
  }) =>
      SearchResultModel(
        keywords: keywords ?? this.keywords,
        products: products ?? this.products,
      );
}

import 'package:ayov2/model/model.dart';

class SearchPageModel {
  SearchPageModel({
    this.productViews = const [],
    this.searchHistories = const [],
    this.popularSearches = const [],
  });

  List<ProductViewModel> productViews;
  List<SearchModel> searchHistories;
  List<SearchModel> popularSearches;

  SearchPageModel copyWith({
    List<ProductViewModel> productViews,
    List<SearchModel> searchHistories,
    List<SearchModel> popularSearches,
  }) =>
      SearchPageModel(
        productViews: productViews ?? this.productViews,
        searchHistories: searchHistories ?? this.searchHistories,
        popularSearches: popularSearches ?? this.popularSearches,
      );
}

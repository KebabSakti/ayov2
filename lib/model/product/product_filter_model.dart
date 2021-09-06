class ProductFilterModel {
  String deliveryType;
  String category;
  String subCategory;
  String productId;
  String keyword;
  String productPrice;
  String productTag;
  bool highRatingValue;
  bool discount;
  bool highPoint;
  bool highView;
  bool highSell;
  bool highRatingCount;
  bool highSearch;

  ProductFilterModel({
    this.deliveryType,
    this.category,
    this.subCategory,
    this.productId,
    this.keyword,
    this.productPrice,
    this.productTag,
    this.highRatingValue = false,
    this.discount = false,
    this.highPoint = false,
    this.highView = false,
    this.highSearch = false,
    this.highSell = false,
    this.highRatingCount = false,
  });

  ProductFilterModel copyWith({
    String deliveryType,
    String category,
    String subCategory,
    String productId,
    String keyword,
    String productPrice,
    String productTag,
    bool highRatingValue,
    bool discount,
    bool highPoint,
    bool highView,
    bool highSell,
    bool highRatingCount,
    bool highSearch,
  }) =>
      ProductFilterModel(
        deliveryType: deliveryType ?? this.deliveryType,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
        productId: productId ?? this.productId,
        keyword: keyword ?? this.keyword,
        discount: discount ?? this.discount,
        productPrice: productPrice ?? this.productPrice,
        productTag: productTag ?? this.productTag,
        highPoint: highPoint ?? this.highPoint,
        highView: highView ?? this.highView,
        highRatingCount: highRatingCount ?? highRatingCount,
        highRatingValue: highRatingValue ?? this.highRatingValue,
        highSearch: highSearch ?? this.highSearch,
        highSell: highSell ?? this.highSell,
      );
}

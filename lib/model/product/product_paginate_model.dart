import 'package:ayov2/model/model.dart';

class ProductPaginateModel {
  List<ProductModel> products;
  PaginationModel pagination;

  ProductPaginateModel({
    this.products = const <ProductModel>[],
    this.pagination,
  });

  ProductPaginateModel copyWith({
    List<ProductModel> products,
    PaginationModel pagination,
  }) =>
      ProductPaginateModel(
        products: products ?? this.products,
        pagination: pagination ?? this.pagination,
      );
}

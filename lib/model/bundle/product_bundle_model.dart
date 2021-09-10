import 'package:ayov2/model/bundle/bundle_model.dart';
import 'package:ayov2/model/model.dart';

class ProductBundleModel {
  BundleModel bundle;
  List<ProductModel> products;

  ProductBundleModel({this.bundle, this.products});

  ProductBundleModel copyWith({
    BundleModel bundle,
    List<ProductModel> products,
  }) =>
      ProductBundleModel(
        bundle: bundle ?? this.bundle,
        products: products ?? this.products,
      );
}

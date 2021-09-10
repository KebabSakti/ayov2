import 'package:ayov2/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bundle_model.g.dart';

@JsonSerializable(nullable: true)
class BundleModel {
  BundleModel({
    this.id,
    this.bundleId,
    this.bundleName,
    this.bundleDescription,
    this.bundleImage,
    this.bundleBackground,
    this.bundleShow,
    this.bundleActive,
    this.products,
  });

  @JsonKey(name: 'id', nullable: false)
  int id;
  @JsonKey(name: 'bundle_id', nullable: false)
  String bundleId;
  @JsonKey(name: 'bundle_name', nullable: true)
  String bundleName;
  @JsonKey(name: 'bundle_description', nullable: true)
  String bundleDescription;
  @JsonKey(name: 'bundle_image', nullable: true)
  String bundleImage;
  @JsonKey(name: 'bundle_background', nullable: false)
  String bundleBackground;
  @JsonKey(name: 'bundle_show', nullable: false)
  int bundleShow;
  @JsonKey(name: 'bundle_active', nullable: false)
  int bundleActive;
  @JsonKey(name: 'products', nullable: false)
  List<ProductModel> products;

  BundleModel copyWith({
    int id,
    String bundleId,
    String bundleName,
    String bundleDescription,
    String bundleImage,
    String bundleBackground,
    int bundleShow,
    int bundleActive,
  }) =>
      BundleModel(
        id: id ?? this.id,
        bundleId: bundleId ?? this.bundleId,
        bundleName: bundleName ?? this.bundleName,
        bundleDescription: bundleDescription ?? this.bundleDescription,
        bundleImage: bundleImage ?? this.bundleImage,
        bundleBackground: bundleBackground ?? this.bundleBackground,
        bundleShow: bundleShow ?? this.bundleShow,
        bundleActive: bundleActive ?? this.bundleActive,
        products: products ?? this.products,
      );

  factory BundleModel.fromJson(Map<String, dynamic> json) =>
      _$BundleModelFromJson(json);

  Map<String, dynamic> toJson() => _$BundleModelToJson(this);
}

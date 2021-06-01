import 'package:json_annotation/json_annotation.dart';

part 'banner_secondary_model.g.dart';

@JsonSerializable(nullable: true)
class BannerSecondaryModel {
  @JsonKey(name: 'category_id', nullable: false)
  String categoryId;
  @JsonKey(name: 'banner_secondary_id', nullable: false)
  String bannerSecondaryid;
  @JsonKey(name: 'banner_secondary_image', nullable: true)
  String bannerSecondaryImage;
  @JsonKey(name: 'banner_secondary_link', nullable: true)
  String bannerSecondaryLink;
  @JsonKey(name: 'banner_secondary_target', nullable: true)
  String bannerSecondaryTarget;

  BannerSecondaryModel({
    this.categoryId,
    this.bannerSecondaryid,
    this.bannerSecondaryImage,
    this.bannerSecondaryLink,
    this.bannerSecondaryTarget,
  });

  BannerSecondaryModel copyWith({
    String categoryId,
    String bannerSecondaryid,
    String bannerSecondaryImage,
    String bannerSecondaryLink,
    String bannerSecondaryTarget,
  }) =>
      BannerSecondaryModel(
        categoryId: categoryId ?? this.categoryId,
        bannerSecondaryid: bannerSecondaryid ?? this.bannerSecondaryid,
        bannerSecondaryImage: bannerSecondaryImage ?? this.bannerSecondaryImage,
        bannerSecondaryLink: bannerSecondaryLink ?? this.bannerSecondaryLink,
        bannerSecondaryTarget:
            bannerSecondaryTarget ?? this.bannerSecondaryTarget,
      );

  factory BannerSecondaryModel.fromJson(Map<String, dynamic> json) =>
      _$BannerSecondaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerSecondaryModelToJson(this);
}

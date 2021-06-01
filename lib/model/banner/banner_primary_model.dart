import 'package:json_annotation/json_annotation.dart';

part 'banner_primary_model.g.dart';

@JsonSerializable(nullable: true)
class BannerPrimaryModel {
  @JsonKey(name: 'banner_primary_id', nullable: false)
  String bannerPrimaryid;
  @JsonKey(name: 'banner_primary_image', nullable: true)
  String bannerPrimaryImage;
  @JsonKey(name: 'banner_primary_link', nullable: true)
  String bannerPrimaryLink;
  @JsonKey(name: 'banner_primary_target', nullable: true)
  String bannerPrimaryTarget;

  BannerPrimaryModel({
    this.bannerPrimaryid,
    this.bannerPrimaryImage,
    this.bannerPrimaryLink,
    this.bannerPrimaryTarget,
  });

  BannerPrimaryModel copyWith({
    String bannerPrimaryid,
    String bannerPrimaryImage,
    String bannerPrimaryLink,
    String bannerPrimaryTarget,
  }) =>
      BannerPrimaryModel(
        bannerPrimaryid: bannerPrimaryid ?? this.bannerPrimaryid,
        bannerPrimaryImage: bannerPrimaryImage ?? this.bannerPrimaryImage,
        bannerPrimaryLink: bannerPrimaryLink ?? this.bannerPrimaryLink,
        bannerPrimaryTarget: bannerPrimaryTarget ?? this.bannerPrimaryTarget,
      );

  factory BannerPrimaryModel.fromJson(Map<String, dynamic> json) =>
      _$BannerPrimaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerPrimaryModelToJson(this);
}

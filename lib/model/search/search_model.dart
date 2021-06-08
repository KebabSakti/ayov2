import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable(nullable: true)
class SearchModel {
  @JsonKey(name: 'customer_id', nullable: false)
  String customerId;
  @JsonKey(name: 'search_id', nullable: false)
  String searchId;
  @JsonKey(name: 'search_keyword', nullable: true)
  String searchKeyword;
  @JsonKey(name: 'search_image', nullable: true)
  String searchImage;
  @JsonKey(name: 'search_count', nullable: true)
  int searchCount;

  SearchModel({
    this.customerId,
    this.searchId,
    this.searchKeyword,
    this.searchImage,
    this.searchCount,
  });

  SearchModel copyWith({
    String customerId,
    String searchId,
    String searchKeyword,
    String searchImage,
    int searchCount,
  }) =>
      SearchModel(
        customerId: customerId ?? this.customerId,
        searchId: searchId ?? this.searchId,
        searchKeyword: searchKeyword ?? this.searchKeyword,
        searchImage: searchImage ?? this.searchImage,
        searchCount: searchCount ?? this.searchCount,
      );

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}

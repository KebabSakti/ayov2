import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable(nullable: true)
class PaginationModel {
  @JsonKey(name: 'current_page', nullable: true)
  int currentPage;
  @JsonKey(name: 'per_page', nullable: true)
  int perPage;
  @JsonKey(name: 'to', nullable: true)
  int to;
  @JsonKey(name: 'from', nullable: true)
  int from;
  @JsonKey(name: 'first_page_url', nullable: true)
  String firstPageUrl;
  @JsonKey(name: 'next_page_url', nullable: true)
  String nextPageUrl;
  @JsonKey(name: 'prev_page_url', nullable: true)
  String prevPageUrl;
  @JsonKey(name: 'path', nullable: true)
  String path;

  PaginationModel({
    this.currentPage,
    this.perPage,
    this.to,
    this.from,
    this.firstPageUrl,
    this.nextPageUrl,
    this.prevPageUrl,
    this.path,
  });

  PaginationModel copyWith({
    int currentPage,
    int perPage,
    int to,
    int from,
    String firstPageUrl,
    String nextPageUrl,
    String prevPageUrl,
    String path,
  }) =>
      PaginationModel(
        currentPage: currentPage ?? this.currentPage,
        perPage: perPage ?? this.perPage,
        to: to ?? this.to,
        from: from ?? this.from,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        path: path ?? this.path,
      );

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}

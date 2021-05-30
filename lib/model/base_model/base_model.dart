import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable(nullable: false)
class BaseModel {
  bool success;
  String message;
  @JsonKey(nullable: true)
  dynamic data;

  BaseModel(this.success, this.message);

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable(nullable: true)
class CustomerModel {
  @JsonKey(name: 'customer_id', nullable: false)
  String customerId;
  @JsonKey(name: 'customer_phone', nullable: true)
  String customerPhone;
  @JsonKey(name: 'customer_name', nullable: true)
  String customerName;
  @JsonKey(name: 'customer_email', nullable: true)
  String customerEmail;
  @JsonKey(name: 'customer_password', nullable: true)
  String customerPassword;
  @JsonKey(name: 'customer_fcm', nullable: true)
  String customerFcm;
  @JsonKey(name: 'customer_point', defaultValue: 0)
  int customerPoint;
  @JsonKey(name: 'customer_is_active', nullable: false)
  int customerIsActive;
  @JsonKey(name: 'token', nullable: true)
  String customerToken;

  CustomerModel({
    this.customerId,
    this.customerPhone,
    this.customerName,
    this.customerEmail,
    this.customerPassword,
    this.customerFcm,
    this.customerPoint,
    this.customerIsActive,
    this.customerToken,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}

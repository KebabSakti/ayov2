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

  CustomerModel copyWith({
    String customerId,
    String customerPhone,
    String customerName,
    String customerEmail,
    String customerPassword,
    String customerFcm,
    int customerPoint,
    int customerIsActive,
    String customerToken,
  }) =>
      CustomerModel(
        customerId: customerId ?? this.customerId,
        customerPhone: customerPhone ?? this.customerPhone,
        customerName: customerName ?? this.customerName,
        customerEmail: customerEmail ?? this.customerEmail,
        customerPassword: customerPassword ?? this.customerPassword,
        customerFcm: customerFcm ?? this.customerFcm,
        customerPoint: customerPoint ?? this.customerPoint,
        customerIsActive: customerIsActive ?? this.customerIsActive,
        customerToken: customerToken ?? this.customerToken,
      );

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}

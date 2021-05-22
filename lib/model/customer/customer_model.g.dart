// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return CustomerModel(
    customerId: json['customer_id'] as String,
    customerPhone: json['customer_phone'] as String,
    customerName: json['customer_name'] as String,
    customerEmail: json['customer_email'] as String,
    customerPassword: json['customer_password'] as String,
    customerFcm: json['customer_fcm'] as String,
    customerPoint: json['customer_point'] as int ?? 0,
    customerIsActive: json['customer_is_active'] as int,
    customerToken: json['token'] as String,
  );
}

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'customer_phone': instance.customerPhone,
      'customer_name': instance.customerName,
      'customer_email': instance.customerEmail,
      'customer_password': instance.customerPassword,
      'customer_fcm': instance.customerFcm,
      'customer_point': instance.customerPoint,
      'customer_is_active': instance.customerIsActive,
      'token': instance.customerToken,
    };

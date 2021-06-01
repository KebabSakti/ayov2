// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherModel _$VoucherModelFromJson(Map<String, dynamic> json) {
  return VoucherModel(
    voucherId: json['voucher_id'] as String,
    voucherCode: json['voucher_code'] as String,
    voucherAmount: json['voucher_amount'] as String,
    voucherImage: json['voucher_image'] as String,
    voucherDescription: json['voucher_description'] as String,
    voucherStart: DateTime.parse(json['voucher_start'] as String),
    voucherEnd: DateTime.parse(json['voucher_end'] as String),
    voucherLimit: json['voucher_limit'] as int,
  );
}

Map<String, dynamic> _$VoucherModelToJson(VoucherModel instance) =>
    <String, dynamic>{
      'voucher_id': instance.voucherId,
      'voucher_code': instance.voucherCode,
      'voucher_amount': instance.voucherAmount,
      'voucher_image': instance.voucherImage,
      'voucher_description': instance.voucherDescription,
      'voucher_start': instance.voucherStart.toIso8601String(),
      'voucher_end': instance.voucherEnd.toIso8601String(),
      'voucher_limit': instance.voucherLimit,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherHistoryModel _$VoucherHistoryModelFromJson(Map<String, dynamic> json) {
  return VoucherHistoryModel(
    voucherId: json['voucher_id'] as String,
    customerId: json['customer_id'] as String,
    orderId: json['order_id'] as String,
    voucherHistoryId: json['voucher_history_id'] as String,
  );
}

Map<String, dynamic> _$VoucherHistoryModelToJson(
        VoucherHistoryModel instance) =>
    <String, dynamic>{
      'voucher_id': instance.voucherId,
      'customer_id': instance.customerId,
      'order_id': instance.orderId,
      'voucher_history_id': instance.voucherHistoryId,
    };

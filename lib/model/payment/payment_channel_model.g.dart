// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_channel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentChannelModel _$PaymentChannelModelFromJson(Map<String, dynamic> json) {
  return PaymentChannelModel(
    id: json['id'] as int,
    paymentChannelId: json['payment_channel_id'] as String,
    paymentChannelCode: json['payment_channel_code)'] as String,
    paymentChannelName: json['payment_channel_name)'] as String,
    paymentChannelIcon: json['payment_channel_icon)'] as String,
    paymentChannelNote: json['payment_channel_note)'] as String,
    paymentChannelActive: json['payment_channel_active)'] as int,
  );
}

Map<String, dynamic> _$PaymentChannelModelToJson(
        PaymentChannelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment_channel_id': instance.paymentChannelId,
      'payment_channel_code)': instance.paymentChannelCode,
      'payment_channel_name)': instance.paymentChannelName,
      'payment_channel_icon)': instance.paymentChannelIcon,
      'payment_channel_note)': instance.paymentChannelNote,
      'payment_channel_active)': instance.paymentChannelActive,
    };

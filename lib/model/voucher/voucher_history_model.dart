import 'package:json_annotation/json_annotation.dart';

part 'voucher_history_model.g.dart';

@JsonSerializable(nullable: true)
class VoucherHistoryModel {
  @JsonKey(name: 'voucher_id', nullable: false)
  String voucherId;
  @JsonKey(name: 'customer_id', nullable: false)
  String customerId;
  @JsonKey(name: 'order_id', nullable: false)
  String orderId;
  @JsonKey(name: 'voucher_history_id', nullable: false)
  String voucherHistoryId;

  VoucherHistoryModel({
    this.voucherId,
    this.customerId,
    this.orderId,
    this.voucherHistoryId,
  });

  VoucherHistoryModel copyWith({
    String voucherId,
    String customerId,
    String orderId,
    String voucherHistoryId,
  }) =>
      VoucherHistoryModel(
        voucherId: voucherId ?? this.voucherId,
        customerId: customerId ?? this.customerId,
        orderId: orderId ?? this.orderId,
        voucherHistoryId: voucherHistoryId ?? this.voucherHistoryId,
      );

  factory VoucherHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherHistoryModelToJson(this);
}

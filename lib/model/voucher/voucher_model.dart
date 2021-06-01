import 'package:json_annotation/json_annotation.dart';

part 'voucher_model.g.dart';

@JsonSerializable()
class VoucherModel {
  @JsonKey(name: 'voucher_id', nullable: false)
  String voucherId;
  @JsonKey(name: 'voucher_code', nullable: true)
  String voucherCode;
  @JsonKey(name: 'voucher_amount', nullable: false)
  String voucherAmount;
  @JsonKey(name: 'voucher_image', nullable: false)
  String voucherImage;
  @JsonKey(name: 'voucher_description', nullable: false)
  String voucherDescription;
  @JsonKey(name: 'voucher_start', nullable: false)
  DateTime voucherStart;
  @JsonKey(name: 'voucher_end', nullable: false)
  DateTime voucherEnd;
  @JsonKey(name: 'voucher_limit', nullable: false)
  int voucherLimit;

  VoucherModel({
    this.voucherId,
    this.voucherCode,
    this.voucherAmount,
    this.voucherImage,
    this.voucherDescription,
    this.voucherStart,
    this.voucherEnd,
    this.voucherLimit,
  });

  VoucherModel copyWith({
    String voucherId,
    String voucherCode,
    String voucherAmount,
    String voucherImage,
    String voucherDescription,
    DateTime voucherStart,
    DateTime voucherEnd,
    int voucherLimit,
  }) =>
      VoucherModel(
        voucherId: voucherId ?? this.voucherId,
        voucherCode: voucherCode ?? this.voucherCode,
        voucherAmount: voucherAmount ?? this.voucherAmount,
        voucherImage: voucherImage ?? this.voucherImage,
        voucherDescription: voucherDescription ?? this.voucherDescription,
        voucherStart: voucherStart ?? this.voucherStart,
        voucherEnd: voucherEnd ?? this.voucherEnd,
        voucherLimit: voucherLimit ?? this.voucherLimit,
      );

  factory VoucherModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherModelFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherModelToJson(this);
}

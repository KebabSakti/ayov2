import 'package:json_annotation/json_annotation.dart';

part 'payment_channel_model.g.dart';

@JsonSerializable(nullable: true)
class PaymentChannelModel {
  PaymentChannelModel({
    this.id,
    this.paymentChannelId,
    this.paymentChannelCode,
    this.paymentChannelName,
    this.paymentChannelIcon,
    this.paymentChannelNote,
    this.paymentChannelActive,
  });

  @JsonKey(name: 'id', nullable: false)
  int id;
  @JsonKey(name: 'payment_channel_id', nullable: false)
  String paymentChannelId;
  @JsonKey(name: 'payment_channel_code)', nullable: false)
  String paymentChannelCode;
  @JsonKey(name: 'payment_channel_name)', nullable: true)
  String paymentChannelName;
  @JsonKey(name: 'payment_channel_icon)', nullable: true)
  String paymentChannelIcon;
  @JsonKey(name: 'payment_channel_note)', nullable: true)
  String paymentChannelNote;
  @JsonKey(name: 'payment_channel_active)', nullable: true)
  int paymentChannelActive;

  PaymentChannelModel copyWith({
    int id,
    String paymentChannelId,
    String paymentChannelCode,
    String paymentChannelName,
    String paymentChannelIcon,
    String paymentChannelNote,
    int paymentChannelActive,
  }) =>
      PaymentChannelModel(
        id: id ?? this.id,
        paymentChannelId: paymentChannelId ?? this.paymentChannelId,
        paymentChannelCode: paymentChannelCode ?? this.paymentChannelCode,
        paymentChannelName: paymentChannelName ?? this.paymentChannelName,
        paymentChannelIcon: paymentChannelIcon ?? this.paymentChannelIcon,
        paymentChannelNote: paymentChannelNote ?? this.paymentChannelNote,
        paymentChannelActive: paymentChannelActive ?? this.paymentChannelActive,
      );

  factory PaymentChannelModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentChannelModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentChannelModelToJson(this);
}

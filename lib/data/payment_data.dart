import 'dart:convert';

import 'package:ayov2/model/model.dart';
import 'package:ayov2/repo/repo.dart';

class PaymentData {
  final PaymentRepo _paymentRepo = PaymentRepo();

  Future<List<PaymentChannelModel>> paymentChannel() async {
    var response = await _paymentRepo.paymentChannel();

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    List<PaymentChannelModel> paymentChannels = List<PaymentChannelModel>.from(
      await parsedData['data'].map(
        (item) => PaymentChannelModel.fromJson(item),
      ),
    );

    return paymentChannels;
  }
}

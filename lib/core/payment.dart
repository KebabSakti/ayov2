import 'package:ayov2/data/data.dart';
import 'package:ayov2/model/model.dart';

class Payment {
  final PaymentData _paymentData = PaymentData();

  Future<List<PaymentChannelModel>> cartUpdate() async {
    return await _paymentData.paymentChannel();
  }
}

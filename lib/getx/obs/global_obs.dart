import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class GlobalObs {
  final Rx<Preference> preferences = Preference(onboarding: false).obs;
  final Rx<CustomerModel> customerModel = CustomerModel().obs;
  final Rx<FcmModel> fcmModel = FcmModel().obs;
  final Rx<AuthStateModel> authState = AuthStateModel().obs;
  final RxList<CartItemModel> cartItems = List<CartItemModel>().obs;
}

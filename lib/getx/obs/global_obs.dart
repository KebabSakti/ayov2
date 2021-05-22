import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class GlobalObs {
  final Rx<Preference> preferences = Preference(onboarding: false).obs;
  final Rx<CustomerModel> customerModel = CustomerModel().obs;
}

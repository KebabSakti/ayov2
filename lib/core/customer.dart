import 'dart:convert';

import 'package:ayov2/model/model.dart';
import 'package:ayov2/repo/customer_repo.dart';
import 'package:flutter/material.dart';

class Customer {
  final CustomerRepo _customerRepo = CustomerRepo();

  Future<CustomerModel> register({
    @required String customerId,
    @required String customerPhone,
    @required String customerName,
    @required String customerEmail,
    @required String customerPassword,
  }) async {
    var response = await _customerRepo.register(
      customerId: customerId,
      customerPhone: customerPhone,
      customerName: customerName,
      customerEmail: customerEmail,
      customerPassword: customerPassword,
    );

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    return CustomerModel.fromJson(parsedData['data']);
  }

  Future<CustomerModel> user({@required String customerId}) async {
    var response = await _customerRepo.customer(customerId: customerId);

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    return CustomerModel.fromJson(parsedData['data']);
  }
}

import 'dart:convert';

import 'package:ayov2/model/model.dart';
import 'package:ayov2/repo/repo.dart';
import 'package:flutter/material.dart';

class PlacesData {
  final PlacesRepo _placesRepo = PlacesRepo();

  Future<List<PlacesModel>> index({String keyword}) async {
    var response = await _placesRepo.index(keyword: keyword);

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    List<PlacesModel> places = List<PlacesModel>.from(
      await parsedData['data'].map(
        (item) => PlacesModel.fromJson(item),
      ),
    );

    return places;
  }

  Future store({@required List<PlacesModel> places}) async {
    await _placesRepo.store(places: places);
  }
}

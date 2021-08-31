import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/service/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class PlacesRepo {
  final Network _network = Get.find();
  final AppPreference _appPreference = Get.find();

  Future<dynamic> index({String keyword}) async {
    var response = await _network.action(
      Methods.POST,
      PLACES_INDEX_API,
      authToken: await _appPreference.getUserToken(),
      data: {
        "keyword": keyword,
      },
    );

    return response;
  }

  Future store({@required List<PlacesModel> places}) async {
    await _network.action(
      Methods.POST,
      PLACES_STORE_API,
      authToken: await _appPreference.getUserToken(),
      data: dio.FormData.fromMap({
        "places": places
            .map((item) => {
                  'place_suggestion_place_id': item.placeSuggestionPlaceId,
                  'place_suggestion_latitude': item.placeSuggestionLatitude,
                  'place_suggestion_longitude': item.placeSuggestionLongitude,
                  'place_suggestion_street': item.placeSuggestionStreet,
                  'place_suggestion_sub_locality':
                      item.placeSuggestionSubLocality,
                  'place_suggestion_locality': item.placeSuggestionLocality,
                  'place_suggestion_sub_adm_area':
                      item.placeSuggestionSubAdmArea,
                  'place_suggestion_adm_area': item.placeSuggestionAdmArea,
                  'place_suggestion_postal_code':
                      item.placeSuggestionPostalCode,
                  'place_suggestion_country': item.placeSuggestionCountry,
                  'place_suggestion_description':
                      item.placeSuggestionDescription,
                })
            .toList(),
      }),
    );
  }
}

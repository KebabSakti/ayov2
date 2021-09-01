import 'package:ayov2/core/core.dart';
import 'package:ayov2/data/data.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryDetailPageController extends GetxController {
  final PlacesCore _placesCore = PlacesCore();
  final PlacesData _placesData = PlacesData();
  final TextEditingController searchField = TextEditingController();

  final RxBool loading = false.obs;
  final RxString keywords = ''.obs;
  final RxList<PlacesModel> suggestedPlaces = <PlacesModel>[].obs;

  void _searchFieldListener() {
    keywords(searchField.text);
  }

  void _placeAutoComplete() async {
    try {
      loading(true);

      List<PlacesModel> _places = <PlacesModel>[];

      _places =
          await _placesCore.placeAutoCompleteCache(keyword: keywords.value);

      if (_places.length == 0) {
        _places = await _placesCore
            .placeAutoComplete(keyword: keywords.value)
            .then((results) async {
          await _placesData.store(places: results);

          return results;
        });
      }

      suggestedPlaces.assignAll(_places);

      loading(false);
    } catch (e) {
      print(e);

      loading(false);
    }
  }

  void clearSearchField() {
    searchField.text = '';
    keywords('');
    suggestedPlaces([]);
  }

  String placeName(String value) {
    return value.substring(0, value.indexOf(','));
  }

  void _init() {
    searchField.addListener(_searchFieldListener);

    debounce(keywords, (value) {
      if (value.length > 0) {
        _placeAutoComplete();
      } else {
        clearSearchField();
      }
    }, time: Duration(milliseconds: 500));
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}

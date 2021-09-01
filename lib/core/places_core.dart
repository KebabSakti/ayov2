import 'package:ayov2/const/const.dart';
import 'package:ayov2/data/data.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/distance.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';

class PlacesCore {
  final PlacesData _placeData = PlacesData();

  Future<List<PlacesModel>> placeAutoComplete({
    String keyword,
    double locationLat = -0.49732531314209866,
    double locationLng = 117.14187383609166,
    num radius = 10000,
  }) async {
    final GoogleMapsPlaces _googlePlaces = GoogleMapsPlaces(apiKey: KEY);

    List<PlacesModel> _places = <PlacesModel>[];

    PlacesAutocompleteResponse _response = await _googlePlaces.autocomplete(
      keyword,
      location: Location(locationLat, locationLng),
      radius: radius,
      strictbounds: true,
      language: 'id',
      components: [Component('country', 'id')].toList(),
    );

    if (_response.status == 'OK') {
      _places = List<PlacesModel>.from(
        _response.predictions.map(
          (item) => PlacesModel(
            placeSuggestionPlaceId: item.placeId,
            placeSuggestionDescription: item.description,
          ),
        ),
      );
    }

    return _places;
  }

  Future<List<PlacesModel>> placeAutoCompleteCache({String keyword}) async {
    List<PlacesModel> _places = await _placeData.index(keyword: keyword);

    return _places;
  }

  Future<PlacesModel> deviceLocation() async {
    final GoogleMapsGeocoding _googleGeocoding =
        GoogleMapsGeocoding(apiKey: KEY);

    PlacesModel _place = PlacesModel();

    Position _position = await Geolocator.getCurrentPosition();

    GeocodingResponse _response = await _googleGeocoding
        .searchByLocation(Location(_position.latitude, _position.longitude));

    if (_response.status == 'OK') {
      _place = PlacesModel(
        placeSuggestionPlaceId: _response.results[0].placeId,
        placeSuggestionDescription: _response.results[0].formattedAddress,
      );
    }

    return _place;
  }

  Future<DistanceModel> distanceBetween({
    @required String origin,
    @required String destination,
  }) async {
    final GoogleDistanceMatrix _googleDistanceMatrix =
        GoogleDistanceMatrix(apiKey: KEY);

    DistanceModel _distance = DistanceModel();

    List<String> _origin = List<String>.from(['place_id:$origin']);

    List<String> _destination = List<String>.from(['place_id:$destination']);

    DistanceResponse _response =
        await _googleDistanceMatrix.distanceWithAddress(
      _origin,
      _destination,
      languageCode: 'id',
      region: 'id',
      unit: Unit.metric,
      travelMode: TravelMode.driving,
    ); //distance by place_id

    if (_response.status == 'OK') {
      _distance = DistanceModel(
        distanceValue: _response.results[0].elements[0].distance.value,
        durationValue: _response.results[0].elements[0].duration.value,
        distanceText: _response.results[0].elements[0].distance.text,
        durationText: _response.results[0].elements[0].duration.text,
      );
    }

    return _distance;
  }

  Future<List<geocoding.Placemark>> addressFromLocationOffline(
      double latitude, double longitude) async {
    return await geocoding.placemarkFromCoordinates(latitude, longitude,
        localeIdentifier: 'id_ID');
  }
}

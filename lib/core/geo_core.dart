import 'package:ayov2/const/const.dart';
import 'package:google_maps_webservice/places.dart';

class GeoCore {
  Future<PlacesAutocompleteResponse> placeAutoComplete({
    String keyword,
    double locationLat = -0.49732531314209866,
    double locationLng = 117.14187383609166,
    num radius = 1000,
  }) async {
    GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: KEY);

    PlacesAutocompleteResponse _response = await _places.autocomplete(
      keyword,
      location: Location(locationLat, locationLng),
      radius: radius,
      strictbounds: true,
      language: 'id',
      components: [Component('country', 'id')].toList(),
    );

    return _response;
  }
}

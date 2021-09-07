import 'package:ayov2/const/const.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/geocoding.dart' as google;

class OrderSummaryPageController extends GetxController {
  Future<List<Placemark>> _getAddressFromLocation(
      double latitude, double longitude) async {
    return await placemarkFromCoordinates(latitude, longitude,
        localeIdentifier: 'id_ID');
  }

  Future deviceLocation() async {
    final _geocoding = google.GoogleMapsGeocoding(apiKey: KEY);

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    Position _position = await Geolocator.getCurrentPosition();

    google.Location _location =
        google.Location(_position.latitude, _position.longitude);

    List<Placemark> _placeMark =
        await _getAddressFromLocation(_location.lat, _location.lng);

    google.GeocodingResponse _geocodingResponse =
        await _geocoding.searchByLocation(_location);

    String _formattedAddress = _placeMark[0].street +
        ', ' +
        _placeMark[0].subLocality +
        ', ' +
        _placeMark[0].locality +
        ', ' +
        _placeMark[0].subAdministrativeArea +
        ', ' +
        _placeMark[0].administrativeArea +
        ', ' +
        _placeMark[0].postalCode +
        ', ' +
        _placeMark[0].country;

    print(_formattedAddress);

    print(_geocodingResponse.results[0].formattedAddress);
  }

  void navigateToDeliveryDetailPage() {
    Get.toNamed(DELIVERY_DETAIL_PAGE);
  }

  void navigateToMapPage() {
    Get.toNamed(MAP_PAGE);
  }

  void _init() {
    // _deviceLocation();
  }

  @override
  void onInit() {
    _init();

    super.onInit();
  }
}

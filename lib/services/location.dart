import 'package:location/location.dart';

class CurrentLocationData {
  double? longitude;
  double? latitude;

  Future<void> getCurrentLocation() async {
    try {
      Location location = Location();
      LocationData locationData = await location.getLocation();
      longitude = locationData.longitude;
      latitude = locationData.latitude;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as GEOCODING;

ValueNotifier<List<GEOCODING.Placemark>?> addressNotifier = ValueNotifier(null);

class GeoLocatorService {
  // static const geo = Geolocator();
  bool isTry = true;
  // FirebaseLocationService serviceFirebaseLocationService  = FirebaseLocationService();
  // var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 30,timeInterval: 40000);

  //get current position
  Stream<Position> getCoords() {

    LocationSettings settings = const LocationSettings(accuracy: LocationAccuracy.high,);

    return Geolocator.getPositionStream(locationSettings: settings);
  }
  //get current future
  Future<Position?> getCordFuture() {
    return Geolocator.getLastKnownPosition();
  }
  // Future<Position?> getLastKnownPosition(){
  //   return Geolocator.getLastKnownPosition();
  // }

  ///get address by position
  Future<List<GEOCODING.Placemark>?> getAddress(Position position) async {
    addressNotifier.value = await GeocodingPlatform.instance.placemarkFromCoordinates(position.latitude, position.longitude,localeIdentifier: 'en');
    addressNotifier.notifyListeners();
    return addressNotifier.value;
  }

  ///calculate distance
  Future<double> getDistance(LatLng origin, LatLng destination) async {
    return Geolocator.distanceBetween(origin.latitude, origin.longitude,
        destination.latitude, destination.longitude);
  }
}

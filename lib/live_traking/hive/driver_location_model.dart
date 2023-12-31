import 'package:hive/hive.dart';

part 'driver_location_model.g.dart';

@HiveType(typeId: 1)
class DriverLocationModel {
  @HiveField(0)
  double latitude;
  @HiveField(1)
  double longitude;
  @HiveField(2)
  final speed;
  @HiveField(3)
  final heading;
  @HiveField(4)
  final city;
  @HiveField(5)
  final country;
  @HiveField(6)
  final address;
  @HiveField(7)
  final countryCode;
  @HiveField(8)
  double distance;

  DriverLocationModel(
      {required this.latitude,
        required this.longitude,
        this.speed,
        this.city,
        this.country,
        this.address,
        this.heading,
        required this.distance,
        this.countryCode});

  factory DriverLocationModel.fromJson(Map<dynamic, dynamic> json) {
    return DriverLocationModel(
      longitude: json['longitude'],
      latitude: json['latitude'],
      speed: json['speed'],
      heading: json['heading'],
      city: json['city'],
      country: json['country'],
      address: json['address'],
      distance: json['distance'],
      countryCode: json['countryCode'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['speed'] = speed;
    data['heading'] = heading;
    data['city'] = city;
    data['country'] = country;
    data['distance'] = distance;
    data['address'] = address;
    data['countryCode'] = countryCode;

    return data;
  }

  String getAddress(){
    return '$address $city $country';
  }
}

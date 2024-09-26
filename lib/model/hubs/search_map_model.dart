import 'dart:convert';

import 'package:flutter/foundation.dart';

class GoogleMapsResponse {
  final List<Result> results;
  GoogleMapsResponse({
    required this.results,
  });

  GoogleMapsResponse copyWith({
    List<Result>? results,
  }) {
    return GoogleMapsResponse(
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory GoogleMapsResponse.fromMap(Map<String, dynamic> map) {
    return GoogleMapsResponse(
      results: List<Result>.from(
        (map['results'] as List<dynamic>).map<Result>(
          (x) => Result.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GoogleMapsResponse.fromJson(String source) =>
      GoogleMapsResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GoogleMapsResponse(results: $results)';

  @override
  bool operator ==(covariant GoogleMapsResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.results, results);
  }

  @override
  int get hashCode => results.hashCode;
}

class Result {
  final Geometry geometry;
  final String name;
  final String formatted_address;
  final String place_id;
  Result({
    required this.geometry,
    required this.name,
    required this.formatted_address,
    required this.place_id,
  });

  Result copyWith({
    Geometry? geometry,
    String? name,
    String? formatted_address,
    String? place_id,
  }) {
    return Result(
      geometry: geometry ?? this.geometry,
      name: name ?? this.name,
      formatted_address: formatted_address ?? this.formatted_address,
      place_id: place_id ?? this.place_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'geometry': geometry.toMap(),
      'name': name,
      'formatted_address': formatted_address,
      'place_id': place_id,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      geometry: Geometry.fromMap(map['geometry'] as Map<String, dynamic>),
      name: map['name'] as String,
      formatted_address: map['formatted_address'] as String,
      place_id: map['place_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) =>
      Result.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Result(geometry: $geometry, name: $name, formatted_address: $formatted_address, place_id: $place_id)';
  }

  @override
  bool operator ==(covariant Result other) {
    if (identical(this, other)) return true;

    return other.geometry == geometry &&
        other.name == name &&
        other.formatted_address == formatted_address &&
        other.place_id == place_id;
  }

  @override
  int get hashCode {
    return geometry.hashCode ^
        name.hashCode ^
        formatted_address.hashCode ^
        place_id.hashCode;
  }
}

class Geometry {
  Location location;
  Geometry({
    required this.location,
  });

  Geometry copyWith({
    Location? location,
  }) {
    return Geometry(
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location.toMap(),
    };
  }

  factory Geometry.fromMap(Map<String, dynamic> map) {
    return Geometry(
      location: Location.fromMap(map['location'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Geometry.fromJson(String source) =>
      Geometry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Geometry(location: $location)';

  @override
  bool operator ==(covariant Geometry other) {
    if (identical(this, other)) return true;

    return other.location == location;
  }

  @override
  int get hashCode => location.hashCode;
}

class Location {
  double lat;
  double lng;
  Location({
    required this.lat,
    required this.lng,
  });

  Location copyWith({
    double? lat,
    double? lng,
  }) {
    return Location(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      lat: map['lat'] as double,
      lng: map['lng'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Location(lat: $lat, lng: $lng)';

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}

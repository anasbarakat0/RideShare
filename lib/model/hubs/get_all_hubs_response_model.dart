// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetAllHubsResponseModel {}

class EmptyResponse extends GetAllHubsResponseModel {
  final String message;
  EmptyResponse({
    required this.message,
  });
}

class ExceptionResponse extends GetAllHubsResponseModel {
  final String message;
  ExceptionResponse({
    required this.message,
  });
}

class SuccessResponse extends GetAllHubsResponseModel {
  String message;
  String status;
  String localDateTime;
  List<Body> body;
  SuccessResponse({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
      'localDateTime': localDateTime,
      'body': body.map((x) => x.toMap()).toList(),
    };
  }

  factory SuccessResponse.fromMap(Map<String, dynamic> map) {
    return SuccessResponse(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
      body: List<Body>.from(
        (map['body'] as List<dynamic>).map<Body>(
          (x) => Body.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SuccessResponse.fromJson(String source) =>
      SuccessResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SuccessResponse(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant SuccessResponse other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime &&
        listEquals(other.body, body);
  }

  @override
  int get hashCode {
    return message.hashCode ^
        status.hashCode ^
        localDateTime.hashCode ^
        body.hashCode;
  }
}

class Body {
  int id;
  String name;
  double latitude;
  double longitude;
  String description;
  Body({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.description,
  });

  Body copyWith({
    int? id,
    String? name,
    double? latitude,
    double? longitude,
    String? description,
  }) {
    return Body(
      id: id ?? this.id,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
    };
  }

  factory Body.fromMap(Map<String, dynamic> map) {
    return Body(
      id: map['id'] as int,
      name: map['name'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Body.fromJson(String source) =>
      Body.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Body(id: $id, name: $name, latitude: $latitude, longitude: $longitude, description: $description)';
  }

  @override
  bool operator ==(covariant Body other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        description.hashCode;
  }
}

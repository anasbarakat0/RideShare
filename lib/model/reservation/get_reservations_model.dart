// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetReservationsModel {}

class SuccessGettingReservations extends GetReservationsModel {
  final String message;
  final String status;
  final String localDateTime;
  final List<Body> body;
  SuccessGettingReservations({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  SuccessGettingReservations copyWith({
    String? message,
    String? status,
    String? localDateTime,
    List<Body>? body,
  }) {
    return SuccessGettingReservations(
      message: message ?? this.message,
      status: status ?? this.status,
      localDateTime: localDateTime ?? this.localDateTime,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
      'localDateTime': localDateTime,
      'body': body.map((x) => x.toMap()).toList(),
    };
  }

  factory SuccessGettingReservations.fromMap(Map<String, dynamic> map) {
    return SuccessGettingReservations(
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

  factory SuccessGettingReservations.fromJson(String source) =>
      SuccessGettingReservations.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SuccessGettingReservations(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant SuccessGettingReservations other) {
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
  final int id;
  final String client;
  final String bicycle;
  final String from;
  final String to;
  final double duration;
  final String startTime;
  final String? endTime;
  final String reservationStatus;
  final double price;
  Body({
    required this.id,
    required this.client,
    required this.bicycle,
    required this.from,
    required this.to,
    required this.duration,
    required this.startTime,
    this.endTime,
    required this.reservationStatus,
    required this.price,
  });

  Body copyWith({
    int? id,
    String? client,
    String? bicycle,
    String? from,
    String? to,
    double? duration,
    String? startTime,
    String? endTime,
    String? reservationStatus,
    double? price,
  }) {
    return Body(
      id: id ?? this.id,
      client: client ?? this.client,
      bicycle: bicycle ?? this.bicycle,
      from: from ?? this.from,
      to: to ?? this.to,
      duration: duration ?? this.duration,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      reservationStatus: reservationStatus ?? this.reservationStatus,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'client': client,
      'bicycle': bicycle,
      'from': from,
      'to': to,
      'duration': duration,
      'startTime': startTime,
      'endTime': endTime,
      'reservationStatus': reservationStatus,
      'price': price,
    };
  }

  factory Body.fromMap(Map<String, dynamic> map) {
    return Body(
      id: map['id'] as int,
      client: map['client'] as String,
      bicycle: map['bicycle'] as String,
      from: map['from'] as String,
      to: map['to'] as String,
      duration: map['duration'] as double,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] != null ? map['endTime'] as String : null,
      reservationStatus: map['reservationStatus'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Body.fromJson(String source) =>
      Body.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Body(id: $id, client: $client, bicycle: $bicycle, from: $from, to: $to, duration: $duration, startTime: $startTime, endTime: $endTime, reservationStatus: $reservationStatus, price: $price)';
  }

  @override
  bool operator ==(covariant Body other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.client == client &&
        other.bicycle == bicycle &&
        other.from == from &&
        other.to == to &&
        other.duration == duration &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.reservationStatus == reservationStatus &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        client.hashCode ^
        bicycle.hashCode ^
        from.hashCode ^
        to.hashCode ^
        duration.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        reservationStatus.hashCode ^
        price.hashCode;
  }
}

class ExceptionGettingReservations extends GetReservationsModel {
  final String message;
  ExceptionGettingReservations({
    required this.message,
  });
}

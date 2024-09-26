// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rideshare_/core/error/exception.dart';

class UpdateToDuringReservationModel {}

class UpdatedToDuringReservation extends UpdateToDuringReservationModel {
  final String message;
  final String status;
  final String localDateTime;
  final Body body;
  UpdatedToDuringReservation({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  UpdatedToDuringReservation copyWith({
    String? message,
    String? status,
    String? localDateTime,
    Body? body,
  }) {
    return UpdatedToDuringReservation(
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
      'body': body.toMap(),
    };
  }

  factory UpdatedToDuringReservation.fromMap(Map<String, dynamic> map) {
    return UpdatedToDuringReservation(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
      body: Body.fromMap(map['body'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdatedToDuringReservation.fromJson(String source) =>
      UpdatedToDuringReservation.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UpdatedToDuringReservation(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant UpdatedToDuringReservation other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime &&
        other.body == body;
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
  final int price;
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
    int? price,
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
      price: map['price'] as int,
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

class ExceptionRequest extends UpdateToDuringReservationModel {
  final BadRequest? badRequest;
  final ConflictUpdate? conflictUpdate;
  ExceptionRequest({
    this.badRequest,
    this.conflictUpdate,
  });

  ExceptionRequest copyWith({
    BadRequest? badRequest,
    ConflictUpdate? conflictUpdate,
  }) {
    return ExceptionRequest(
      badRequest: badRequest ?? this.badRequest,
      conflictUpdate: conflictUpdate ?? this.conflictUpdate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'badRequest': badRequest?.toMap(),
      'conflictUpdate': conflictUpdate?.toMap(),
    };
  }

  factory ExceptionRequest.fromMap(Map<String, dynamic> map) {
    return ExceptionRequest(
      badRequest: map['badRequest'] != null
          ? BadRequest.fromMap(map['badRequest'] as Map<String, dynamic>)
          : null,
      conflictUpdate: map['conflictUpdate'] != null
          ? ConflictUpdate.fromMap(
              map['conflictUpdate'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExceptionRequest.fromJson(String source) =>
      ExceptionRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ExceptionRequest(badRequest: $badRequest, conflictUpdate: $conflictUpdate)';

  @override
  bool operator ==(covariant ExceptionRequest other) {
    if (identical(this, other)) return true;

    return other.badRequest == badRequest &&
        other.conflictUpdate == conflictUpdate;
  }

  @override
  int get hashCode => badRequest.hashCode ^ conflictUpdate.hashCode;
}

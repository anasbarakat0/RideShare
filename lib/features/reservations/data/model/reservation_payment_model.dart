// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReservationPaymentResponse {}

class ReservationPaymentModel {
  final int reservationID;
  final String walletPassword;
  ReservationPaymentModel({
    required this.reservationID,
    required this.walletPassword,
  });

  ReservationPaymentModel copyWith({
    int? reservationID,
    String? walletPassword,
  }) {
    return ReservationPaymentModel(
      reservationID: reservationID ?? this.reservationID,
      walletPassword: walletPassword ?? this.walletPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reservationID': reservationID,
      'walletPassword': walletPassword,
    };
  }

  factory ReservationPaymentModel.fromMap(Map<String, dynamic> map) {
    return ReservationPaymentModel(
      reservationID: map['reservationID'] as int,
      walletPassword: map['walletPassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationPaymentModel.fromJson(String source) =>
      ReservationPaymentModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ReservationPaymentModel(reservationID: $reservationID, walletPassword: $walletPassword)';

  @override
  bool operator ==(covariant ReservationPaymentModel other) {
    if (identical(this, other)) return true;

    return other.reservationID == reservationID &&
        other.walletPassword == walletPassword;
  }

  @override
  int get hashCode => reservationID.hashCode ^ walletPassword.hashCode;
}

//! /////////////////////////////////////////////////////////////////////////

class ReservationPaymentSuccess extends ReservationPaymentResponse {
  String message;
  String status;
  DateTime localDateTime;
  Body body;

  ReservationPaymentSuccess({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  factory ReservationPaymentSuccess.fromRawJson(String str) =>
      ReservationPaymentSuccess.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservationPaymentSuccess.fromJson(Map<String, dynamic> json) =>
      ReservationPaymentSuccess(
        message: json["message"],
        status: json["status"],
        localDateTime: DateTime.parse(json["localDateTime"]),
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "localDateTime": localDateTime.toIso8601String(),
        "body": body.toJson(),
      };
}

class Body {
  int id;
  String client;
  String bicycle;
  String from;
  String to;
  double duration;
  DateTime startTime;
  dynamic endTime;
  String reservationStatus;
  int price;

  Body({
    required this.id,
    required this.client,
    required this.bicycle,
    required this.from,
    required this.to,
    required this.duration,
    required this.startTime,
    required this.endTime,
    required this.reservationStatus,
    required this.price,
  });

  factory Body.fromRawJson(String str) => Body.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        client: json["client"],
        bicycle: json["bicycle"],
        from: json["from"],
        to: json["to"],
        duration: json["duration"],
        startTime: DateTime.parse(json["startTime"]),
        endTime: json["endTime"],
        reservationStatus: json["reservationStatus"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "client": client,
        "bicycle": bicycle,
        "from": from,
        "to": to,
        "duration": duration,
        "startTime": startTime.toIso8601String(),
        "endTime": endTime,
        "reservationStatus": reservationStatus,
        "price": price,
      };
}

class BadRequest extends ReservationPaymentResponse {
  final String message;
  final String status;
  final String localDateTime;
  BadRequest({
    required this.message,
    required this.status,
    required this.localDateTime,
  });

  BadRequest copyWith({
    String? message,
    String? status,
    String? localDateTime,
  }) {
    return BadRequest(
      message: message ?? this.message,
      status: status ?? this.status,
      localDateTime: localDateTime ?? this.localDateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
      'localDateTime': localDateTime,
    };
  }

  factory BadRequest.fromMap(Map<String, dynamic> map) {
    return BadRequest(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BadRequest.fromJson(String source) =>
      BadRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BadRequest(message: $message, status: $status, localDateTime: $localDateTime)';

  @override
  bool operator ==(covariant BadRequest other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime;
  }

  @override
  int get hashCode =>
      message.hashCode ^ status.hashCode ^ localDateTime.hashCode;
}

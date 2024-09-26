// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetCodesModel {}

class GetValidCodes extends GetCodesModel {
  final String message;
  final String status;
  final String localDateTime;
  final List<Body> body;
  GetValidCodes({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  GetValidCodes copyWith({
    String? message,
    String? status,
    String? localDateTime,
    List<Body>? body,
  }) {
    return GetValidCodes(
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

  factory GetValidCodes.fromMap(Map<String, dynamic> map) {
    return GetValidCodes(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
      body: List<Body>.from(
        (map['body'] as List).map<Body>(
          (x) => Body.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetValidCodes.fromJson(String source) =>
      GetValidCodes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetValidCodes(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant GetValidCodes other) {
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
  String code;
  int amount;
  Body({
    required this.id,
    required this.code,
    required this.amount,
  });

  Body copyWith({
    int? id,
    String? code,
    int? amount,
  }) {
    return Body(
      id: id ?? this.id,
      code: code ?? this.code,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'amount': amount,
    };
  }

  factory Body.fromMap(Map<String, dynamic> map) {
    return Body(
      id: map['id'] as int,
      code: map['code'] as String,
      amount: map['amount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Body.fromJson(String source) =>
      Body.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Body(id: $id, code: $code, amount: $amount)';

  @override
  bool operator ==(covariant Body other) {
    if (identical(this, other)) return true;

    return other.id == id && other.code == code && other.amount == amount;
  }

  @override
  int get hashCode => id.hashCode ^ code.hashCode ^ amount.hashCode;
}

class GetNoCodes extends GetCodesModel {
  final String message;
  final String status;
  final String localDateTime;
  final List body;
  GetNoCodes({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  GetNoCodes copyWith({
    String? message,
    String? status,
    String? localDateTime,
    List? body,
  }) {
    return GetNoCodes(
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
      'body': body,
    };
  }

  factory GetNoCodes.fromMap(Map<String, dynamic> map) {
    return GetNoCodes(
        message: map['message'] as String,
        status: map['status'] as String,
        localDateTime: map['localDateTime'] as String,
        body: List.from(
          (map['body'] as List),
        ));
  }

  String toJson() => json.encode(toMap());

  factory GetNoCodes.fromJson(String source) =>
      GetNoCodes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetNoCodes(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant GetNoCodes other) {
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

class ExceptionGettingCodes extends GetCodesModel {
  final String message;
  ExceptionGettingCodes({
    required this.message,
  });
}

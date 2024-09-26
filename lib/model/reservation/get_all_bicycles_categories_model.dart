// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetAllBicyclesCategoriesModel {}

class SuccessGettingCategories extends GetAllBicyclesCategoriesModel {
  final String message;
  final String status;
  final String localDateTime;
  final List<String> body;
  SuccessGettingCategories({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  SuccessGettingCategories copyWith({
    String? message,
    String? status,
    String? localDateTime,
    List<String>? body,
  }) {
    return SuccessGettingCategories(
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

  factory SuccessGettingCategories.fromMap(Map<String, dynamic> map) {
    return SuccessGettingCategories(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
      body: List<String>.from((map['body'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory SuccessGettingCategories.fromJson(String source) =>
      SuccessGettingCategories.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SuccessGettingCategories(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant SuccessGettingCategories other) {
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

class ExceptionGettingCategories extends GetAllBicyclesCategoriesModel {
  final String message;
  ExceptionGettingCategories({
    required this.message,
  });
}

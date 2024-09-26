// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CreateNewWalletResponseModel {}

class WalletCreated extends CreateNewWalletResponseModel {
  String message;
  String status;
  String localDateTime;
  Body body;
  WalletCreated({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  WalletCreated copyWith({
    String? message,
    String? status,
    String? localDateTime,
    Body? body,
  }) {
    return WalletCreated(
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

  factory WalletCreated.fromMap(Map<String, dynamic> map) {
    return WalletCreated(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
      body: Body.fromMap(map['body'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletCreated.fromJson(String source) =>
      WalletCreated.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WalletCreated(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant WalletCreated other) {
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
  int id;
  double balance;
  String bankAccount;
  Body({
    required this.id,
    required this.balance,
    required this.bankAccount,
  });

  Body copyWith({
    int? id,
    double? balance,
    String? bankAccount,
  }) {
    return Body(
      id: id ?? this.id,
      balance: balance ?? this.balance,
      bankAccount: bankAccount ?? this.bankAccount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'balance': balance,
      'bankAccount': bankAccount,
    };
  }

  factory Body.fromMap(Map<String, dynamic> map) {
    return Body(
      id: map['id'] as int,
      balance: map['balance'] as double,
      bankAccount: map['bankAccount'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Body.fromJson(String source) =>
      Body.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Body(id: $id, balance: $balance, bankAccount: $bankAccount)';

  @override
  bool operator ==(covariant Body other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.balance == balance &&
        other.bankAccount == bankAccount;
  }

  @override
  int get hashCode => id.hashCode ^ balance.hashCode ^ bankAccount.hashCode;
}

class BadRequestCreateWalletModel extends CreateNewWalletResponseModel {
  final List<String> message;
  final String status;
  final String localDateTime;
  BadRequestCreateWalletModel({
    required this.message,
    required this.status,
    required this.localDateTime,
  });

  BadRequestCreateWalletModel copyWith({
    List<String>? message,
    String? status,
    String? localDateTime,
  }) {
    return BadRequestCreateWalletModel(
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

  factory BadRequestCreateWalletModel.fromMap(Map<String, dynamic> map) {
    List<String> rawMessages =
        List<String>.from(map['message'] as List<dynamic>);
    List<String> processedMessages = [];

    for (String msg in rawMessages) {
      if (msg.contains(',')) {
        processedMessages.addAll(msg.split(',').map((m) => m.trim()));
      } else {
        processedMessages.add(msg);
      }
    }

    return BadRequestCreateWalletModel(
      message: processedMessages,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BadRequestCreateWalletModel.fromJson(String source) =>
      BadRequestCreateWalletModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BadRequestCreateWallet(message: $message, status: $status, localDateTime: $localDateTime)';

  @override
  bool operator ==(covariant BadRequestCreateWalletModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.message, message) &&
        other.status == status &&
        other.localDateTime == localDateTime;
  }

  @override
  int get hashCode =>
      message.hashCode ^ status.hashCode ^ localDateTime.hashCode;
}

class ExceptionCreateWalletModel extends CreateNewWalletResponseModel {
  final String message;
  ExceptionCreateWalletModel({
    required this.message,
  });
}

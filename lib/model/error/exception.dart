// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rideshare_/model/reservation/new_reservation_model.dart';
import 'package:rideshare_/model/reservation/reservation_payment_model.dart'
    as payment;
import 'package:rideshare_/model/wallet/create_new_wallet_response_model.dart';
import 'package:rideshare_/model/wallet/get_codes_model.dart';
import 'package:rideshare_/model/wallet/wallet_codes_model.dart';

class UsernameAlreadyInUse implements Exception {}

class BadRequestSignUp implements Exception {
  List<String> messages;
  BadRequestSignUp({
    required this.messages,
  });
}

// bicycle is empty
class EmptyBicycleRespons implements Exception {}

// No hubs available
class EmptyHubs implements Exception {}

// not valid wallet code
class CodeNotCorrect implements Exception {
  final UnValidCodeModel unValidCodeModel;
  CodeNotCorrect({
    required this.unValidCodeModel,
  });
}

//there is no wallet to show
class NoWallet implements Exception {}

// there is no valid code to show
class NoValidCode implements Exception {
  final GetNoCodes getNoCodes;
  NoValidCode({
    required this.getNoCodes,
  });
}

// Bad Request 400 List messages
class BadRequestWallet implements Exception {
  final BadRequestCreateWalletModel badRequestCreateWallet;
  BadRequestWallet({
    required this.badRequestCreateWallet,
  });
}

//reservation exception Bicycle not found
class BicycleNotFound implements Exception {
  final ReservationBadRequest reservationBadRequest;
  BicycleNotFound({
    required this.reservationBadRequest,
  });
}

//reservation exception Source hub not found
class SourceHubNotFound implements Exception {
  final ReservationBadRequest reservationBadRequest;
  SourceHubNotFound({
    required this.reservationBadRequest,
  });
}

//reservation exception Target hub not found
class TargetHubNotFound implements Exception {
  final ReservationBadRequest reservationBadRequest;
  TargetHubNotFound({
    required this.reservationBadRequest,
  });
}

//reservation exception Bicycle not found in source
class BicycleNotFoundInSource implements Exception {
  final ReservationBadRequest reservationBadRequest;
  BicycleNotFoundInSource({
    required this.reservationBadRequest,
  });
}

//reservation exception Reserved, Try another Time
class BicycleReserved implements Exception {
  final ReservationBadRequest reservationBadRequest;
  BicycleReserved({
    required this.reservationBadRequest,
  });
}

// Bad Request payments
class BadRequestPayment implements Exception {
  final payment.BadRequest badRequest;
  BadRequestPayment({
    required this.badRequest,
  });
}

// CONFLICT update reservation to during reservation
class ConflictUpdate implements Exception {
  final String message;
  final String status;
  final String localDateTime;
  ConflictUpdate({
    required this.message,
    required this.status,
    required this.localDateTime,
  });

  ConflictUpdate copyWith({
    String? message,
    String? status,
    String? localDateTime,
  }) {
    return ConflictUpdate(
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

  factory ConflictUpdate.fromMap(Map<String, dynamic> map) {
    return ConflictUpdate(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConflictUpdate.fromJson(String source) =>
      ConflictUpdate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ConflictUpdate(message: $message, status: $status, localDateTime: $localDateTime)';

  @override
  bool operator ==(covariant ConflictUpdate other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime;
  }

  @override
  int get hashCode =>
      message.hashCode ^ status.hashCode ^ localDateTime.hashCode;
}

class BadRequest implements Exception {
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

class EmptyReservations implements Exception {
  final String message;
  EmptyReservations({
    required this.message,
  });
}

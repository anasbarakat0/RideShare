// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WalletCodesModel {}

class ValidCodesModel extends WalletCodesModel {
  final String message;
  final String status;
  final String localDateTime;
  ValidCodesModel({
    required this.message,
    required this.status,
    required this.localDateTime,
  });

  ValidCodesModel copyWith({
    String? message,
    String? status,
    String? localDateTime,
  }) {
    return ValidCodesModel(
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

  factory ValidCodesModel.fromMap(Map<String, dynamic> map) {
    return ValidCodesModel(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ValidCodesModel.fromJson(String source) =>
      ValidCodesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ValidCodesModel(message: $message, status: $status, localDateTime: $localDateTime)';

  @override
  bool operator ==(covariant ValidCodesModel other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime;
  }

  @override
  int get hashCode =>
      message.hashCode ^ status.hashCode ^ localDateTime.hashCode;
}

class UnValidCodeModel extends WalletCodesModel {
  final String message;
  final String status;
  final String localDateTime;
  UnValidCodeModel({
    required this.message,
    required this.status,
    required this.localDateTime,
  });

  UnValidCodeModel copyWith({
    String? message,
    String? status,
    String? localDateTime,
  }) {
    return UnValidCodeModel(
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

  factory UnValidCodeModel.fromMap(Map<String, dynamic> map) {
    return UnValidCodeModel(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UnValidCodeModel.fromJson(String source) =>
      UnValidCodeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UnValidCodeModel(message: $message, status: $status, localDateTime: $localDateTime)';

  @override
  bool operator ==(covariant UnValidCodeModel other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime;
  }

  @override
  int get hashCode =>
      message.hashCode ^ status.hashCode ^ localDateTime.hashCode;
}

class ExceptionCode extends WalletCodesModel {
  final String message;
  ExceptionCode({
    required this.message,
  });
}

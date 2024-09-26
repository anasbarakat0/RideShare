// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DeletReservationModel {}

class DeletedModel extends DeletReservationModel {
  final String message;
  final String status;
  final String localDateTime;
  DeletedModel({
    required this.message,
    required this.status,
    required this.localDateTime,
  });

  DeletedModel copyWith({
    String? message,
    String? status,
    String? localDateTime,
  }) {
    return DeletedModel(
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

  factory DeletedModel.fromMap(Map<String, dynamic> map) {
    return DeletedModel(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeletedModel.fromJson(String source) =>
      DeletedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DeletedModel(message: $message, status: $status, localDateTime: $localDateTime)';

  @override
  bool operator ==(covariant DeletedModel other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime;
  }

  @override
  int get hashCode =>
      message.hashCode ^ status.hashCode ^ localDateTime.hashCode;
}

class BadDeletModel extends DeletReservationModel {
  final String message;
  final String status;
  final String localDateTime;
  BadDeletModel({
    required this.message,
    required this.status,
    required this.localDateTime,
  });

  BadDeletModel copyWith({
    String? message,
    String? status,
    String? localDateTime,
  }) {
    return BadDeletModel(
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

  factory BadDeletModel.fromMap(Map<String, dynamic> map) {
    return BadDeletModel(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BadDeletModel.fromJson(String source) =>
      BadDeletModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BadDeletModel(message: $message, status: $status, localDateTime: $localDateTime)';

  @override
  bool operator ==(covariant BadDeletModel other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime;
  }

  @override
  int get hashCode =>
      message.hashCode ^ status.hashCode ^ localDateTime.hashCode;
}

class ExceptionDeletModel extends DeletReservationModel {
  final String message;
  ExceptionDeletModel({
    required this.message,
  });
}

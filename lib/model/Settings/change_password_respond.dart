import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChangePasswordRespond {}

class SuccessChangingResponse extends ChangePasswordRespond {
  final String? message;
  SuccessChangingResponse({
    this.message,
  });
}

class BadRequest extends ChangePasswordRespond {
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

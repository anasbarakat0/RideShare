// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginRespond {}

class LoginToken extends LoginRespond {
  final String message;
  final String status;
  final String localDateTime;
  final Body body;
  LoginToken({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  LoginToken copyWith({
    String? message,
    String? status,
    String? localDateTime,
    Body? body,
  }) {
    return LoginToken(
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

  factory LoginToken.fromMap(Map<String, dynamic> map) {
    return LoginToken(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
      body: Body.fromMap(map['body'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginToken.fromJson(String source) =>
      LoginToken.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginToken(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant LoginToken other) {
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
  final String firstName;
  final String lastName;
  final String phone;
  final String username;
  final String token;
  Body({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.username,
    required this.token,
  });

  Body copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phone,
    String? username,
    String? token,
  }) {
    return Body(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      '_username': username,
      'token': token,
    };
  }

  factory Body.fromMap(Map<String, dynamic> map) {
    return Body(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      phone: map['phone'] as String,
      username: map['_username'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Body.fromJson(String source) =>
      Body.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Body(id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, _username: $username, token: $token)';
  }

  @override
  bool operator ==(covariant Body other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phone == phone &&
        other.username == username &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phone.hashCode ^
        username.hashCode ^
        token.hashCode;
  }
}

class LoginUnsuccessful extends LoginRespond {
  final String message;
  final String status;
  final String localDateTime;
  LoginUnsuccessful({
    required this.message,
    required this.status,
    required this.localDateTime,
  });

  LoginUnsuccessful copyWith({
    String? message,
    String? status,
    String? localDateTime,
  }) {
    return LoginUnsuccessful(
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

  factory LoginUnsuccessful.fromMap(Map<String, dynamic> map) {
    return LoginUnsuccessful(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUnsuccessful.fromJson(String source) =>
      LoginUnsuccessful.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginUnsuccessful(message: $message, status: $status, localDateTime: $localDateTime)';

  @override
  bool operator ==(covariant LoginUnsuccessful other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime;
  }

  @override
  int get hashCode =>
      message.hashCode ^ status.hashCode ^ localDateTime.hashCode;
}

class LoginErrorRespond extends LoginRespond {
  final String message;
  LoginErrorRespond({
    required this.message,
  });

  LoginErrorRespond copyWith({
    String? message,
  }) {
    return LoginErrorRespond(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory LoginErrorRespond.fromMap(Map<String, dynamic> map) {
    return LoginErrorRespond(
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginErrorRespond.fromJson(String source) =>
      LoginErrorRespond.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginError(message: $message)';

  @override
  bool operator ==(covariant LoginErrorRespond other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

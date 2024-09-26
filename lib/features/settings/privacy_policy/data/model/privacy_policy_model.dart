// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PrivacyPolicy {}

class PrivacyPolicyModel extends PrivacyPolicy {
  final String message;
  final String status;
  final String localDateTime;
  final Body body;
  PrivacyPolicyModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  PrivacyPolicyModel copyWith({
    String? message,
    String? status,
    String? localDateTime,
    Body? body,
  }) {
    return PrivacyPolicyModel(
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

  factory PrivacyPolicyModel.fromMap(Map<String, dynamic> map) {
    return PrivacyPolicyModel(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
      body: Body.fromMap(map['body'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PrivacyPolicyModel.fromJson(String source) =>
      PrivacyPolicyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PrivacyPolicyModel(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant PrivacyPolicyModel other) {
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
  final String title;
  final String description;
  Body({
    required this.id,
    required this.title,
    required this.description,
  });

  Body copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return Body(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory Body.fromMap(Map<String, dynamic> map) {
    return Body(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Body.fromJson(String source) =>
      Body.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Body(id: $id, title: $title, description: $description)';

  @override
  bool operator ==(covariant Body other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode;
}

class ExceptionPrivacyPolicy extends PrivacyPolicy {
  final String message;
  ExceptionPrivacyPolicy({
    required this.message,
  });
}

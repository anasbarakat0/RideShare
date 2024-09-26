// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetOfferModel {}

class BadOfferRespond extends GetOfferModel {
  final String message;
  final String status;
  final String localDateTime;
  BadOfferRespond({
    required this.message,
    required this.status,
    required this.localDateTime,
  });

  BadOfferRespond copyWith({
    String? message,
    String? status,
    String? localDateTime,
  }) {
    return BadOfferRespond(
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

  factory BadOfferRespond.fromMap(Map<String, dynamic> map) {
    return BadOfferRespond(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BadOfferRespond.fromJson(String source) =>
      BadOfferRespond.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BadOfferRespond(message: $message, status: $status, localDateTime: $localDateTime)';

  @override
  bool operator ==(covariant BadOfferRespond other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime;
  }

  @override
  int get hashCode =>
      message.hashCode ^ status.hashCode ^ localDateTime.hashCode;
}

class ExceptionOfferRespond extends GetOfferModel {
  final String message;
  ExceptionOfferRespond({
    required this.message,
  });
}

class GetAllOffers extends GetOfferModel {
  String message;
  String status;
  String localDateTime;
  List<Body> body;
  GetAllOffers({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  GetAllOffers copyWith({
    String? message,
    String? status,
    String? localDateTime,
    List<Body>? body,
  }) {
    return GetAllOffers(
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

  factory GetAllOffers.fromMap(Map<String, dynamic> map) {
    return GetAllOffers(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
      body: List<Body>.from(
        (map['body'] as List<dynamic>).map<Body>(
          (x) => Body.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAllOffers.fromJson(String source) =>
      GetAllOffers.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetAllOffers(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant GetAllOffers other) {
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
  final int id;
  final ModelPrice model_price;
  final int size;
  final String photoPath;
  final String type;
  final String note;
  final List? maintenance;
  final bool isFavourite;
  Body({
    required this.id,
    required this.model_price,
    required this.size,
    required this.photoPath,
    required this.type,
    required this.note,
    this.maintenance,
    required this.isFavourite,
  });

  Body copyWith({
    int? id,
    ModelPrice? model_price,
    int? size,
    String? photoPath,
    String? type,
    String? note,
    List? maintenance,
    bool? isFavourite,
  }) {
    return Body(
      id: id ?? this.id,
      model_price: model_price ?? this.model_price,
      size: size ?? this.size,
      photoPath: photoPath ?? this.photoPath,
      type: type ?? this.type,
      note: note ?? this.note,
      maintenance: maintenance ?? this.maintenance,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'model_price': model_price.toMap(),
      'size': size,
      'photoPath': photoPath,
      'type': type,
      'note': note,
      'maintenance': [],
      'isFavourite': isFavourite,
    };
  }

  factory Body.fromMap(Map<String, dynamic> map) {
    return Body(
      id: map['id'] as int,
      model_price:
          ModelPrice.fromMap(map['model_price'] as Map<String, dynamic>),
      size: map['size'] as int,
      photoPath: map['photoPath'] as String,
      type: map['type'] as String,
      note: map['note'] as String,
      maintenance: [],
      isFavourite: map['isFavourite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Body.fromJson(String source) =>
      Body.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Body(id: $id, model_price: $model_price, size: $size, photoPath: $photoPath, type: $type, note: $note, maintenance: $maintenance, isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(covariant Body other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.model_price == model_price &&
        other.size == size &&
        other.photoPath == photoPath &&
        other.type == type &&
        other.note == note &&
        other.maintenance == maintenance &&
        other.isFavourite == isFavourite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        model_price.hashCode ^
        size.hashCode ^
        photoPath.hashCode ^
        type.hashCode ^
        note.hashCode ^
        maintenance.hashCode ^
        isFavourite.hashCode;
  }
}

class ModelPrice {
  int id;
  double price;
  String model;

  ModelPrice({
    required this.id,
    required this.price,
    required this.model,
  });

  ModelPrice copyWith({
    int? id,
    double? price,
    String? model,
  }) {
    return ModelPrice(
      id: id ?? this.id,
      price: price ?? this.price,
      model: model ?? this.model,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'model': model,
    };
  }

  factory ModelPrice.fromMap(Map<String, dynamic> map) {
    return ModelPrice(
      id: map['id'] as int,
      price: (map['price'] as num).toDouble(),
      model: map['model'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelPrice.fromJson(String source) =>
      ModelPrice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'model_price(id: $id, price: $price, model: $model)';

  @override
  bool operator ==(covariant ModelPrice other) {
    if (identical(this, other)) return true;

    return other.id == id && other.price == price && other.model == model;
  }

  @override
  int get hashCode => id.hashCode ^ price.hashCode ^ model.hashCode;
}

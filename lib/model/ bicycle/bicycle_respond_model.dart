import 'dart:convert';

import 'package:flutter/foundation.dart';

class BicycleModel {}

class EmptyBicycleRespondModel extends BicycleModel {
  final String message;
  EmptyBicycleRespondModel({
    required this.message,
  });
}

class ExceptionBicycleRespondModel extends BicycleModel {
  final String message;
  ExceptionBicycleRespondModel({
    required this.message,
  });
}

class BicycleRespondModel extends BicycleModel {
  String message;
  String status;
  String localDateTime;
  List<Body> body;
  BicycleRespondModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  BicycleRespondModel copyWith({
    String? message,
    String? status,
    String? localDateTime,
    List<Body>? body,
  }) {
    return BicycleRespondModel(
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

  factory BicycleRespondModel.fromMap(Map<String, dynamic> map) {
    return BicycleRespondModel(
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

  factory BicycleRespondModel.fromJson(String source) =>
      BicycleRespondModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BicycleRespondModel(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant BicycleRespondModel other) {
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
  ModelPrice modelPrice;
  int size;
  String photoPath;
  String type;
  String note;
  List<dynamic>? maintenance;

  Body({
    required this.id,
    required this.modelPrice,
    required this.size,
    required this.photoPath,
    required this.type,
    required this.note,
    required this.maintenance,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'modelPrice': modelPrice.toMap(),
      'size': size,
      'photoPath': photoPath,
      'type': type,
      'note': note,
      'maintenance': [],
    };
  }

  factory Body.fromMap(Map<String, dynamic> map) {
    return Body(
      id: map['id'] as int,
      modelPrice:
          ModelPrice.fromMap(map['model_price'] as Map<String, dynamic>),
      size: map['size'] as int,
      photoPath: map['photoPath'] as String,
      type: map['type'] as String,
      note: map['note'] as String,
      maintenance: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Body.fromJson(String source) =>
      Body.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Body(id: $id, modelPrice: $modelPrice, size: $size, photoPath: $photoPath, type: $type, note: $note, maintenance: $maintenance)';
  }

  @override
  bool operator ==(covariant Body other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.modelPrice == modelPrice &&
        other.size == size &&
        other.photoPath == photoPath &&
        other.type == type &&
        other.note == note &&
        listEquals(other.maintenance, maintenance);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        modelPrice.hashCode ^
        size.hashCode ^
        photoPath.hashCode ^
        type.hashCode ^
        note.hashCode ^
        maintenance.hashCode;
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
  String toString() => 'ModelPrice(id: $id, price: $price, model: $model)';

  @override
  bool operator ==(covariant ModelPrice other) {
    if (identical(this, other)) return true;

    return other.id == id && other.price == price && other.model == model;
  }

  @override
  int get hashCode => id.hashCode ^ price.hashCode ^ model.hashCode;
}

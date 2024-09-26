// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class BicycleByHubModel {}

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
      price: map['price'] as double,
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

class BicycleByHubRespondModel extends BicycleByHubModel {
  final String message;
  final String status;
  final String localDateTime;
  final Body body;
  BicycleByHubRespondModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  BicycleByHubRespondModel copyWith({
    String? message,
    String? status,
    String? localDateTime,
    Body? body,
  }) {
    return BicycleByHubRespondModel(
      message: message ?? this.message,
      status: status ?? this.status,
      localDateTime: localDateTime ?? this.localDateTime,
      body: body ?? this.body,
    );
  }

  factory BicycleByHubRespondModel.fromMap(Map<String, dynamic> map) {
    return BicycleByHubRespondModel(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
      body: Body.fromMap(map['body'] as Map<String, dynamic>),
    );
  }

  factory BicycleByHubRespondModel.fromJson(String source) =>
      BicycleByHubRespondModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BicycleByHubRespondModel(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant BicycleByHubRespondModel other) {
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
  final int hubId;
  final List<BicycleList> bicycleList;
  final Null note;
  Body({
    required this.id,
    required this.hubId,
    required this.bicycleList,
    required this.note,
  });

  Body copyWith({
    int? id,
    int? hubId,
    List<BicycleList>? bicycleList,
    Null note,
  }) {
    return Body(
      id: id ?? this.id,
      hubId: hubId ?? this.hubId,
      bicycleList: bicycleList ?? this.bicycleList,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'hubId': hubId,
      'bicycleList': bicycleList.map((x) => x.toMap()).toList(),
      'note': null,
    };
  }

  factory Body.fromMap(Map<String, dynamic> map) {
    return Body(
      id: map['id'] as int,
      hubId: map['hubId'] as int,
      bicycleList: List<BicycleList>.from(
        (map['bicycleList'] as List<dynamic>).map<BicycleList>(
          (x) => BicycleList.fromMap(x as Map<String, dynamic>),
        ),
      ),
      note: null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Body.fromJson(String source) =>
      Body.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Body(id: $id, hubId: $hubId, bicycleList: $bicycleList, note: $note)';
  }

  @override
  bool operator ==(covariant Body other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.hubId == hubId &&
        listEquals(other.bicycleList, bicycleList) &&
        other.note == note;
  }

  @override
  int get hashCode {
    return id.hashCode ^ hubId.hashCode ^ bicycleList.hashCode ^ note.hashCode;
  }
}

class BicycleList {
  int id;
  ModelPrice model_price;
  int size;
  String photoPath;
  String type;
  String note;
  List? maintenance;
  bool isFavourite;
  BicycleList({
    required this.id,
    required this.model_price,
    required this.size,
    required this.photoPath,
    required this.type,
    required this.note,
    this.maintenance,
    required this.isFavourite,
  });

  BicycleList copyWith({
    int? id,
    ModelPrice? model_price,
    int? size,
    String? photoPath,
    String? type,
    String? note,
    List? maintenance,
    bool? isFavourite,
  }) {
    return BicycleList(
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

  factory BicycleList.fromMap(Map<String, dynamic> map) {
    return BicycleList(
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

  factory BicycleList.fromJson(String source) =>
      BicycleList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BicycleList(id: $id, model_price: $model_price, size: $size, photoPath: $photoPath, type: $type, note: $note, maintenance: $maintenance, isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(covariant BicycleList other) {
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

class ExceptionBicycleRespondModel extends BicycleByHubModel {
  final String message;
  ExceptionBicycleRespondModel({
    required this.message,
  });
}

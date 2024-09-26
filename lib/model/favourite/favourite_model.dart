import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FavouriteModel {}

class DeletedRespond extends FavouriteModel {
  final String message;
  final String status;
  final String localDateTime;
  DeletedRespond({
    required this.message,
    required this.status,
    required this.localDateTime,
  });

  DeletedRespond copyWith({
    String? message,
    String? status,
    String? localDateTime,
  }) {
    return DeletedRespond(
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

  factory DeletedRespond.fromMap(Map<String, dynamic> map) {
    return DeletedRespond(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeletedRespond.fromJson(String source) =>
      DeletedRespond.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DeletedRespond(message: $message, status: $status, localDateTime: $localDateTime)';

  @override
  bool operator ==(covariant DeletedRespond other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime;
  }

  @override
  int get hashCode =>
      message.hashCode ^ status.hashCode ^ localDateTime.hashCode;
}

class AllFavouriteRespond extends FavouriteModel {
  final String message;
  final String status;
  final String localDateTime;
  final List<Body> body;
  AllFavouriteRespond({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  AllFavouriteRespond copyWith({
    String? message,
    String? status,
    String? localDateTime,
    List<Body>? body,
  }) {
    return AllFavouriteRespond(
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

  factory AllFavouriteRespond.fromMap(Map<String, dynamic> map) {
    return AllFavouriteRespond(
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

  factory AllFavouriteRespond.fromJson(String source) =>
      AllFavouriteRespond.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AllFavouriteRespond(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant AllFavouriteRespond other) {
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

class FavouriteRespond extends FavouriteModel {
  final String message;
  final String status;
  final String localDateTime;
  final Body body;
  FavouriteRespond({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  FavouriteRespond copyWith({
    String? message,
    String? status,
    String? localDateTime,
    Body? body,
  }) {
    return FavouriteRespond(
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

  factory FavouriteRespond.fromMap(Map<String, dynamic> map) {
    return FavouriteRespond(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
      body: Body.fromMap(map['body'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavouriteRespond.fromJson(String source) =>
      FavouriteRespond.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FavouriteRespond(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant FavouriteRespond other) {
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
  final Bicycle bicycle;
  final Client client;
  Body({
    required this.id,
    required this.bicycle,
    required this.client,
  });

  Body copyWith({
    int? id,
    Bicycle? bicycle,
    Client? client,
  }) {
    return Body(
      id: id ?? this.id,
      bicycle: bicycle ?? this.bicycle,
      client: client ?? this.client,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'bicycle': bicycle.toMap(),
      'client': client.toMap(),
    };
  }

  factory Body.fromMap(Map<String, dynamic> map) {
    return Body(
      id: map['id'] as int,
      bicycle: Bicycle.fromMap(map['bicycle'] as Map<String, dynamic>),
      client: Client.fromMap(map['client'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Body.fromJson(String source) =>
      Body.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Body(id: $id, bicycle: $bicycle, client: $client)';

  @override
  bool operator ==(covariant Body other) {
    if (identical(this, other)) return true;

    return other.id == id && other.bicycle == bicycle && other.client == client;
  }

  @override
  int get hashCode => id.hashCode ^ bicycle.hashCode ^ client.hashCode;
}

class Bicycle {
  final int id;
  final ModelPrice model_price;
  final int size;
  final String photoPath;
  final String type;
  final String note;
  final List? maintenance;
  final bool isFavourite;
  Bicycle({
    required this.id,
    required this.model_price,
    required this.size,
    required this.photoPath,
    required this.type,
    required this.note,
    this.maintenance,
    required this.isFavourite,
  });

  Bicycle copyWith({
    int? id,
    ModelPrice? model_price,
    int? size,
    String? photoPath,
    String? type,
    String? note,
    List? maintenance,
    bool? isFavourite,
  }) {
    return Bicycle(
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

  factory Bicycle.fromMap(Map<String, dynamic> map) {
    return Bicycle(
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

  factory Bicycle.fromJson(String source) =>
      Bicycle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Bicycle(id: $id, model_price: $model_price, size: $size, photoPath: $photoPath, type: $type, note: $note, maintenance: $maintenance, isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(covariant Bicycle other) {
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

class Client {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String username;
  final String birthDate;
  Client({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.username,
    required this.birthDate,
  });

  Client copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? username,
    String? birthDate,
  }) {
    return Client(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      username: username ?? this.username,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'username': username,
      'birthDate': birthDate,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      username: map['username'] as String,
      birthDate: map['birthDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) =>
      Client.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Client(id: $id, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, username: $username, birthDate: $birthDate)';
  }

  @override
  bool operator ==(covariant Client other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phoneNumber == phoneNumber &&
        other.username == username &&
        other.birthDate == birthDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phoneNumber.hashCode ^
        username.hashCode ^
        birthDate.hashCode;
  }
}

class ModelPrice {
  final int id;
  final int price;
  final String model;
  ModelPrice({
    required this.id,
    required this.price,
    required this.model,
  });

  ModelPrice copyWith({
    int? id,
    int? price,
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
      price: map['price'] as int,
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

class BadFavoriteRespond extends FavouriteModel {
  final String message;
  final String status;
  final String localDateTime;
  BadFavoriteRespond({
    required this.message,
    required this.status,
    required this.localDateTime,
  });

  BadFavoriteRespond copyWith({
    String? message,
    String? status,
    String? localDateTime,
  }) {
    return BadFavoriteRespond(
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

  factory BadFavoriteRespond.fromMap(Map<String, dynamic> map) {
    return BadFavoriteRespond(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BadFavoriteRespond.fromJson(String source) =>
      BadFavoriteRespond.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BadFavoriteRespond(message: $message, status: $status, localDateTime: $localDateTime)';

  @override
  bool operator ==(covariant BadFavoriteRespond other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime;
  }

  @override
  int get hashCode =>
      message.hashCode ^ status.hashCode ^ localDateTime.hashCode;
}

class ExceptionFavoriteRespond extends FavouriteModel {
  final String message;
  ExceptionFavoriteRespond({
    required this.message,
  });
}

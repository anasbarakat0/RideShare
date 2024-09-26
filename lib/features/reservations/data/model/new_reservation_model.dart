// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Reservation {}

class ReservationBadRequest extends Reservation {
  final String message;
  final String status;
  final String localDateTime;
  ReservationBadRequest({
    required this.message,
    required this.status,
    required this.localDateTime,
  });

  ReservationBadRequest copyWith({
    String? message,
    String? status,
    String? localDateTime,
  }) {
    return ReservationBadRequest(
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

  factory ReservationBadRequest.fromMap(Map<String, dynamic> map) {
    return ReservationBadRequest(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationBadRequest.fromJson(String source) =>
      ReservationBadRequest.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ReservationBadRequest(message: $message, status: $status, localDateTime: $localDateTime)';

  @override
  bool operator ==(covariant ReservationBadRequest other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime;
  }

  @override
  int get hashCode =>
      message.hashCode ^ status.hashCode ^ localDateTime.hashCode;
}

class NewReservationModel extends Reservation {
  int bicycleId;
  int fromHubId;
  int toHubId;
  double duration;
  String startTime;
  String paymentMethod;
  NewReservationModel({
    required this.bicycleId,
    required this.fromHubId,
    required this.toHubId,
    required this.duration,
    required this.startTime,
    required this.paymentMethod,
  });

  NewReservationModel copyWith({
    int? bicycleId,
    int? fromHubId,
    int? toHubId,
    double? duration,
    String? startTime,
    String? paymentMethod,
  }) {
    return NewReservationModel(
      bicycleId: bicycleId ?? this.bicycleId,
      fromHubId: fromHubId ?? this.fromHubId,
      toHubId: toHubId ?? this.toHubId,
      duration: duration ?? this.duration,
      startTime: startTime ?? this.startTime,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bicycleId': bicycleId,
      'fromHubId': fromHubId,
      'toHubId': toHubId,
      'duration': duration,
      'startTime': startTime,
      'paymentMethod': paymentMethod,
    };
  }

  factory NewReservationModel.fromMap(Map<String, dynamic> map) {
    return NewReservationModel(
      bicycleId: map['bicycleId'] as int,
      fromHubId: map['fromHubId'] as int,
      toHubId: map['toHubId'] as int,
      duration: map['duration'] as double,
      startTime: map['startTime'] as String,
      paymentMethod: map['paymentMethod'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewReservationModel.fromJson(String source) =>
      NewReservationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewReservationModel(bicycleId: $bicycleId, fromHubId: $fromHubId, toHubId: $toHubId, duration: $duration, startTime: $startTime, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(covariant NewReservationModel other) {
    if (identical(this, other)) return true;

    return other.bicycleId == bicycleId &&
        other.fromHubId == fromHubId &&
        other.toHubId == toHubId &&
        other.duration == duration &&
        other.startTime == startTime &&
        other.paymentMethod == paymentMethod;
  }

  @override
  int get hashCode {
    return bicycleId.hashCode ^
        fromHubId.hashCode ^
        toHubId.hashCode ^
        duration.hashCode ^
        startTime.hashCode ^
        paymentMethod.hashCode;
  }
}

class ReservationSuccessRespond extends Reservation {
  final String message;
  final String status;
  final String localDateTime;
  final Body body;
  ReservationSuccessRespond({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  ReservationSuccessRespond copyWith({
    String? message,
    String? status,
    String? localDateTime,
    Body? body,
  }) {
    return ReservationSuccessRespond(
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

  factory ReservationSuccessRespond.fromMap(Map<String, dynamic> map) {
    return ReservationSuccessRespond(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
      body: Body.fromMap(map['body'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationSuccessRespond.fromJson(String source) =>
      ReservationSuccessRespond.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReservationSuccessRespond(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant ReservationSuccessRespond other) {
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
  final String client;
  final String bicycle;
  final String from;
  final String to;
  final double duration;
  final String startTime;
  final String? endTime;
  final String reservationStatus;
  final double price;
  Body({
    required this.id,
    required this.client,
    required this.bicycle,
    required this.from,
    required this.to,
    required this.duration,
    required this.startTime,
    this.endTime,
    required this.reservationStatus,
    required this.price,
  });

  Body copyWith({
    int? id,
    String? client,
    String? bicycle,
    String? from,
    String? to,
    double? duration,
    String? startTime,
    String? endTime,
    String? reservationStatus,
    double? price,
  }) {
    return Body(
      id: id ?? this.id,
      client: client ?? this.client,
      bicycle: bicycle ?? this.bicycle,
      from: from ?? this.from,
      to: to ?? this.to,
      duration: duration ?? this.duration,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      reservationStatus: reservationStatus ?? this.reservationStatus,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'client': client,
      'bicycle': bicycle,
      'from': from,
      'to': to,
      'duration': duration,
      'startTime': startTime,
      'endTime': endTime,
      'reservationStatus': reservationStatus,
      'price': price,
    };
  }

  factory Body.fromMap(Map<String, dynamic> map) {
    return Body(
      id: map['id'] as int,
      client: map['client'] as String,
      bicycle: map['bicycle'] as String,
      from: map['from'] as String,
      to: map['to'] as String,
      duration: map['duration'] as double,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] != null ? map['endTime'] as String : null,
      reservationStatus: map['reservationStatus'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Body.fromJson(String source) =>
      Body.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Body(id: $id, client: $client, bicycle: $bicycle, from: $from, to: $to, duration: $duration, startTime: $startTime, endTime: $endTime, reservationStatus: $reservationStatus, price: $price)';
  }

  @override
  bool operator ==(covariant Body other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.client == client &&
        other.bicycle == bicycle &&
        other.from == from &&
        other.to == to &&
        other.duration == duration &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.reservationStatus == reservationStatus &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        client.hashCode ^
        bicycle.hashCode ^
        from.hashCode ^
        to.hashCode ^
        duration.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        reservationStatus.hashCode ^
        price.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyWalletInfoModel {}

class ExceptionMyWalletInfo extends MyWalletInfoModel {
  final String message;
  ExceptionMyWalletInfo({
    required this.message,
  });
}

class NoWalletToShow extends MyWalletInfoModel {
  final String message;
  NoWalletToShow({
    required this.message,
  });
}

class GettingMyWalletInfo extends MyWalletInfoModel {
  String message;
  String status;
  String localDateTime;
  Body body;
  GettingMyWalletInfo({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  GettingMyWalletInfo copyWith({
    String? message,
    String? status,
    String? localDateTime,
    Body? body,
  }) {
    return GettingMyWalletInfo(
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

  factory GettingMyWalletInfo.fromMap(Map<String, dynamic> map) {
    return GettingMyWalletInfo(
      message: map['message'] as String,
      status: map['status'] as String,
      localDateTime: map['localDateTime'] as String,
      body: Body.fromMap(map['body'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory GettingMyWalletInfo.fromJson(String source) =>
      GettingMyWalletInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GettingMyWalletInfo(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant GettingMyWalletInfo other) {
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
  int id;
  double balance;
  String bankAccount;
  Body({
    required this.id,
    required this.balance,
    required this.bankAccount,
  });

  Body copyWith({
    int? id,
    double? balance,
    String? bankAccount,
  }) {
    return Body(
      id: id ?? this.id,
      balance: balance ?? this.balance,
      bankAccount: bankAccount ?? this.bankAccount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'balance': balance,
      'bankAccount': bankAccount,
    };
  }

  factory Body.fromMap(Map<String, dynamic> map) {
    return Body(
      id: map['id'] as int,
      balance: map['balance'] as double,
      bankAccount: map['bankAccount'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Body.fromJson(String source) =>
      Body.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Body(id: $id, balance: $balance, bankAccount: $bankAccount)';

  @override
  bool operator ==(covariant Body other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.balance == balance &&
        other.bankAccount == bankAccount;
  }

  @override
  int get hashCode => id.hashCode ^ balance.hashCode ^ bankAccount.hashCode;
}

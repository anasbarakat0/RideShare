// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreateNewWalletModel {
  final String bankAccount;
  final String securityCode;
  final String confirmSecurityCode;
  CreateNewWalletModel({
    required this.bankAccount,
    required this.securityCode,
    required this.confirmSecurityCode,
  });

  CreateNewWalletModel copyWith({
    String? bankAccount,
    String? securityCode,
    String? confirmSecurityCode,
  }) {
    return CreateNewWalletModel(
      bankAccount: bankAccount ?? this.bankAccount,
      securityCode: securityCode ?? this.securityCode,
      confirmSecurityCode: confirmSecurityCode ?? this.confirmSecurityCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bankAccount': bankAccount,
      'securityCode': securityCode,
      'confirmSecurityCode': confirmSecurityCode,
    };
  }

  factory CreateNewWalletModel.fromMap(Map<String, dynamic> map) {
    return CreateNewWalletModel(
      bankAccount: map['bankAccount'] as String,
      securityCode: map['securityCode'] as String,
      confirmSecurityCode: map['confirmSecurityCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateNewWalletModel.fromJson(String source) =>
      CreateNewWalletModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CreateNewWalletModel(bankAccount: $bankAccount, securityCode: $securityCode, confirmSecurityCode: $confirmSecurityCode)';

  @override
  bool operator ==(covariant CreateNewWalletModel other) {
    if (identical(this, other)) return true;

    return other.bankAccount == bankAccount &&
        other.securityCode == securityCode &&
        other.confirmSecurityCode == confirmSecurityCode;
  }

  @override
  int get hashCode =>
      bankAccount.hashCode ^
      securityCode.hashCode ^
      confirmSecurityCode.hashCode;
}

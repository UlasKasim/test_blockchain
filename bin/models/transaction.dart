import 'dart:convert';

class Transaction {
  String fromAddress;
  String toAddress;
  double amount;

  Transaction(
    this.fromAddress,
    this.toAddress,
    this.amount,
  );

  Map<String, dynamic> toMap() {
    return {
      'fromAddress': fromAddress,
      'toAddress': toAddress,
      'amount': amount,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      map['fromAddress'] ?? '',
      map['toAddress'] ?? '',
      map['amount']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) => Transaction.fromMap(json.decode(source));
}

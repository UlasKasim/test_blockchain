import 'dart:convert';

import 'package:crypto/crypto.dart';

import '_model_exporter.dart';

class Block {
  String timestamp;
  List<Transaction> transactions;
  String previousHash;
  int nonce = 0;

  Block({
    required this.timestamp,
    required this.transactions,
    this.previousHash = '',
  });

  String get hash => calculateHash();

  String calculateHash() => sha256
      .convert(
          utf8.encode('$previousHash$timestamp${transactions.map((e) => e.toJson()).join()}$nonce'))
      .toString();

  mineBlock(int difficulty) {
    while (hash.substring(0, difficulty) != List.generate(difficulty, (i) => '0').join()) {
      nonce++;
    }

    print("Block mined: " + hash);
  }
}

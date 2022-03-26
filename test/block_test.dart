import 'package:test/scaffolding.dart';

import '../bin/models/_model_exporter.dart';

void main() {
  var testBlockchain = BlockChain();

  test('blockTest', () {
    testBlockchain.createTransaction(Transaction('address1', 'address2', 100));
    testBlockchain.createTransaction(Transaction('address2', 'address1', 50));

    print('Starting miner');
    testBlockchain.minePendingTransactions('main');

    print('Balance of main is ${testBlockchain.getBalanceOfAddress('main')}');

    print('Starting miner again');
    testBlockchain.minePendingTransactions('main');

    print('Balance of main is ${testBlockchain.getBalanceOfAddress('main')}');
    print('Balance of address1 is ${testBlockchain.getBalanceOfAddress('address1')}');
    print('Balance of address2 is ${testBlockchain.getBalanceOfAddress('address2')}');
  });
}

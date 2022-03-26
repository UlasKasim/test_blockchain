import '_model_exporter.dart';

class BlockChain {
  List<Block> chain = [Block(timestamp: '26.03.2022', transactions: [], previousHash: '0')];
  List<Transaction> pendingTransactions = [];
  double miningReward = 100.0;
  int difficulty = 2;

  Block getLatestBlock() {
    return chain.last;
  }

  void minePendingTransactions(String miningRewardAddress) {
    var block = Block(
      timestamp: DateTime.now().toIso8601String(),
      transactions: pendingTransactions,
    ); //in this example miners doesnt pick transactions they want to include
    block.mineBlock(difficulty);

    print('block successfully mined');
    chain.add(block);

    pendingTransactions = [
      Transaction('', miningRewardAddress, miningReward),
    ];
  }

  void createTransaction(Transaction transaction) {
    pendingTransactions.add(transaction);
  }

  double getBalanceOfAddress(String address) {
    double balance = 0;

    for (var block in chain) {
      for (var transaction in block.transactions) {
        if (transaction.fromAddress == address) {
          balance -= transaction.amount;
        }
        if (transaction.toAddress == address) {
          balance += transaction.amount;
        }
      }
    }

    return balance;
  }

  bool isChainValid() {
    for (var i = 1; i < chain.length; i++) {
      var currentBlock = chain[i];
      var previousBlock = chain[i - 1];

      if (currentBlock.previousHash != previousBlock.hash) {
        return false;
      }
    }

    return true;
  }
}

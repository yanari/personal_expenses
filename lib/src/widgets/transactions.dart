import 'package:flutter/material.dart';

import 'package:personal_expenses/src/models/transaction.dart';

import 'package:personal_expenses/src/widgets/new_transaction.dart';
import 'package:personal_expenses/src/widgets/transaction_list.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final List<Transaction> _transactions = [];

  void _onTransactionAdded(Transaction transaction) {
    setState(() => _transactions.add(transaction));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(onAddedTransaction: _onTransactionAdded),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}

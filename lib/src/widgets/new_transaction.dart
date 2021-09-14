import 'package:flutter/material.dart';

import 'package:personal_expenses/src/models/transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function(Transaction transaction) onAddedTransaction;

  NewTransaction({
    Key? key,
    required this.onAddedTransaction,
  }) : super(key: key);

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _onButtonPressed() {
    final _title = _titleController.text;
    final _amount = double.parse(_amountController.text);

    if (_title.isEmpty || _amount < 0) return;

    onAddedTransaction(
      Transaction(
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        date: DateTime.now(),
        id: DateTime.now().toString(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _onButtonPressed(),
            ),
            TextButton(
              onPressed: _onButtonPressed,
              child: const Text('Add'),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
          ],
        ),
      ),
      elevation: 5,
    );
  }
}

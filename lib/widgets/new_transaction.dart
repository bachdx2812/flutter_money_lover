import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final void Function(String title, double amount) createNewTransaction;

  NewTransaction(this.createNewTransaction, {super.key});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submit() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    createNewTransaction(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              // onSubmitted: (_) => submit,
            ),
            ElevatedButton(
              onPressed: submit,
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.orange)),
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}

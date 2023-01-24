import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final void Function(String title, double amount) createNewTransaction;

  NewTransaction(this.createNewTransaction, {super.key});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
            ),
            ElevatedButton(
              onPressed: () => {
                createNewTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                )
              },
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final void Function(String title, double amount) createNewTransaction;

  const NewTransaction(this.createNewTransaction, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submit() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    widget.createNewTransaction(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
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
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ],
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

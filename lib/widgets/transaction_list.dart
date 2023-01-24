import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map((transaction) => Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.orange,
                        width: 2,
                      )),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '¥${transaction.amount}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transaction.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('y年M月d日').format(transaction.date),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}

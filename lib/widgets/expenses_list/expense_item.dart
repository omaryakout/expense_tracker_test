import 'package:flutter/material.dart';

import '../../models/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem({super.key, required this.expense});
  ExpenseModel expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Text(expense.title,style: Theme.of(context).textTheme.titleLarge,),
          SizedBox(height: 10,),
          Row(
            children: [Text('\$${expense.amount.toStringAsFixed(2)}'),
            Spacer(flex: 2,),
            Icon(categoryIcons[expense.category]),
            SizedBox(width: 5,),
            Text(expense.formatDate)
            ],
          )
        ]),
      ),
    );
  }
}

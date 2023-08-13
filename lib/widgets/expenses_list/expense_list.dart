import 'package:flutter/material.dart';
import 'package:expense_tracker_test/models/expense_model.dart';

import 'package:expense_tracker_test/widgets/expenses_list/expense_item.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList(
      {super.key, required this.expenseList, required this.deleteExpense});
  List<ExpenseModel> expenseList;
  final void Function(ExpenseModel expense) deleteExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenseList[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),),
        onDismissed: (direction) {
          deleteExpense(expenseList[index]);
        },
        child: ExpenseItem(expense: expenseList[index]),
      ),
    );
  }
}

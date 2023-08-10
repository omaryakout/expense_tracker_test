import 'package:flutter/material.dart';
import 'new_expense.dart';
import '../models/expense_model.dart';
import 'expenses_list/expense_list.dart';
import 'new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
      title: 'Flutter Course',
      amount: 19.99,
      dateTime: DateTime.now(),
      category: Category.food,
    ),
    ExpenseModel(
      title: 'Cinema',
      amount: 15.69,
      dateTime: DateTime.now(),
      category: Category.tax,
    ),
  ];

  void showBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              addExpenseFromHnak: addExpense,
            ));
  }

  void addExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void deleteCategory(ExpenseModel expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Expense ${expenseIndex + 1} deleted by me for test'),
      duration: Duration(seconds: 5),
      action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: showBottomSheet, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ExpenseList(
            deleteExpense: deleteCategory,
            expenseList: _registeredExpenses,
          ))
        ],
      ),
    );
  }
}

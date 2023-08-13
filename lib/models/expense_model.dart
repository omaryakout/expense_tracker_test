import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { cinema, learn, food, tax }

var kk = 'dddd';

const categoryIcons = {
  Category.cinema: Icons.filter_drama,
  Category.food: Icons.food_bank,
  Category.tax: Icons.money,
  Category.learn: Icons.computer,
};

class ExpenseModel {
  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.dateTime,
      required this.category})
      : id = uuid.v4();

  final String title;
  final double amount;
  final DateTime dateTime;
  final String id;
  final Category category;

  String get formatDate {
    return formatter.format(dateTime);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.expenses, required this.category});
  final Category category;
  final List<ExpenseModel> expenses;

  ExpenseBucket.forCategory(List<ExpenseModel> allExpense, this.category)
      : expenses = allExpense.where((expense) => expense.category == category).toList();

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}

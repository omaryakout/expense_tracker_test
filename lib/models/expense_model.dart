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

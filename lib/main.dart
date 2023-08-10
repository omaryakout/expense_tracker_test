import 'package:flutter/material.dart';
import 'models/expense_model.dart';
import 'widgets/expenses.dart';

import 'widgets/expenses_list/expense_item.dart';

void main() {
  
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: Expenses(),
  ));
}

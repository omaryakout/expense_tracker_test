import 'package:flutter/material.dart';
import 'models/expense_model.dart';
import 'widgets/expenses.dart';

import 'widgets/expenses_list/expense_item.dart';
var kColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 105, 69, 234))

void main() {
  
  runApp(MaterialApp(
    theme: ThemeData().copyWith(useMaterial3: true,
    colorScheme: kColorScheme,
    appBarTheme: AppBarTheme().copyWith(
      backgroundColor: kColorScheme.onSecondary,
      foregroundColor:kColorScheme.onPrimary ,
    ).
    ),
    home: Expenses(),
  ));
}

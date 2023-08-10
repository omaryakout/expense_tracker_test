import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_test/models/expense_model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpenseFromHnak});
  final void Function(ExpenseModel expenseFromHnak) addExpenseFromHnak;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory = Category.food;

  void selectDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void submitData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (amountIsInvalid ||
        _selectedDate == null ||
        _titleController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('please enter requirred values'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('okay'),
              ),
            ],
          );
        },
      );
      return;
    }
    widget.addExpenseFromHnak(ExpenseModel(
        title: _titleController.text,
        amount: enteredAmount,
        dateTime: _selectedDate!,
        category: _selectedCategory!));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.fromLTRB(16, 42, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(label: Text('ENTER TITLE')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(label: Text('ENTER AMOUNT')),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: selectDate,
                      icon: const Icon(Icons.calendar_month),
                    ),
                    Text(_selectedDate == null
                        ? 'selectDate'
                        : formatter.format(_selectedDate!)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              Expanded(
                  child: TextButton(
                onPressed: submitData,
                child: const Text('save'),
              )),
              Expanded(
                  child: TextButton(
                child: const Text('cancel'),
                onPressed: () => Navigator.pop(context),
              )),
            ],
          )
        ],
      ),
    );
  }
}

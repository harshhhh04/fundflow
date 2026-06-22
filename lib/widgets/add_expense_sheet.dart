import 'package:flutter/material.dart';
import '../models/expense.dart';

class AddExpenseSheet extends StatefulWidget {
  const AddExpenseSheet({super.key});

  @override
  State<AddExpenseSheet> createState() => _AddExpenseSheetState();
}

class _AddExpenseSheetState extends State<AddExpenseSheet> {
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: "Category"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Expense Saved");
                
                final double? amount = double.tryParse(_amountController.text);
                final String title = _categoryController.text.isNotEmpty 
                    ? _categoryController.text 
                    : (_descriptionController.text.isNotEmpty ? _descriptionController.text : "Unknown");
                
                if (amount != null) {
                  final expense = Expense(
                    title: title,
                    amount: amount,
                  );
                  Navigator.pop(context, expense);
                } else {
                  Navigator.pop(context);
                }
              },
              child: const Text("Save"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddExpenseSheet extends StatelessWidget {
  const AddExpenseSheet({super.key});

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
            const TextField(
              decoration: InputDecoration(labelText: "Amount"),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(labelText: "Category"),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Expense Saved");
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

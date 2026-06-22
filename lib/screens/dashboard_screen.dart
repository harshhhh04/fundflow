import 'package:flutter/material.dart';
import '../widgets/info_card.dart';
import '../widgets/add_expense_sheet.dart';
import '../models/expense.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Expense> expenses = [];

  final double income = 10000; // Default income

  @override
  Widget build(BuildContext context) {
    double totalExpenses = expenses.fold(0, (sum, item) => sum + item.amount);
    double balance = income - totalExpenses;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("FundFlow"),
      ),
      backgroundColor: const Color(0xFFF7F7FB),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 20),

            InfoCard(
              title: "Balance",
              value: "₹${balance.toStringAsFixed(0)}",
            ),

            const SizedBox(height: 16),

            const InfoCard(
              title: "Days Left",
              value: "30",
            ),

            const SizedBox(height: 16),

            const InfoCard(
              title: "Safe Daily Spend",
              value: "₹0/day",
            ),

            const SizedBox(height: 30),

            const Text(
              "Recent Expenses",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 10),
            
            ...expenses.map((expense) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        expense.title,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "₹${expense.amount.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {
                final newExpense = await showModalBottomSheet<Expense>(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return const AddExpenseSheet();
                  },
                );

                if (newExpense != null) {
                  setState(() {
                    expenses.add(newExpense);
                  });
                }
              },
              child: const Text("Add Expense"),
            ),
          ],
        ),
      ),
    );
  }
}

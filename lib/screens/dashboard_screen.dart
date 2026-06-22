import 'package:flutter/material.dart';
import '../widgets/info_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("FundFlow"),
      ),
      backgroundColor: const Color(0xFFF7F7FB),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 20),

            const InfoCard(
              title: "Balance",
              value: "₹0",
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

            ElevatedButton(
              onPressed: () {},
              child: const Text("Add Expense"),
            ),
          ],
        ),
),
    );
  }
}

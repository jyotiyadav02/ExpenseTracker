import 'package:expenseapp/chart/chart.dart';
import 'package:expenseapp/main.dart';
import 'package:expenseapp/widgets/expenses_list.dart';
import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> { 
  final List<Expense> _registerdExpenses = [
    Expense(
        title: "fluter",
        amount: 120,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "pop",
        amount: 10,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(onAddExpense: _addExpense);
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerdExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerdExpenses.indexOf(expense);
    setState(
      () {
        _registerdExpenses.remove(expense);
      },
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 45),
        content: const Text("Expense deleted.."),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registerdExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    //  print( MediaQuery.of(context).size.height);
    Widget mainContent = const Center(
      child: Text("No expenses found Start adding some."),
    );
    if (_registerdExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerdExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kDarkColorScheme.inversePrimary,
          title: const Text(
            "Expense Tracker",
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(255, 233, 231, 226),
            ),
          ),
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 237, 231, 231)),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
          ]),
      body: width < 600
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chart(expenses: _registerdExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registerdExpenses)),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}

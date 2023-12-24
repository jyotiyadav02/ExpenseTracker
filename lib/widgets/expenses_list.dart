import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(color:Theme.of(context).colorScheme.onError,margin:const EdgeInsets.fromLTRB(20, 10, 20, 10)),
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
      
          child: ExpenseItem(
            expense: expenses[index],
          ),
        );
      },
    );
  }
}

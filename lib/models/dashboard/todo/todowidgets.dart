import 'package:flutter/material.dart';

class TodoDoneWidget extends StatelessWidget {
  final IconData iconData;
  final int count;
  final String label;

  const TodoDoneWidget({
    super.key,
    required this.iconData,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 30.0,
          height: 30.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          count.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2.0),
        Text(label),
      ],
    );
  }
}

class TodoItem {
  final String task;
  final String category;
  final String date;
  final String status;

  TodoItem({
    required this.task,
    required this.category,
    required this.date,
    required this.status,
  });
}

class TodoListWidget extends StatelessWidget {
  final String month;
  final String year;
  final List<TodoItem> todoItems;

  const TodoListWidget({
    super.key,
    required this.month,
    required this.year,
    required this.todoItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Row(
            children: [
              Text(
                '$month $year',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: todoItems.length,
            itemBuilder: (context, index) {
              TodoItem item = todoItems[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                leading: Checkbox(
                  value: item.status == 'Done',
                  onChanged: (value) {
                    // Handle checkbox value change
                  },
                ),
                title: Text(
                  item.task,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(item.category),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Edit action
                      },
                      child: const Icon(Icons.edit),
                    ),
                    const SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: () {
                        // Delete action
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

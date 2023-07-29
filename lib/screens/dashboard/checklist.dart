import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viwaha_lk/screens/dashboard/checklist_view.dart';

// Previously created views
@RoutePage()
class CoupleDashboardToDoList extends StatelessWidget {
  const CoupleDashboardToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ToDoList(),
          ],
        ),
      ),
    );
  }
}

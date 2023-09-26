import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../models/dashboard/todo/todowidgets.dart';

@RoutePage()
class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add New To Do action

                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Create Task',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Form(
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          focusNode:
                                              FocusNode(canRequestFocus: false),
                                          decoration: const InputDecoration(
                                            labelText: 'Task',
                                            hintText: 'Write task here',
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                        DropdownButtonFormField<String>(
                                          decoration: const InputDecoration(
                                            labelText: 'Category',
                                          ),
                                          items: const [
                                            DropdownMenuItem(
                                              value: 'Engagement',
                                              child: Text('Engagement'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Wedding',
                                              child: Text('Wedding'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'After party',
                                              child: Text('After party'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Homecoming',
                                              child: Text('Homecoming'),
                                            ),
                                          ],
                                          onChanged: (String? value) {},
                                        ),
                                        const SizedBox(height: 16.0),
                                        TextFormField(
                                          focusNode:
                                              FocusNode(canRequestFocus: false),
                                          decoration: const InputDecoration(
                                            labelText: 'Task Date',
                                            hintText: 'Task Date',
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add to-do task action
                                          },
                                          child: const Text('Add Guest'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.add),
                          // SizedBox(width: 5.0),
                          Text('Add New'),
                        ],
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'You have completed 5 out of 80 tasks',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    LinearProgressIndicator(
                      value: 0.25, // Update the progress value as needed
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TodoDoneWidget(
                    iconData: Icons.check,
                    count: 1,
                    label: 'Done',
                  ),
                  SizedBox(width: 10.0),
                  TodoDoneWidget(
                    iconData: Icons.access_time,
                    count: 80,
                    label: 'To Do',
                  ),
                ],
              ),
            ],
          ),
        ),
        TodoListWidget(
          month: 'November',
          year: '2020',
          todoItems: [
            TodoItem(
              task: 'Plan your engagement party',
              category: 'Engagement',
              date: 'September 18, 2020',
              status: 'Done',
            ),
            TodoItem(
              task: 'Plan your engagement party',
              category: 'Engagement',
              date: 'September 18, 2020',
              status: 'Awaiting for Approval',
            ),
          ],
        ),
        TodoListWidget(
          month: 'December',
          year: '2020',
          todoItems: [
            TodoItem(
              task: 'Plan your engagement party',
              category: 'Engagement',
              date: 'September 18, 2020',
              status: 'Awaiting for Approval',
            ),
            TodoItem(
              task: 'Plan your engagement party',
              category: 'Engagement',
              date: 'September 18, 2020',
              status: 'Awaiting for Approval',
            ),
          ],
        ),
      ],
    );
  }
}

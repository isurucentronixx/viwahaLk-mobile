import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viwaha_lk/screens/dashboard/guest_list_view.dart';

// Previously created views

@RoutePage()
class CoupleDashboardGuestList extends StatelessWidget {
  const CoupleDashboardGuestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guest List'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GuestListView(),
          ],
        ),
      ),
    );
  }
}

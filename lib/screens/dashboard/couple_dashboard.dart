import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viwaha_lk/screens/dashboard/dashboard.dart';

// Previously created views

@RoutePage()
class CoupleDashboard extends StatelessWidget {
  const CoupleDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Couple Dashboard'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CoupleInfoSection(),
            SizedBox(height: 20),
            VendorTeamSection(),
            SizedBox(height: 20),
            CheckListSection(),
            GuestListSection(),
            BudgetSection(),
            WeddingDetailSection(),
          ],
        ),
      ),
    );
  }
}
